import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_lesson11/constants/MyStyles.dart';
import 'package:flutter_lesson11/models/continents/continent.dart';
import 'package:flutter_lesson11/views/functionAndClasses/AppBarAction.dart';
import 'package:flutter_lesson11/views/functionAndClasses/Showdialog.dart';

import '../models/AppBarActionModel.dart';
import 'home.dart';

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
  int random = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      len = widget.continentList.length;
      AppBarActionModel.leftNumber = 0;
      AppBarActionModel.rightNumber = 0;
      AppBarActionModel.myHeart = 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Capitalis of the World", style: MyStyle.capitalisOfYheWorld),
        actions: [
          AppBarAction(continentList: widget.continentList),
        ],
      ),
      body: Column(
        children: [
          if (index < len && AppBarActionModel.myHeart != 0)
            Container(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 10),
              child: Text(
                widget.continentList[index].country,
                style: MyStyle.country,
              ),
            ),
          if (index < len && AppBarActionModel.myHeart != 0)
            SizedBox(
              width: 600,
              height: 500,
              child: Image.network("assets/continents/Bishkek.webp"),
            ),
          if (index < len && AppBarActionModel.myHeart != 0)
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
                                index++;
                                if (random == 0) {
                                  AppBarActionModel.rightNumber++;
                                } else {
                                  AppBarActionModel.leftNumber--;
                                  AppBarActionModel.myHeart--;
                                }
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
                                            .continentList[
                                                (index + i * 2 + j) % len]
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
          if (index == len || AppBarActionModel.myHeart == 0)
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
