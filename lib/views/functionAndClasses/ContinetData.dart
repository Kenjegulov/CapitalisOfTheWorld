import 'dart:math';

import '../../models/CountriesAndCapitals.dart';
import '../../models/continents/continent.dart';

class ContinentData {
  static List<Continent> continent(String continent) {
    List<Continent>? continentList;
    if (continent == "asia") {
      continentList = CountriesAndCapitals.asiaList;
    } else if (continent == "europe") {
      continentList = CountriesAndCapitals.europeList;
    } else if (continent == "africa") {
      continentList = CountriesAndCapitals.africaList;
    } else if (continent == "australia") {
      continentList = CountriesAndCapitals.australiaList;
    } else if (continent == "south america") {
      continentList = CountriesAndCapitals.southAmericaList;
    } else {
      continentList = CountriesAndCapitals.northAmericaList;
    }
    return continentList;
  }
}
