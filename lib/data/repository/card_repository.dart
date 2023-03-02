import 'package:exam_6_card_app/data/local_db/local_db.dart';
import 'package:exam_6_card_app/data/models/card_model.dart';
import 'package:flutter/material.dart';

class CardRepository {
  Future<List<CardModel>> getAllCards() => LocalDatabase.getCards();

  Future deleteCards() => LocalDatabase.deleteAll();

  Future<CardModel> insertCard(CardModel cardModel) =>
      LocalDatabase.insertCard(cardModel: cardModel);

  Future deleteCardById(int id) => LocalDatabase.deleteCardById(id);

  Future addCard(CardModel cardModel) =>
      LocalDatabase.insertCard(cardModel: cardModel);

  Future updateCard(CardModel cardModel) =>
      LocalDatabase.updateCardById(cardModel);
}
