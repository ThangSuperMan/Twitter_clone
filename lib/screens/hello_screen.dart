import 'package:flutter/material.dart';

class HelloScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello Screen'),
      ),
      body: Center(
        child: Text('Hello Page Content'),
      ),
    );
  }
}
