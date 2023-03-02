import 'package:exam_6_card_app/bloc/card_bloc/card_bloc.dart';
import 'package:exam_6_card_app/bloc/card_bloc/card_event.dart';
import 'package:exam_6_card_app/data/models/card_model.dart';
import 'package:exam_6_card_app/data/models/color_model.dart';
import 'package:exam_6_card_app/ui/add_card/widget/add_card_textfield.dart';
import 'package:exam_6_card_app/ui/add_card/widget/card_number_fieald.dart';
import 'package:exam_6_card_app/ui/card_page/widget/card_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  int colorIndex = 0;

  String cardNumber = "";
  String expireDate = "";
  String cardName = "";
  String owner = "";
  Color pickerColor = Colors.white;
  Color currentColor = Colors.black;
  bool isChoosen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Card Page")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardWidget(
                      data: CardModel(
                          iconImage: "",
                          cardName: cardName,
                          cardNumber: cardNumber,
                          owner: owner,
                          expireDate: expireDate,
                          moneyAmount: 10000,
                          gradientA: isChoosen
                              ? int.parse(
                                  currentColor.toString().substring(6, 16))
                              : ColorModels.colors[colorIndex].colorA,
                          gradientB: isChoosen
                              ? int.parse(
                                  currentColor.toString().substring(6, 16))
                              : ColorModels.colors[colorIndex].colorB)),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 50,
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 12);
                      },
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: ColorModels.colors.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          borderRadius: BorderRadius.circular(25),
                          onTap: () {
                            setState(() {
                              colorIndex = index;
                            });
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                gradient: LinearGradient(colors: [
                                  Color(ColorModels.colors[index].colorA),
                                  Color(ColorModels.colors[index].colorB)
                                ])),
                          ),
                        );
                      },
                    ),
                  ),
                  Center(
                      child: ElevatedButton(
                          onPressed: () {
                            _colorDialog();
                          },
                          child: const Text("Choose Color"))),
                  CardNumberFieald(
                    txtType: TextInputType.number,
                    name: "Karta raqami",
                    hintText: "0000 0000 0000 0000",
                    onChanged: (value) {
                      cardNumber = value;
                      setState(() {});
                    },
                  ),
                  AddCardTextfield(
                    txtType: TextInputType.number,
                    name: "Amal qilish muddati",
                    hintText: "00/00",
                    onChanged: (value) {
                      expireDate = value;
                      setState(() {});
                    },
                  ),
                  AddCardTextfield(
                    txtType: TextInputType.text,
                    name: "Karta nomi",
                    hintText: "My Card",
                    onChanged: (value) {
                      cardName = value;
                      setState(() {});
                    },
                  ),
                  AddCardTextfield(
                    txtType: TextInputType.text,
                    name: "Karta egasi to'liq ism sharifi",
                    hintText: "Palonchiyev Pistonchi",
                    onChanged: (value) {
                      owner = value;
                      setState(() {});
                    },
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CardBloc>(context).add(AddCard(
                            cardModel: CardModel(
                                cardName: cardName,
                                cardNumber: cardNumber,
                                owner: owner,
                                expireDate: expireDate,
                                moneyAmount: 0,
                                gradientA: isChoosen
                                    ? int.parse(currentColor
                                        .toString()
                                        .substring(6, 16))
                                    : ColorModels.colors[colorIndex].colorA,
                                gradientB: isChoosen
                                    ? int.parse(currentColor
                                        .toString()
                                        .substring(6, 16))
                                    : ColorModels.colors[colorIndex].colorB,
                                iconImage: "aa")));
                        BlocProvider.of<CardBloc>(context).add(GetCards());
                        Navigator.pop(context);
                      },
                      child: const Text("Add Card"),
                    ),
                  ),
                ],
              ),
            ),
          )),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  _colorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Pick a color"),
          content: ColorPicker(
            pickerColor: pickerColor,
            onColorChanged: (Color value) {
              pickerColor = value;
            },
          ),
          actions: <Widget>[
            Center(
              child: ElevatedButton(
                child: const Text('Got it'),
                onPressed: () {
                  setState(() {
                    isChoosen = true;
                    currentColor = pickerColor;
                  });
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
