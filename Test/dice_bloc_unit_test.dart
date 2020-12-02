import 'package:first_flutter_app/src/RollEvent.dart';
import 'package:first_flutter_app/src/bloc/dice_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

main() {

  test('Testing load event result', (){
    final diceBloc = DiceBloc(numberOfDices: 2);
    diceBloc.changeStatus();
    diceBloc.diceRolls.listen((event) {
      expect(event.first.stateType,RollStateType.loading);
    });
  }
  );

}
