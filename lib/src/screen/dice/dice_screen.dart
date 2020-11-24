import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiceScreen extends StatefulWidget {
  DiceScreen({
    Key key,
    this.title,
  }) : super(key: key);
  final String title;

  @override
  _DiceScreenState createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
      ),
      body: Center(
        child: Text(
          'Roll a dice:',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.autorenew_rounded,
        ),
        backgroundColor: Colors.green,
      ),
    );
  }
}
