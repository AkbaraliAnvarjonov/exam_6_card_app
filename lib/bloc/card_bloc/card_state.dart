import 'package:exam_6_card_app/data/models/card_model.dart';

abstract class CardState {}

class CardInitial extends CardState {}

class CardLoadInProgress extends CardState {}

class CardLoadSuccess extends CardState {
  CardLoadSuccess({required this.cards});

  final List<CardModel> cards;
}
