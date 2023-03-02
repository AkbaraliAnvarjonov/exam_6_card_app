import 'package:exam_6_card_app/data/models/card_fields.dart';
import 'package:exam_6_card_app/data/models/card_model.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabase {
  static String tableName = "cards";
  static LocalDatabase getInstance = LocalDatabase._init();
  Database? _database;

  LocalDatabase._init();

  Future<Database> getDb() async {
    if (_database == null) {
      _database = await _initDB("cards.db");
      return _database!;
    }
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, fileName);

    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        String idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
        String textType = "TEXT";
        String intType = "INTEGER";
        String listType = "BLOB";

        await db.execute('''
        CREATE TABLE $tableName (
            ${CardFields.id} $idType,
            ${CardFields.cardName} $textType,
            ${CardFields.cardNumber} $intType,
            ${CardFields.expireDate} $textType,
            ${CardFields.gradient} $listType,
            ${CardFields.iconImage} $textType,
            ${CardFields.moneyAmount} $textType,
            ${CardFields.owner} $textType
            )
            ''');
      },
    );
    return database;
  }

  static Future<CardModel> insertCard({required CardModel cardModel}) async {
    var database = await getInstance.getDb();
    int id = await database.insert(tableName, cardModel.toJson());
    debugPrint("ADD BOLDI HAMMASI YAXSHI");
    return cardModel.copyWith(id: id);
  }

  static Future<List<CardModel>> getCards() async {
    var database = await getInstance.getDb();
    var listCountries = await database.query(
      tableName,
      columns: [
        CardFields.id,
        CardFields.cardName,
        CardFields.cardNumber,
        CardFields.expireDate,
        CardFields.gradient,
        CardFields.iconImage,
        CardFields.moneyAmount,
        CardFields.owner
      ],
    );
    var list = listCountries.map((e) => CardModel.fromJson(e)).toList();

    return list;
  }

  static Future<int> deleteAll() async {
    var database = await getInstance.getDb();
    return await database.delete(tableName);
  }

  static Future<int> deleteCardById(int id) async {
    var database = await getInstance.getDb();
    return await database.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
