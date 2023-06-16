import 'package:flutter/material.dart';

class MyContinent {
  static List<String> continentsImage = [
    "assets/continents/Europe.svg",
    "assets/continents/Asia.svg",
    "assets/continents/NorthAmerica.svg",
    "assets/continents/SouthAmerica.svg",
    "assets/continents/Africa.svg",
    "assets/continents/Australia.svg",
  ];
  static List<String> continentsName = [
    "Europe",
    "Asia",
    "North America",
    "South America",
    "Africa",
    "Australia",
  ];

  static List<Color> continentColor = [
    const Color.fromRGBO(0, 255, 0, 1.0),
    const Color.fromRGBO(255, 0, 0, 1.0),
    const Color.fromRGBO(255, 255, 0, 1.0),
    const Color.fromRGBO(255, 0, 255, 1.0),
    const Color.fromRGBO(0, 123, 255, 1.0),
    const Color.fromRGBO(255, 165, 0, 1.0),
  ];
}
