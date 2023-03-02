import 'package:exam_6_card_app/bloc/card_bloc/card_bloc.dart';
import 'package:exam_6_card_app/bloc/card_bloc/card_event.dart';
import 'package:exam_6_card_app/data/models/card_model.dart';
import 'package:exam_6_card_app/ui/edit_page/edit_page.dart';
import 'package:exam_6_card_app/utils/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardWidget extends StatelessWidget {
  final CardModel data;
  const CardWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Center(
          child: Stack(
            children: [
              Container(
                height: 220,
                width: 420,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(data.gradientA),
                    Color(data.gradientB),
                  ]),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              SvgPicture.asset(
                AppIcon.card,
                color: const Color(0xFF121212),
                height: 200,
                width: 420,
              ),
              SizedBox(
                height: 220,
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EditCardScreen(cardModel: data),
                                  ));
                            },
                            icon: Icon(Icons.edit)),
                        IconButton(
                            onPressed: (() {
                              _deleteDialog(context);
                            }),
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ))
                      ]),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppIcon.card,
                            width: 50,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Text(data.cardNumber,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w100)),
                              const SizedBox(height: 10),
                              Text(
                                data.expireDate,
                                style: const TextStyle(color: Colors.white),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                data.cardName,
                                style: const TextStyle(color: Colors.white),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: const [
                          Text(
                            "Current Balance",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "UZS ${data.moneyAmount}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  _deleteDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("O'chirishni xohlaysizmi?"),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Yo'q")),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<CardBloc>(context)
                      .add(DeleteCardById(id: data.id ?? 0));
                  BlocProvider.of<CardBloc>(context).add(GetCards());
                  Navigator.pop(context);
                },
                child: const Text("Ha"))
          ],
        );
      },
    );
  }
}
