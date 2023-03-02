import 'package:exam_6_card_app/utils/card_number_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardNumberFieald extends StatelessWidget {
  String name;
  ValueChanged onChanged;
  String hintText;
  TextInputType txtType;
  CardNumberFieald(
      {super.key,
      required this.name,
      required this.hintText,
      required this.onChanged,
      required this.txtType});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          child: Text(
            name,
            style: const TextStyle(color: Colors.blue),
          ),
        ),
        SizedBox(
          height: 50,
          child: TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CardNumberFormatter(),
            ],
            keyboardType: txtType,
            onChanged: onChanged,
            decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
        ),
      ],
    );
  }
}
