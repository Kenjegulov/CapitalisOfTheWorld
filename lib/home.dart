import 'package:flutter/material.dart';
import 'package:flutter_lesson11/constants/MyColors.dart';
import 'package:flutter_lesson11/constants/MyStyles.dart';
import 'package:flutter_svg/svg.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<String> continentsImage = [
    "assets/continents/Europe1.svg",
    "assets/continents/Asia1.svg",
    "assets/continents/NourthAmerica1.svg",
    "assets/continents/SouthAmerica1.svg",
    "assets/continents/Africa1.svg",
    "assets/continents/Australia1.svg",
  ];
  List<String> continentsName = [
    "Europe",
    "Asia",
    "North America",
    "South America",
    "Africa",
    "Australia",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Capitalis of the World", style: MyStyle.capitalisOfYheWorld),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: MyColor.blue,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: MyColor.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Divider(
            indent: 15,
            endIndent: 15,
            color: MyColor.black,
            height: 1,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 25, right: 10),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 400,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15),
                itemCount: continentsName.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: MyColor.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: SvgPicture.asset(
                      continentsImage[index].toString(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
