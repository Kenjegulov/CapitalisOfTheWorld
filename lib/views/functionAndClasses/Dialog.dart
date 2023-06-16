import 'package:flutter/material.dart';

import '../../models/AppBarActionModel.dart';
import '../home.dart';

class Dialog {
  static Future<void> dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('You are results'),
          content:
              Text("Your correct answers: ${AppBarActionModel.rightNumber}\n"
                  "Your wrong answers: ${AppBarActionModel.leftNumber}"),
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
