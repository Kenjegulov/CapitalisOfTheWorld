import 'package:flutter/material.dart';
import 'package:flutter_lesson11/constants/MyColors.dart';
import 'package:flutter_lesson11/models/Continents.dart';
import 'package:flutter_lesson11/constants/MyStyles.dart';
import 'package:flutter_lesson11/models/continents/continent.dart';
import 'package:flutter_lesson11/views/functionAndClasses/ContinetData.dart';
import 'package:flutter_lesson11/views/testing.dart';
import 'package:flutter_svg/svg.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<Continent>? continentList;

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
              padding: const EdgeInsets.only(left: 40, top: 25, right: 40),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 400,
                    crossAxisSpacing: 40,
                    mainAxisSpacing: 34),
                itemCount: MyContinent.continentsImage.length,
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        continentList = ContinentData.continent(
                            MyContinent.continentsName[index].toLowerCase());
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Testing(
                            continentList: continentList!,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: MyColor.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          Text(
                            MyContinent.continentsName[index],
                            style: MyStyle.continentNameStyleFunc(index),
                          ),
                          SvgPicture.asset(
                            MyContinent.continentsImage[index].toString(),
                            color: MyContinent.continentColor[index],
                            width: 300,
                            height: 200,
                          ),
                        ],
                      ),
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
