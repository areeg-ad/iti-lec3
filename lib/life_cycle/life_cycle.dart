import 'package:flutter/material.dart';

class LifeCycleExm extends StatefulWidget {
  @override
  _LifeCycleExmState createState() => _LifeCycleExmState();
}

class _LifeCycleExmState extends State<LifeCycleExm>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    print("life cycle: initState");
  }

  @override
  void didChangeDependencies() {
    print("life cycle: didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    print("life cycle: dispose");
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    print("life cycle: deactivate");
    super.deactivate();
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      print('life cycle: setState');
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("life cycle: build");
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Widget Lifecycle")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 8.0,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
