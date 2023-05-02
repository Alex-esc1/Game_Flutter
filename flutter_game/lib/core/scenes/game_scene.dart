import 'package:flutter/material.dart';
import 'package:flutter_game/core/scenes/scene.dart';
import 'package:flutter_game/entities/bullet.dart';
import 'package:flutter_game/entities/player.dart';
import 'package:flutter_game/util/vars.dart';

class GameScene extends AppScene {
  Player _player = Player();
  double _startGlobalPosition = 0;
  List<Bullet> _listBullet = [];
  List<Widget> _listWidget = [];

  @override
  Widget buildScene() {
    return Stack(
      children: [
        _player.build(),
        Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: GlobalVars.screenWidth / 2,
              height: GlobalVars.screenHeight,
              child: GestureDetector(
                onPanStart: _onPanStart,
                onPanUpdate: _onPanupdate,
              ),
            )),
        Positioned(
            top: 0,
            left: GlobalVars.screenWidth / 2,
            child: Container(
              width: GlobalVars.screenWidth / 2,
              height: GlobalVars.screenHeight / 2,
              child: GestureDetector(
                onTap: _onAcceleration,
              ),
            )),
        Positioned(
            top: GlobalVars.screenHeight / 2,
            left: GlobalVars.screenWidth / 2,
            child: Container(
              width: GlobalVars.screenWidth / 2,
              height: GlobalVars.screenHeight / 2,
              child: GestureDetector(
                onTap: _onShoot,
              ),
            )),
        Stack(
          children: _listWidget,
        )
      ],
    );
  }

  @override
  void update() {
    _player.update();
    _listWidget.clear();
    _listBullet.removeWhere((element) => !element.visible);
    _listBullet.forEach((element) {
      _listWidget.add(element.build());
      element.update();
    });
  }

  GameScene();

  void _onPanStart(DragStartDetails details) {
    _startGlobalPosition = details.globalPosition.dx;
  }

  void _onPanupdate(DragUpdateDetails details) {
    double updateGlobalPosition = details.globalPosition.dx;
    if (updateGlobalPosition > _startGlobalPosition + 30) {
      // right;
      _player.isMoveRight = true;
    }
    if (updateGlobalPosition < _startGlobalPosition - 30) {
      // left;
      _player.isMoveLeft = true;
    }
  }

  void _onAcceleration() {
    _player.isAcceleration = _player.isAcceleration ? false : true;
  }

  void _onShoot() {
    _listBullet.add(Bullet(
        playerAngle: _player.getAngle, playerX: _player.x, playerY: _player.y));
  }
}
