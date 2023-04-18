import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_game/core/loop.dart';
import 'package:flutter_game/util/vars.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  double x = 100;
  double y = 200;
  late ReceivePort _receivePort;
  late Isolate _isolateLoop;

  void startIsolateLopp() async {
    _receivePort = ReceivePort();
    _isolateLoop = await Isolate.spawn(mainLoop, _receivePort.sendPort);
    _receivePort.listen((message) {
      setState(() {});
      x++;
      if (x>500) {
        x = 0;
      }
     });
  }

  @override
  Widget build(BuildContext context) {
    if (isFirstStartGame){
      startIsolateLopp();
      isFirstStartGame = false;
    }
    return Stack(
      children: [
        Positioned(
          top: y,
          left: x,
          child: Text('data'))
      ],
      );
  }
}