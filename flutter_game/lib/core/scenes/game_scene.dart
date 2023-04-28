import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_game/core/scenes/scene.dart';
import 'package:flutter_game/entities/player.dart';

class GameScene extends AppScene {
  Player _player = Player();

  @override
  Widget buildScene() {
    return Stack(
      children: [_player.build()],
    );
  }

  @override
  void update() {
    _player.update();
  }

  GameScene();
}
