import 'package:flutter/material.dart';

class View extends StatelessWidget {
  final int index;
  final List<String> collection;
  final Function handler;

  const View(this.index, this.collection, this.handler, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: 75,
      child: ElevatedButton(
        key: Key(collection.elementAt(index)),
        onPressed: () => handler(collection.elementAt(index)),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(70),
                side: BorderSide.none))),
        child: Text(
          collection.elementAt(index),
          // ignore: prefer_const_constructors
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
