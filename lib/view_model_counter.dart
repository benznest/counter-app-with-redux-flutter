import 'package:flutter_redux_app/state_counter.dart';

class CounterViewModel{
  CounterState state;
  Function() onIncreaseCounter;

  CounterViewModel({this.state, this.onIncreaseCounter});


}