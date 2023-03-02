import 'package:exam_6_card_app/bloc/card_bloc/card_bloc.dart';
import 'package:exam_6_card_app/bloc/card_bloc/card_state.dart';
import 'package:exam_6_card_app/data/models/card_model.dart';
import 'package:exam_6_card_app/ui/add_card/add_card_page.dart';
import 'package:exam_6_card_app/ui/card_page/widget/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards Info"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddCardScreen(),
                    ));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: BlocBuilder<CardBloc, CardState>(
        builder: (context, state) {
          if (state is CardLoadInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CardLoadSuccess) {
            List<CardModel> item = state.cards;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.cards.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CardWidget(data: item[index]));
              },
            );
          }
          return const Text("Salom");
        },
      ),
    );
  }
}
