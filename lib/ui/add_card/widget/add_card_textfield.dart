import 'package:flutter/material.dart';

class AddCardTextfield extends StatelessWidget {
  String name;
  ValueChanged onChanged;
  String hintText;
  TextInputType txtType;
  AddCardTextfield(
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
