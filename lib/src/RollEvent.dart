class RollEvent {
  RollEvent({
    this.diceValue,
    this.stateType,
  });

  final int diceValue;
  final RollStateType stateType;
}

enum RollStateType {
  loading,
  success,
  error,
  initial,
}
