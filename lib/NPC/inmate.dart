import 'package:bonfire/bonfire.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tfg_flutter_game/constants/animation_config.dart';
import 'package:tfg_flutter_game/constants/globals.dart';
import 'package:tfg_flutter_game/game/the_green_ninja_game.dart';
import 'package:tfg_flutter_game/sprite_sheets/sprite_sheets.dart';

import '../players/green_ninja_player.dart';

class Inmate extends SimpleNpc with Sensor<GreenNinjaPlayer> {
  bool _observed = false;
  late TextPaint _textPaint;

  Inmate({required Vector2 position, required size, required showcaseText})
      : super(
          position: position,
          size: Vector2(
            Globals.defaultTileSize,
            Globals.defaultTileSize,
          ),){
    _textPaint = TextPaint(style: TextStyle(color:Colors.white, fontSize: width / 2),);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    if (_observed) {
      _textPaint.render(
        canvas,
        "Acércate, guerrero",
        Vector2(position.x - 30, position.y - -30),
      );
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    seePlayer(
        radiusVision: Globals.radiusVision,
        notObserved: () {
          _observed = false;
        },
        observed: (player) {
          if (!_observed) {
            _observed = true;
          }
        });
  }

  @override
  void onContact(GameComponent component) {
    _showDialogTalk();
    component.position = Vector2(550, 170);
  }

  void _showDialogTalk() {
    gameRef.camera.moveToTargetAnimated(this, zoom: 2, finish: () {
      TalkDialog.show(gameRef.context, [
        _speak(text: "La soledad de estos muros enloquece a cualquiera... ¿De donde sales tu, forastero de verde?", isHero: false),
        _speak(text: "...", isHero: true),
        _speak(text: "¡Hey, tu! ¿Vas a amotinarte y salir de aqui?", isHero: false),
        _speak(text: "...", isHero: true),
        _speak(text: "¿Ves a aquel guardia de azul? Con la medalla que tenía encima podrás salir de aquí sin problema.", isHero: false),
        _speak(text: "Claro", isHero: true),
        _speak(text: "Recuerda quién te ayudó a salir de este pozo. Ven a por mi cuando todo esté mas tranquilo!", isHero: false),
      ], logicalKeyboardKeysToNext: [
        LogicalKeyboardKey.space,
        LogicalKeyboardKey.enter,
      ], onClose: () {
        gameRef.camera.moveToPlayerAnimated(zoom: 1);
      });
    });
  }

  Say _speak({required String text, required bool isHero}) => Say(
      text: [TextSpan(text: text)],
      person: SizedBox(
        height: Globals.dialogBox,
        width: Globals.dialogBox,
        child: isHero
            ? GreenNinjaSpriteSheet.spriteSheet.getSprite(0, 0).asWidget()
            : OldManSpriteSheet.spriteSheet.getSprite(0, 0).asWidget(),
      ),
      personSayDirection:
          isHero ? PersonSayDirection.LEFT : PersonSayDirection.RIGHT);




}
