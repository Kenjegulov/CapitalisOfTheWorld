import 'package:flutter/material.dart';

import '../../models/AppBarActionModel.dart';
import '../home.dart';

class MyDialog {
  static Future<void> showResultsDialog(BuildContext context) {
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
