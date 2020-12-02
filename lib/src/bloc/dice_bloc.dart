import 'dart:async';
import 'dart:math';
import '../RollEvent.dart';
import '../screen/dice/dice_event.dart';
import 'bloc.dart';

class DiceBloc extends Bloc {
  final int numberOfDices;
  final int maxNumDice = 6;
  final _diceEventController = StreamController<List<RollEvent>>();
  List<RollEvent> _diceEvents = List<RollEvent>();

  Stream<List<RollEvent>> get diceRolls => _diceEventController.stream;

  DiceBloc({
    this.numberOfDices,
  });

  @override
  void dispose() {
    _diceEventController.close();
  }

  void _loadListEvents(bool loading) {
    for (int i = 0; i < numberOfDices; i++) {
      (loading == false)
          ? _diceEvents.add(RollEvent(
              diceValue: Random().nextInt(maxNumDice) + 1,
              stateType: RollStateType.success,
            ))
          : _diceEvents.add(RollEvent(
              stateType: RollStateType.loading,
            ));
    }
  }

  List<RollEvent> _mapEventToState(DiceEvent event) {
    _diceEvents.clear();
    switch (event) {
      case DiceEvent.rollEvent:
        _loadListEvents(false);
        break;
      default:
        _loadListEvents(true);
        break;
    }
    return _diceEvents;
  }

  @override
  void initialize() {}

  void _fetchData(Function callback) async {
    Future.delayed(const Duration(milliseconds: 800), () {
      callback(DiceEvent.rollEvent);
    });
  }

  void changeStatus() {
    _diceEvents.clear();
    _loadListEvents(true);
    _diceEventController.sink.add(_diceEvents);
    _fetchData((event) {
      _diceEventController.sink.add(_mapEventToState(event));
    });
  }
}
