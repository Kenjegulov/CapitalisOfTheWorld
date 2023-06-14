import 'package:flutter/material.dart';
import 'package:flutter_lesson11/constants/MyStyles.dart';
import 'package:flutter_lesson11/models/continents/continent.dart';
import 'package:flutter_lesson11/views/functionAndClasses/AppBarAction.dart';
import 'package:flutter_lesson11/views/variation.dart';

class Testing extends StatefulWidget {
  Testing({super.key, required this.index, required this.continentList});
  int index;
  List<Continent> continentList;

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  int len = 1;
  bool one = false, two = false, three = false, four = false;
  var answer = ["", "", ""];

  @override
  void initState() {
    super.initState();
    setState(() {
      len = widget.continentList.length;
      answer[0] = widget.continentList[widget.index].country;
      answer[1] = widget.continentList[widget.index].city;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Capitalis of the World", style: MyStyle.capitalisOfYheWorld),
        actions: const [
          AppBarAction(),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 50, right: 50, top: 10),
            child: Text(
              widget.continentList[widget.index].country,
              style: MyStyle.country,
            ),
          ),
          SizedBox(
            width: 600,
            height: 500,
            child: Image.network("assets/continents/Bishkek.webp"),
          ),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Material(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            one = true;
                            two = false;
                            three = false;
                            four = false;
                            answer[2] =
                                widget.continentList[widget.index - 1].city;
                          });
                        },
                        child: MyVariation(
                          city: widget.continentList[widget.index - 1].city,
                          isTrue: one,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      height: 150,
                      width: 200,
                      child: Material(
                        color: Colors.grey,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              one = false;
                              two = true;
                              three = false;
                              four = false;
                              answer[2] = widget
                                  .continentList[(widget.index) % len].city;
                            });
                          },
                          child: MyVariation(
                            city:
                                widget.continentList[(widget.index) % len].city,
                            isTrue: two,
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
                    child: SizedBox(
                      height: 150,
                      width: 200,
                      child: Material(
                        color: Colors.grey,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              one = false;
                              two = false;
                              three = true;
                              four = false;
                              answer[2] = widget
                                  .continentList[(widget.index + 1) % len].city;
                            });
                          },
                          child: MyVariation(
                            city: widget
                                .continentList[(widget.index + 1) % len].city,
                            isTrue: three,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      height: 150,
                      width: 200,
                      child: Material(
                        color: Colors.grey,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              one = false;
                              two = false;
                              three = false;
                              four = true;
                              answer[2] = widget
                                  .continentList[(widget.index + 2) % len].city;
                            });
                          },
                          child: MyVariation(
                            city: widget
                                .continentList[(widget.index + 2) % len].city,
                            isTrue: four,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
