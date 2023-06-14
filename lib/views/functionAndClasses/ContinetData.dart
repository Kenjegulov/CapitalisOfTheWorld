import 'dart:math';

import '../../models/CountriesAndCapitals.dart';
import '../../models/continents/continent.dart';

class ContinentData {
  static List continent(String continent) {
    int? indexCountry;
    List<Continent>? continentList;
    if (continent == "asia") {
      indexCountry = Random().nextInt(CountriesAndCapitals.asiaList.length);
      continentList = CountriesAndCapitals.asiaList;
    } else if (continent == "europe") {
      indexCountry = Random().nextInt(CountriesAndCapitals.europeList.length);
      continentList = CountriesAndCapitals.europeList;
    } else if (continent == "africa") {
      indexCountry = Random().nextInt(CountriesAndCapitals.africaList.length);
      continentList = CountriesAndCapitals.africaList;
    } else if (continent == "australia") {
      indexCountry =
          Random().nextInt(CountriesAndCapitals.australiaList.length);
      continentList = CountriesAndCapitals.australiaList;
    } else if (continent == "south america") {
      indexCountry =
          Random().nextInt(CountriesAndCapitals.southAmericaList.length);
      continentList = CountriesAndCapitals.southAmericaList;
    } else {
      indexCountry =
          Random().nextInt(CountriesAndCapitals.northAmericaList.length);
      continentList = CountriesAndCapitals.northAmericaList;
    }
    return [indexCountry, continentList];
  }
}
