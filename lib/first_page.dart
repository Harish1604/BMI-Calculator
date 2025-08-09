import 'package:flutter/material.dart';
class SubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sub Page'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Click button to back to Main Page'),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, // text color
                backgroundColor: Colors.redAccent, // button color
              ),
              child: Text('Back to Main Page'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}