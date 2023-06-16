import 'package:flutter/material.dart';

import '../models/Continents.dart';

class MyStyle {
  static TextStyle capitalisOfYheWorld =
      const TextStyle(fontWeight: FontWeight.w700);

  static TextStyle country = const TextStyle(
      color: Colors.yellow, fontSize: 30, fontWeight: FontWeight.w700);

  static const TextStyle leftStyle =
      TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.red);

  static const TextStyle rightStyle =
      TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.green);

  static const TextStyle middleStyle =
      TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: Colors.black);

  static const TextStyle appBarAction =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w500);

  static const TextStyle variationStyle =
      TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.amber);

  static TextStyle continentNameStyleFunc(int index) {
    TextStyle continentNameStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: MyContinent.continentColor[index],
    );
    return continentNameStyle;
  }
}
