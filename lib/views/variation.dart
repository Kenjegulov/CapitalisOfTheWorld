import 'package:flutter/material.dart';

class MyVariation extends StatefulWidget {
  MyVariation({super.key, required this.city, required this.isTrue});
  String city;
  bool isTrue;
  @override
  State<MyVariation> createState() => _MyVariationState();
}

class _MyVariationState extends State<MyVariation> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 150,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: widget.isTrue ? Colors.green : Colors.orange,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.city,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.amber)),
            ],
          ),
        ),
      ),
    );
  }
}
