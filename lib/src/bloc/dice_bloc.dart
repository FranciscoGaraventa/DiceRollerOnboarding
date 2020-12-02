import 'dart:async';
import 'dart:math';
import '../RollEvent.dart';
import '../screen/dice/dice_event.dart';
import 'bloc.dart';

class DiceBloc extends Bloc {
  final int maxNumDice = 6;

  Stream<RollEvent> get diceRoll => _diceEventController.stream;
  final _diceEventController = StreamController<RollEvent>();

  @override
  void dispose() {
    _diceEventController.close();
  }

  RollEvent _mapEventToState(DiceEvent event) {
    switch (event) {
      case DiceEvent.rollEvent:
        return RollEvent(
          diceValue: Random().nextInt(maxNumDice) + 1,
          stateType: RollStateType.success,
        );
        break;
      default:
        return RollEvent(stateType: RollStateType.loading);
    }
  }

  @override
  void initialize() {}

  void _fetchData(Function callback) async {
    Future.delayed(const Duration(milliseconds: 800), () {
      callback(DiceEvent.rollEvent);
    });
  }

  void changeStatus() {
    _diceEventController.sink.add(RollEvent(stateType: RollStateType.loading));
    _fetchData((event) {
      _diceEventController.sink.add(_mapEventToState(event));
    });
  }
}
