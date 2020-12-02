import '../RollEvent.dart';
import 'roll_events.dart';
import '../styles/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class IndividualDice extends StatelessWidget {
  IndividualDice({
    Key key,
    this.rollEvent,
    this.diceContainerHeight = Dimension.diceContainerHeight,
    this.diceContainerWidth = Dimension.diceContainerWidth,
    this.diceColor = Colors.deepOrange,
    this.containerBorderColor = Colors.black,
    this.containerBorderWidth = Dimension.containerDiceWidth,
  }) : super(key: key);

  final double diceContainerHeight;
  final double diceContainerWidth;
  final Color diceColor;
  final Color containerBorderColor;
  final double containerBorderWidth;
  final RollEvent rollEvent;

  Widget _buildContent() {
    return Container(
      width: diceContainerWidth,
      height: diceContainerHeight,
      decoration: BoxDecoration(
          color: diceColor,
          border: Border.all(
            color: containerBorderColor,
            width: containerBorderWidth,
          )),
      child: RollEvents(
        rollEvent: rollEvent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }
}
