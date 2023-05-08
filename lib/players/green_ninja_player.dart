import 'package:bonfire/bonfire.dart';
import 'package:flutter/services.dart';
import 'package:tfg_flutter_game/constants/animation_config.dart';
import 'package:tfg_flutter_game/constants/globals.dart';

import '../enums/attack_type.dart';

class GreenNinjaPlayer extends SimplePlayer {

  final double _damage = 10;

  GreenNinjaPlayer(
      {required Vector2 position, required SpriteSheet spriteSheet})
      : super (
      position: position,
      size: Vector2(Globals.playerSize, Globals.playerSize),
      speed: 220,
      life: 100,
      initDirection: Direction.down,
      animation: AnimationConfig.greenNinjaAnimation(spriteSheet: spriteSheet));

  @override
  void joystickAction(JoystickActionEvent event) {

    if(event.event == ActionEvent.DOWN){

      if(event.id == AttackType.melee || event.id == LogicalKeyboardKey.space.keyId){
        // Ataque cuerpo a cuerpo - si estas muerto no haces accion
        if(gameRef.player != null && gameRef.player?.isDead == true) return;
        simpleAttackMelee(
            withPush: false,
            damage: _damage * 2,
            size: size,
            animationRight: AnimationConfig.cutAnimation());
      }

      if(event.id == AttackType.range || event.id == LogicalKeyboardKey.controlLeft.keyId){
        // Ataque cuerpo a distancia - si estas muerto no hace ninguna accion
        if(gameRef.player != null && gameRef.player?.isDead == true) return;
        simpleAttackRange(
            damage: _damage,
            animationRight: AnimationConfig.shurikenAnimation(),
            animationLeft: AnimationConfig.shurikenAnimation(),
            animationUp: AnimationConfig.shurikenAnimation(),
            animationDown: AnimationConfig.shurikenAnimation(),
            size: size);
      }
    }

    super.joystickAction(event);
  }
}