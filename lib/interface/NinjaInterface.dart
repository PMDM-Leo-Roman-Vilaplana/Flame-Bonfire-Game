import 'dart:ui';
import 'package:bonfire/bonfire.dart';
import 'package:tfg_flutter_game/interface/bar_life_component.dart';
import 'package:flutter/material.dart';
import 'package:tfg_flutter_game/players/green_ninja_player.dart';

import '../constants/globals.dart';

class NinjaInterface extends GameInterface {
  late Sprite key;

  @override
  Future<void> onLoad() async {

    key = await Sprite.load(Globals.coin);
    add(BarHPComponent());
    return super.onLoad();
    
  }

  @override
  void render (Canvas canvas) {

    try{
      _drawKey(canvas);
    }catch(e){}
    super.render(canvas);
  }

  void _drawKey(Canvas c){
    if (gameRef.player != null && (gameRef.player as GreenNinjaPlayer).medalObtained){
      key.renderRect(c, Rect.fromLTWH(150, 20, 35, 30));
    }
  }
}