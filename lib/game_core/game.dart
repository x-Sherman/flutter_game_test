import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_game_test/game_core/main_loop.dart';
import 'package:flutter_game_test/utilites/common_vars.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  double x = 100;
  double y = 200;

  ReceivePort? _receivePort;
  Isolate? _isolateLoop;

  void startIsolateLoop() async {
    _receivePort = ReceivePort();
    _isolateLoop = await Isolate.spawn(startLoop, _receivePort?.sendPort);
    _receivePort?.listen((message) {
      setState(() {});
      x++;
      if (x > 500) {
        x = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isFirstStartGame) {
      startIsolateLoop();
      isFirstStartGame = false;
    }
    return Stack(
      children: <Widget>[
        Positioned(
          top: y,
          left: x,
          child: Text('Hey 1'),
        ),
      ],
    );
  }
}
