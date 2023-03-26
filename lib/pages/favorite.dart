import 'package:flutter/material.dart';

class favorite extends StatelessWidget {
  const favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black38,
        // ignore: prefer_const_literals_to_create_immutables
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        child: const Center(
          child: Text('F A V O R I T E'),
        ),
      ),
    );
  }
}
