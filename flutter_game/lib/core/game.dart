import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_game/core/loop.dart';
import 'package:flutter_game/entities/player.dart';
import 'package:flutter_game/util/vars.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  late ReceivePort _receivePort;
  late Isolate _isolateLoop;
  late Player player;

  void startIsolateLopp() async {
    _receivePort = ReceivePort();
    _isolateLoop = await Isolate.spawn(mainLoop, _receivePort.sendPort);
    _receivePort.listen((message) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isFirstStartGame) {
      startIsolateLopp();
      isFirstStartGame = false;
      player = Player();
    }

    player.update();
    return Stack(
      children: [player.build()],
    );
  }
}
