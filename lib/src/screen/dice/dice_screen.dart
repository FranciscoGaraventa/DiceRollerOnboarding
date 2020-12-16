import '../../widgets/dicestreambuilder.dart';
import '../../widgets/roll_action.dart';
import '../../bloc/dice_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiceScreen extends StatefulWidget {
  DiceScreen({
    Key key,
    this.title,
    this.diceBloc,
  })  : assert(diceBloc != null),
        super(key: key);
  final String title;
  final DiceBloc diceBloc;

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
          child: DiceStreamBuilder(
            diceBloc: widget.diceBloc,
          ),
        ),
        floatingActionButton: RollAction(
          diceBloc: widget.diceBloc,
        ));
  }
}
