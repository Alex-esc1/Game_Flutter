import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_game/core/scenes/scene.dart';
import 'package:flutter_game/entities/player.dart';
import 'package:flutter_game/util/vars.dart';

class GameScene extends AppScene {
  Player _player = Player();
  double _startGlobalPosition = 0;

  @override
  Widget buildScene() {
    return Stack(
      children: [
        _player.build(),

        Positioned(
          top: 0,
          left: 0,
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.green)),
            width: GlobalVars.screenWidth / 2,
            height: GlobalVars.screenHeight,
            child: GestureDetector(
              onPanStart: _onPanStart,
              onPanUpdate: _onPanupdate,
            ),
          ))
        
        ],
    );
  }

  @override
  void update() {
    _player.update();
  }

  GameScene();

  void _onPanStart(DragStartDetails details) {

    _startGlobalPosition = details.globalPosition.dx;

  }

  void _onPanupdate(DragUpdateDetails details) {
    double updateGlobalPosition = details.globalPosition.dx;
    if(updateGlobalPosition > _startGlobalPosition + 30) {
      // right;
      _player.isMoveRight = true;
    }
    if(updateGlobalPosition < _startGlobalPosition - 30) {
      // left;
      _player.isMoveLeft = true;
    }
  }
}
