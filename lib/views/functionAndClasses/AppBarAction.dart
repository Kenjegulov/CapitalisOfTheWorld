import 'package:flutter/material.dart';

import '../../constants/MyColors.dart';
import '../../constants/MyStyles.dart';
import '../../models/continents/continent.dart';
import '../../models/AppBarActionModel.dart';

class AppBarAction extends StatefulWidget {
  AppBarAction({super.key, required this.continentList});
  List<Continent> continentList;

  @override
  State<AppBarAction> createState() => _AppBarActionState();
}

class _AppBarActionState extends State<AppBarAction> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        height: 30,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('${AppBarActionModel.leftNumber}', style: MyStyle.leftStyle),
            Text('${widget.continentList.length}', style: MyStyle.middleStyle),
            Text('${AppBarActionModel.rightNumber}', style: MyStyle.rightStyle),
          ],
        ),
      ),
      const SizedBox(width: 40),
      Text('${AppBarActionModel.myHeart}', style: MyStyle.appBarAction),
      const SizedBox(width: 30),
      Icon(Icons.favorite, color: MyColor.red),
      Icon(Icons.favorite, color: MyColor.red),
      Icon(Icons.favorite, color: MyColor.red),
      const Icon(Icons.more_vert),
    ]);
  }
}
