import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MaterialApp(
    home: BlocProvider(
      create: (context) => CounterBloc(),
      child: CounterScreen(),
    ),
  ));
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

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Scaffold(
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
              context.read<CounterBloc>().increment();
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}

class CounterState {
  final int counter;

  CounterState(this.counter);
}

class CounterBloc extends Cubit<CounterState> {
  CounterBloc() : super(CounterState(0));

  void increment() {
    var newCounter = (state.counter) + 1;
    emit(CounterState(newCounter));
  }
}
