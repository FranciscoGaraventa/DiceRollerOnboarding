import '../bloc/dice_bloc.dart';
import '../styles/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RollAction extends StatelessWidget {
  final DiceBloc diceBloc;
  final double borderRadius;
  final Color borderSideColor;
  final Color buttonBackground;

  const RollAction({
    Key key,
    this.diceBloc,
    this.borderRadius = Dimension.diceBorderRadius,
    this.borderSideColor = Colors.white,
    this.buttonBackground = Colors.blueAccent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: RaisedButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            borderRadius,
          ),
          side: BorderSide(
            color: borderSideColor,
          )),
      onPressed: () => {
        diceBloc.changeStatus(),
      },
      child: Icon(
        Icons.casino,
        color: Colors.white,
      ),
      color: buttonBackground,
    ));
  }
}
