import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black38,
        // ignore: prefer_const_literals_to_create_immutables
      ),
      backgroundColor: Colors.blueGrey,
      body: Column(
        children: const [
          Center(
            child: SizedBox(
              // width: 350.0,
              // height: 50.0,
              child: Card(
                  child: Text(
                'Your coffee order is on the way.',
                style:
                    TextStyle(fontSize: 20.0, height: 1.7, letterSpacing: 1.0,backgroundColor: Colors.amber),
              )),
            ),
          )
        ],
      ),
    );
  }
}
