import 'package:flutter/material.dart';
import 'package:flutter_lesson11/constants/MyStyles.dart';
import 'package:flutter_lesson11/models/continents/continent.dart';
import 'package:flutter_lesson11/views/functionAndClasses/AppBarAction.dart';
import 'package:flutter_lesson11/views/functionAndClasses/RandomCountries.dart';
import 'package:flutter_lesson11/views/functionAndClasses/Showdialog.dart';

import '../models/AppBarActionModel.dart';

class Testing extends StatefulWidget {
  const Testing({super.key, required this.continentList});
  final List<Continent> continentList;

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  int len = 1;
  int index = 0;
  int test = 0;
  int count = 10;
  List<int> randomCountries = [];
  List<int> randomCities = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      len = widget.continentList.length;
      AppBarActionModel.leftNumber = 0;
      AppBarActionModel.rightNumber = 0;
      AppBarActionModel.myHeart = 3;
      AppBarActionModel.totalItem = count;
      randomCountries = getRandomCountry(len, count);
      randomCities = getRandomCity();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Capitalis of the World", style: MyStyle.capitalisOfYheWorld),
        actions: [
          AppBarAction(),
        ],
      ),
      body: Column(
        children: [
          Slider(
            activeColor: Colors.black,
            value: index.toDouble(),
            onChanged: (index) {},
            min: 0,
            max: count.toDouble(),
          ),
          if (index < count && AppBarActionModel.myHeart != 0)
            Container(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Text(
                widget.continentList[randomCountries[index]].country,
                style: MyStyle.country,
              ),
            ),
          if (index < count && AppBarActionModel.myHeart != 0)
            SizedBox(
              width: 500,
              height: 400,
              child: Image.network(
                  widget.continentList[randomCountries[index]].image),
            ),
          if (index < count && AppBarActionModel.myHeart != 0)
            Column(
              children: [
                for (int i = 0; i < 2; i++)
                  Row(
                    children: [
                      for (int j = 0; j < 2; j++)
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                if (widget.continentList[randomCountries[index]]
                                        .city ==
                                    widget
                                        .continentList[randomCountries[
                                            (index + randomCities[i * 2 + j]) %
                                                count]]
                                        .city) {
                                  AppBarActionModel.rightNumber++;
                                } else {
                                  AppBarActionModel.leftNumber++;
                                  AppBarActionModel.myHeart--;
                                }
                                randomCities = getRandomCity();
                                index++;
                              });
                            },
                            child: SizedBox(
                              width: 200,
                              height: 150,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                color: Colors.orange,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        widget
                                            .continentList[randomCountries[
                                                (index +
                                                        randomCities[
                                                            i * 2 + j]) %
                                                    count]]
                                            .city,
                                        style: MyStyle.variationStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      const SizedBox(width: 10),
                    ],
                  ),
                const SizedBox(height: 10),
              ],
            ),
          if (index == count || AppBarActionModel.myHeart == 0)
            Builder(
              builder: (BuildContext context) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  MyDialog.showResultsDialog(context);
                });
                return Container();
              },
            ),
        ],
      ),
    );
  }
}
