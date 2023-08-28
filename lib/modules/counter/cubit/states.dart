abstract class CounterStates {}

class CounterInitialState extends CounterStates {}

class CounterPlusState extends CounterStates {
  final int counter;

  CounterPlusState(this.counter);
}

class CounterMiunsState extends CounterStates {
  final int counter;

  CounterMiunsState(this.counter);
}
