import 'package:flutter/material.dart';

abstract class Entity {
  double x;
  double y;
  String spriteName;
  bool visible = true;
  List sprites = [];

  Entity(this.x, this.y, this.spriteName) {
    for (var i = 0; i < 4; i++) {
      sprites.add(Image.asset('assets/$spriteName$i.png'));
    }
  }

  void update();
  void move();
  Widget widgetBuild();
}
