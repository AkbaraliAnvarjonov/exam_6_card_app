import 'package:exam_6_card_app/data/models/card_model.dart';

abstract class CardEvent {}

class GetCards extends CardEvent {}

class AddCard extends CardEvent {
  final CardModel cardModel;
  AddCard({required this.cardModel});
}

class DeleteCardById extends CardEvent {
  final int id;
  DeleteCardById({required this.id});
}

class UpdateCardById extends CardEvent {
  final CardModel cardModel;
  UpdateCardById({required this.cardModel});
}
