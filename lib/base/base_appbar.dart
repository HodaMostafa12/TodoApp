import 'package:flutter/material.dart';

PreferredSizeWidget baseAppBar(String title) {
  return AppBar(
    title: Text(title, style: const TextStyle(color: Colors.black)),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}
