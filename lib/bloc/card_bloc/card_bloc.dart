import 'package:exam_6_card_app/bloc/card_bloc/card_event.dart';
import 'package:exam_6_card_app/bloc/card_bloc/card_state.dart';
import 'package:exam_6_card_app/data/models/card_model.dart';
import 'package:exam_6_card_app/data/repository/card_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc(this.cardRepository) : super((CardInitial())) {
    on<GetCards>(_fetchCards);
    on<AddCard>(_addCard);
    on<DeleteCardById>(_deleteCard);
    on<UpdateCardById>(_updateCard);
  }

  final CardRepository cardRepository;

  _fetchCards(GetCards event, Emitter<CardState> emit) async {
    emit(CardLoadInProgress());

    List<CardModel> cards = await cardRepository.getAllCards();

    emit(CardLoadSuccess(cards: cards));
  }

  _addCard(AddCard event, Emitter<CardState> emit) async {
    emit(AddCardProgres());
    await cardRepository.addCard(event.cardModel);

    emit(AddCardSuccess());
  }

  _deleteCard(DeleteCardById event, Emitter<CardState> emit) async {
    emit(DeleteCardProgres());
    await cardRepository.deleteCardById(event.id);

    emit(DeleteCardSuccess());
  }

  _updateCard(UpdateCardById event, Emitter<CardState> emit) async {
    emit(UpdateCardProgres());
    await cardRepository.updateCard(event.cardModel);

    emit(UpdateCardSuccess());
  }
}
