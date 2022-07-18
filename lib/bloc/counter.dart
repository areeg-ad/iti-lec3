import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
      home: BlocProvider(
    create: (context) => CounterBloc(CounterState(0)),
    child: CounterScreen(),
  )));
}

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(title: Text("Counter Example")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                context.read<CounterBloc>().state.counter.toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(
                height: 8.0,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('increment');
            context.read<CounterBloc>().increment();
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class CounterState {
  int counter;

  CounterState(this.counter);

  setCounter(int counter) => this.counter = counter;

  getCounter() => counter;
}

class CounterBloc extends Cubit<CounterState> {
  CounterBloc(super.initialState);

  void increment() {
    emit(CounterState(++state.counter));
  }
}
