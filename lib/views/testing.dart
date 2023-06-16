import 'package:flutter/material.dart';
import 'package:flutter_lesson11/constants/MyStyles.dart';
import 'package:flutter_lesson11/models/continents/continent.dart';
import 'package:flutter_lesson11/views/functionAndClasses/AppBarAction.dart';

import '../models/AppBarActionModel.dart';
import 'home.dart';

class Testing extends StatefulWidget {
  Testing({super.key, required this.continentList});
  List<Continent> continentList;

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
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            index++;
                            AppBarActionModel.leftNumber--;
                            AppBarActionModel.myHeart--;
                            test = 1;
                          });
                        },
                        child: SizedBox(
                          width: 200,
                          height: 150,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: test == 1 ? Colors.red : Colors.orange,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget
                                        .continentList[(index + 1) % len].city,
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
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            index++;
                            AppBarActionModel.rightNumber++;
                            test = 2;
                          });
                        },
                        child: SizedBox(
                          width: 200,
                          height: 150,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: test == 2 ? Colors.green : Colors.orange,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.continentList[index].city,
                                    style: MyStyle.variationStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            index++;
                            AppBarActionModel.leftNumber--;
                            AppBarActionModel.myHeart--;
                            test = 3;
                          });
                        },
                        child: SizedBox(
                          width: 200,
                          height: 150,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: test == 3 ? Colors.red : Colors.orange,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget
                                        .continentList[(index + 2) % len].city,
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
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            index++;
                            AppBarActionModel.leftNumber--;
                            AppBarActionModel.myHeart--;
                            test = 4;
                          });
                        },
                        child: SizedBox(
                          width: 200,
                          height: 150,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            color: test == 4 ? Colors.red : Colors.orange,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget
                                        .continentList[(index + 3) % len].city,
                                    style: MyStyle.variationStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          if (index == len || AppBarActionModel.myHeart == 0)
            Center(
              child: OutlinedButton(
                onPressed: () => _dialogBuilder(context),
                child: const Text('Finish'),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('You are results'),
          content: AppBarActionModel.myHeart > 0
              ? Text("Your correct answers: ${AppBarActionModel.rightNumber}\n"
                  "Your wrong answers: ${AppBarActionModel.leftNumber}")
              : const Text("You got it wrong a lot"),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Disable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Enable'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyHome(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
