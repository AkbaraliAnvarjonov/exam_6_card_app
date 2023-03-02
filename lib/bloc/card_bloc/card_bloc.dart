import 'package:exam_6_card_app/bloc/card_bloc/card_event.dart';
import 'package:exam_6_card_app/bloc/card_bloc/card_state.dart';
import 'package:exam_6_card_app/data/models/card_model.dart';
import 'package:exam_6_card_app/data/repository/card_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc(this.cardRepository) : super((CardInitial())) {
    on<GetCards>(_fetchCards);
  }

  final CardRepository cardRepository;

  _fetchCards(GetCards event, Emitter<CardState> emit) async {
    emit(CardLoadInProgress());

    List<CardModel> cards = await cardRepository.getAllCards();

    emit(CardLoadSuccess(cards: cards));
  }

  // _updateCachedCountries(List<CountryModel> countries) async {
  //   int deletedCount = await countriesRepository.deleteCachedCountries();
  //   print("O'CHIRILGANLAR SONI:$deletedCount");
  //   for (var country in countries) {
  //     await countriesRepository.insertCountryToDb(country);
  //   }
  // }
}
