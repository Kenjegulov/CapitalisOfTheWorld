import 'package:flutter/material.dart';
import 'package:flutter_lesson11/constants/MyStyles.dart';
import 'package:flutter_lesson11/models/continents/continent.dart';
import 'package:flutter_lesson11/views/functionAndClasses/AppBarAction.dart';
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
          Slider(
            activeColor: Colors.black,
            value: index.toDouble(),
            onChanged: (index) {},
            min: 0,
            max: len.toDouble(),
          ),
          if (index < len && AppBarActionModel.myHeart != 0)
            Container(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Text(
                widget.continentList[index].country,
                style: MyStyle.country,
              ),
            ),
          if (index < len && AppBarActionModel.myHeart != 0)
            SizedBox(
              width: 500,
              height: 400,
              child: Image.network(widget.continentList[index].image),
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
                                if (widget.continentList[index].city ==
                                    widget
                                        .continentList[
                                            (index + i * 2 + j) % len]
                                        .city) {
                                  AppBarActionModel.rightNumber++;
                                } else {
                                  AppBarActionModel.leftNumber++;
                                  AppBarActionModel.myHeart--;
                                }
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
