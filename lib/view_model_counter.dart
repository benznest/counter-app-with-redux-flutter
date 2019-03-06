import 'package:flutter_redux_app/state_counter.dart';

class CounterViewModel {
  CounterState state;
  Function() onIncreaseCounter;
  Function() onDecreaseCounter;
  Function() onResetCounter;

  CounterViewModel(
      {this.state,
      this.onIncreaseCounter,
      this.onDecreaseCounter,
      this.onResetCounter});
}
