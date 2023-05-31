import 'package:bonfire/bonfire.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tfg_flutter_game/constants/animation_config.dart';
import 'package:tfg_flutter_game/constants/globals.dart';
import 'package:tfg_flutter_game/game/the_green_ninja_game.dart';
import 'package:tfg_flutter_game/sprite_sheets/sprite_sheets.dart';

class Inmate extends GameComponent with TapGesture {
  bool _observerd = false;
  late TextPaint _textPaint;

  @override
  void onTap() {
    // TODO: implement onTap
  }
}
