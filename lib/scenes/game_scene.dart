import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_game_test/entities/player.dart';
import 'package:flutter_game_test/scenes/app_scene.dart';

class GameScene extends AppScene {
  Player _player = Player();
  GameScene();

  @override
  Widget buildScene() {
    return Stack(
      children: <Widget>[
        _player.widgetBuild(),
      ],
    );
  }

  @override
  void update() {
    _player.update();
  }
}
