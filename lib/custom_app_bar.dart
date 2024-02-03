import 'package:flutter/material.dart';

AppBar customAppBar(String name) {
  return AppBar(
    scrolledUnderElevation: 0,
    centerTitle: true,
    title: Text(
      name,
      style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
    ),
  );
}
