import 'package:flutter/material.dart';
import 'dart:ui' as ui;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final ui.Size logicalSize = MediaQuery.of(context).size;
    final double _height = logicalSize.height;
    return Scaffold(
        appBar: AppBar(backgroundColor: Color(0xFF26C6DA)),
        body: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: 00.0,
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: const InputDecoration(
                          labelText: "Description",
                        ),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: "Description",
                        ),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: "Description",
                        ),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: "Description",
                        ),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: "Description",
                        ),
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  )
              ),
              Container(
                padding: EdgeInsets.only(top: (_height - 450.0)),
                margin: EdgeInsets.only(bottom: 16.0),
                child: FloatingActionButton(
                    backgroundColor: Color(0xFFE57373),
                    child: Icon(Icons.check),
                    onPressed: (){}
                ),
              )
            ],
          ),
        )
    );
  }
}