import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog Provider'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Download'),
          onPressed: () {},
        ),
      ),
    );
  }
}
