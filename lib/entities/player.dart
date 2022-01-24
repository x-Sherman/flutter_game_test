import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_game_test/entities/entity.dart';

class Player extends Entity {
  Player() : super(50, 150, 'player');

  @override
  void move() {
    x++;
    if (x > 500) {
      x = 50;
    }
  }

  @override
  void update() {
    move();
  }

  @override
  Widget widgetBuild() {
    return Positioned(
        top: y, left: x, child: visible ? sprites.first : const SizedBox());

    throw UnimplementedError();
  }
}
