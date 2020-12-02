import '../../widgets/onpressed_widget.dart';
import '../../RollEvent.dart';
import '../../styles/dimensions.dart';
import '../../widgets/roll_widget.dart';
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
          child: StreamBuilder(
            stream: widget.diceBloc.diceRoll,
            initialData: RollEvent(
              stateType: RollStateType.initial,
            ),
            builder: (BuildContext context, snapshot) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Roll a dice:',
                  ),
                  Container(
                    height: Dimension.diceContainerSize,
                    child: RollWidget(
                      rollEvent: (snapshot.hasData)
                          ? snapshot.data
                          : RollEvent(
                              stateType: RollStateType.loading,
                            ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        floatingActionButton: OnPressWidget(
          diceBloc: widget.diceBloc,
        ));
  }
}
