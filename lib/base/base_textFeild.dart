import 'package:flutter/material.dart';

class BaseTextfeild extends StatelessWidget {
  TextEditingController controller;
  String label;
   BaseTextfeild({super.key,required this.controller,required this.label});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(label),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        )
      ),
    );
  }
}
