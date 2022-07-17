import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  Screen2();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'I am sreen 2',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Pop me to Screen 1'))
          ],
        ),
      ),
    );
  }
}
