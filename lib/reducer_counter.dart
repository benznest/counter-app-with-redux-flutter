import 'package:flutter_redux_app/state_counter.dart';

enum Actions { Increment }

CounterState counterReducer(CounterState state, dynamic action) {
  if (action == Actions.Increment) {
     state.counter++;
     return state;
  }

  return state;
}


