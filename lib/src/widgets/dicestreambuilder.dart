import 'individual_dice.dart';
import '../styles/dimensions.dart';
import '../RollEvent.dart';
import '../bloc/dice_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DiceStreamBuilder extends StatelessWidget {
  final DiceBloc diceBloc;
  final double padding;

  const DiceStreamBuilder({
    Key key,
    this.diceBloc,
    this.padding = Dimension.streamBuilderPadding,
  }) : super(key: key);

  List<Widget> _buildList(AsyncSnapshot snapshot) {
    var _list = snapshot.data.map<Widget>((rollEvent) {
      return IndividualDice(
        rollEvent: rollEvent,
      );
    }).toList();
    return _list;
  }

  List<RollEvent> _initialData() {
    List<RollEvent> _listEvents = List<RollEvent>();
    for (int i = 0; i < diceBloc.numberOfDices; i++) {
      _listEvents.add(
        RollEvent(
          stateType: RollStateType.initial,
        ),
      );
    }
    return _listEvents;
  }

  Widget _buildContent() {
    return StreamBuilder(
      stream: diceBloc.diceRolls,
      initialData: _initialData(),
      builder: (BuildContext context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }
        return SingleChildScrollView(
          child: Wrap(
            spacing: Dimension.wrapSpacing,
            runSpacing: Dimension.wrapRunSpacing,
            children: [
              ..._buildList(
                snapshot,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }
}
