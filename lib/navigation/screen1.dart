import 'package:flutter/material.dart';
import 'package:flutter_samples_2/navigation/screen2.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello I am Screen 1',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/screen2');
                },
                child: Text('Move to Screen 2'))
          ],
        ),
      ),
    );
  }
}
