import 'package:flutter/material.dart';
import 'package:flutter_redux_app/state_counter.dart';
import 'package:flutter_redux_app/view_model_counter.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_app/reducer_counter.dart';

void main() {
  Store<CounterState> store =
       Store<CounterState>(counterReducer, initialState: CounterState(0));
  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  final Store<CounterState> store;

  MyApp(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<CounterState>(
        store: store,
        child: MaterialApp(
          title: 'My Redux App',
          theme: ThemeData(
            primarySwatch: Colors.pink,
          ),
          home: MyHomePage(title: 'My Redux App'),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    print("build.. build(BuildContext)");
    print("build.. Scaffold");
    print("build.. AppBar");
    print("build.. Center");
    print("build.. Column");
    print("build.. Text");
    print("build.. FloatingActionButton");

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              StoreConnector<CounterState, CounterViewModel>(
                  converter: (store) {
                return CounterViewModel(
                    state: store.state,
                    onIncreaseCounter: () =>
                        store.dispatch("INCREASE_COUNTER"));
              }, builder: (context, CounterViewModel model) {
                print("build Text");
                return Text(
                  model.state.counter.toString(),
                  style: TextStyle(fontSize: 36),
                );
              }),
            ],
          ),
        ),
        floatingActionButton: StoreConnector<CounterState, CounterViewModel>(
            converter: (store) {
              return CounterViewModel(
                  state: store.state,
                  onIncreaseCounter: () => store.dispatch(Actions.Increment));
            },
            builder: (context, CounterViewModel model) => FloatingActionButton(
                  onPressed: model.onIncreaseCounter,
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                )));
  }
}
