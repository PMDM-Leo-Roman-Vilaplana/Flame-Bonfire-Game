import 'package:bonfire/bonfire.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:tfg_flutter_game/constants/animation_config.dart';
import 'package:tfg_flutter_game/constants/globals.dart';
import 'package:flame_audio/flame_audio.dart';
import '../constants/collision_config.dart';
import '../enums/attack_type.dart';
import 'package:flutter/material.dart';

import '../screens/game_over_screen.dart';
import 'dart:async' as async;

class GreenNinjaPlayer extends SimplePlayer with ObjectCollision, Lighting {
  final double _damage = 20;
  double stamina = 100;
  async.Timer? _timerStamina;
  bool showObserveEnemy = false;
  bool medalObtained = false;


  GreenNinjaPlayer(
      {required Vector2 position, required SpriteSheet spriteSheet})
      : super(
          position: position,
          size: Vector2(Globals.playerSize, Globals.playerSize),
          speed: 220,
          life: 100,
          initDirection: Direction.down,
          animation:
              AnimationConfig.greenNinjaAnimation(spriteSheet: spriteSheet),
        ) {

    setupLighting(LightingConfig(
      radius: width * 2,
      blurBorder: width * 2,
      color: Colors.yellow.withOpacity(0.1),
    ),);

    setupCollision(
      CollisionConfigs.playerCollisionConfig(),
    );
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, dynamic id) {
    if(isDead) return;
    if (attacker == AttackFromEnum.ENEMY) {
      FlameAudio.play(Globals.explosionSound);
    }

    this.showDamage(
      damage,
      config: TextStyle(
        fontSize: Globals.defaultTileSize/5,
        color: Colors.orange,
        fontFamily: "Normal",
      ),
    );
    super.receiveDamage(attacker, damage, id);
  }

  @override
  void die() {
    FlameAudio.play(Globals.gameOverSound);
    gameRef.camera.shake(intensity: 4);
    removeFromParent();
    super.die();
    gameRef.pauseEngine();
    gameRef.overlayManager.add(GameOverScreen.id);
  }

  @override
  void render (Canvas c){
    super.render(c);
  }

  @override
  void update(double dt){
    if (isDead) return;
    _verifyStamina();
    this.seeEnemy(
      radiusVision: Globals.defaultTileSize * 6,
      notObserved: () {
        showObserveEnemy = false;
      },
      observed: (enemies) {
        if (showObserveEnemy) return;
        showObserveEnemy = true;
        _PlayObservedSound();
      },
    );
    super.update(dt);
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if (event.event == ActionEvent.DOWN) {
      if (event.id == AttackType.melee ||
          event.id == LogicalKeyboardKey.space.keyId) {
        // Ataque cuerpo a cuerpo - si estas muerto no haces accion
        if (gameRef.player != null && gameRef.player?.isDead == true) return;
        if (stamina < 15) return;

        simpleAttackMelee(
            withPush: false,
            damage: _damage * 2,
            size: size,
            animationRight: AnimationConfig.cutAnimation());
        decrementStamina(15);
      }


      if (event.id == AttackType.range ||
          event.id == LogicalKeyboardKey.controlLeft.keyId) {
        // Ataque cuerpo a distancia - si estas muerto no hace ninguna accion
        if (gameRef.player != null && gameRef.player?.isDead == true) return;
        if (stamina < 10) return;
        simpleAttackRange(
          damage: _damage,
          animationRight: AnimationConfig.shurikenMagicAnimation(),
          animationLeft: AnimationConfig.shurikenMagicAnimation(),
          animationUp: AnimationConfig.shurikenMagicAnimation(),
          animationDown: AnimationConfig.shurikenMagicAnimation(),
          size: size,
          collision: CollisionConfigs.projectileCollisionConfig(width: width),
        );
        decrementStamina(10);
      }
    }
    super.joystickAction(event);
  }

  void _verifyStamina(){

    if(_timerStamina == null){
      _timerStamina = async.Timer(Duration(milliseconds: 150),(){
        _timerStamina = null;
      });
    }else{
      return;
    }

    stamina += 2;

    if(stamina > 100) {
        stamina = 100;
    }
  }

  void decrementStamina(int i){
   stamina -= i;

   if(stamina < 0) {
     stamina = 0;
   }
  }

  void _PlayObservedSound(){
    // play MGS alert sound effect
    FlameAudio.play(Globals.fireSound);
  }
}
