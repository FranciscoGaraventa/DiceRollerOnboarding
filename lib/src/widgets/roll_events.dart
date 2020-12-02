import '../RollEvent.dart';
import '../styles/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RollEvents extends StatelessWidget {
  final RollEvent rollEvent;
  final Color rollNumberColor;

  const RollEvents({
    Key key,
    this.rollEvent,
    this.rollNumberColor = Colors.white,
  }) : super(key: key);

  Widget _buildContent(){
    switch (rollEvent.stateType) {
      case RollStateType.loading:
        return CircularProgressIndicator();
      case RollStateType.initial:
        return Text('ROLL');
      case RollStateType.success:
        if (rollEvent.diceValue == null)
          return Text('Error');
        else{
          return Text(
            '${rollEvent.diceValue}',
            style: TextStyle(
              color: rollNumberColor,
              fontWeight: FontWeight.bold,
              fontSize: Dimension.rollWidgetTextFontSize,
            ),
          );
        }
        break;
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buildContent()
    );
  }
}
