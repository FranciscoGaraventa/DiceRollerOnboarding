import '../RollEvent.dart';
import '../styles/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RollWidget extends StatelessWidget {
  final RollEvent rollEvent;

  const RollWidget({
    Key key,
    this.rollEvent,
  }) : super(key: key);

  Widget _buildContent(){
    switch (rollEvent.stateType) {
      case RollStateType.loading:
        return CircularProgressIndicator();
      case RollStateType.initial:
        return Text('Press button to roll.');
      case RollStateType.success:
        if (rollEvent.diceValue == null)
          return Text('Error');
        else{
          return Text(
            '${rollEvent.diceValue}',
            style: TextStyle(
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
