import 'package:bonfire/bonfire.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tfg_flutter_game/constants/animation_config.dart';
import 'package:tfg_flutter_game/constants/globals.dart';
import 'package:tfg_flutter_game/game/the_green_ninja_game.dart';
import 'package:tfg_flutter_game/sprite_sheets/sprite_sheets.dart';

class OldManNpc2 extends SimpleNpc with TapGesture, AutomaticRandomMovement {

  bool _observed = false;
  late TextPaint _textPaint;

  OldManNpc2({required Vector2 position, required SpriteSheet spriteSheet})
      : super(
      position: position,
      size: Vector2(Globals.playerSize, Globals.playerSize),
      speed: 100,
      initDirection: Direction.down,
      animation:
      AnimationConfig.oldManAnimation(spriteSheet: spriteSheet)){

    _textPaint = TextPaint(style: TextStyle(color: Colors.white, fontSize: width / 2),
    );
  }

  @override
  void render(Canvas canvas){
    super.render(canvas);
    if(_observed){
      _textPaint.render(canvas, "Buenas tardes", Vector2(position.x -30, position.y -30),);
    }
  }

  @override
  void update (double dt) {
    super.update(dt);
    seeAndMoveToPlayer(
        closePlayer: (player) {},
        radiusVision: Globals.radiusVision,
        observed: (){
          if(!_observed){
            _observed = true;
          }
        },
        notObserved: (){
          _observed = false;
          runRandomMovement(dt, maxDistance: Globals.observeMaxDistance, minDistance: Globals.observeMinDistance);
        }
    );
  }

  @override
  void onTap() {
    _showDialogTalk();
  }

  void _showDialogTalk() {
    gameRef.camera.moveToTargetAnimated(this, zoom: 2, finish: () {
      TalkDialog.show(gameRef.context, [
          _speak(text:"No pareces de por aquí.¿De donde has salido tu?", isHero: false),
          _speak(text:"Estuve encerrado en la mazmorra que hay trase aquella puerta.", isHero: true),
          _speak(text:"¿Mazmorra? ¡Nadie ha tocado esa puerta en años!" ,isHero: false),
          _speak(text:"¿Ves esa hierba de la fuente? Dicen que sus hojas tienen propiedades curativas.", isHero: false),
          _speak(text:"¿Cómo?¿Cómo es eso posible?", isHero: true),
          _speak(text:"Hay un ser con energía mágica que potencia el agua de la zona.", isHero: false),
          _speak(text:"Que conveniente", isHero:true),
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
