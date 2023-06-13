import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tfg_flutter_game/constants/globals.dart';
import 'package:tfg_flutter_game/constants/animation_config.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:tfg_flutter_game/constants/collision_config.dart';

import '../decorations/medipack.dart';
class DarkNinjaEnemy extends SimpleEnemy with AutomaticRandomMovement, UseBarLife, ObjectCollision {

  // TODO: Ataque de los enemigos OWO
  bool _seePlayerToAttackMelee = false;
  final double _damage = 10;
  bool _observed = false;
  DarkNinjaEnemy({required Vector2 position, required SpriteSheet spriteSheet})
  : super (
      position: position,
      size: Vector2(Globals.playerSize, Globals.playerSize),
      speed: 100,
      life: 100,
      initDirection: Direction.down,
      animation:
        AnimationConfig.darkNinjaAnimation(spriteSheet: spriteSheet),
  ){
    setupBarLife(showLifeText: false, borderRadius: BorderRadius.circular(2), borderWidth: 2);
    setupCollision(
        CollisionConfigs.playerCollisionConfig(),
    );
  }
  @override
  void receiveDamage(AttackFromEnum attacker, double damage, identify){
    
    FlameAudio.play(Globals.explosionSound);
    showDamage(damage, config:TextStyle(fontSize: width/3, color: Colors.red));
    super.receiveDamage(attacker, damage, identify);
  }

  @override
  void die(){
    gameRef.camera.shake(intensity: 4);
    removeFromParent();
    super.die();

    bool drop = Random().nextBool();

    if(drop){
      gameRef.add(Medipack(position:position));
    }
  }

  @override
  void update (double dt) {
    _seePlayerToAttackMelee = false;
    if(!gameRef.sceneBuilderStatus.isRunning){

      seeAndMoveToPlayer(
          closePlayer: (player) {
            if (!player.isDead){
              simpleAttackMelee(
                  withPush: false,
                  damage: _damage * 2,
                  size: size,
                  animationRight: AnimationConfig.cutAnimation());
            }
          },
          radiusVision: Globals.radiusVision,
          observed: (){
            if(!_observed) {
              _observed = true;
            }
          },
      );

      if(!_seePlayerToAttackMelee){
        seeAndMoveToAttackRange(
            minDistanceFromPlayer: Globals.defaultTileSize * 4,
            positioned: (player) {
              if(!player.isDead){
                simpleAttackRange(
                    damage: _damage,
                    animationRight: AnimationConfig.shurikenAnimation(),
                    animationDestroy: AnimationConfig.smokeAnimation(),
                    size: size,
                    collision:
                        CollisionConfigs.projectileCollisionConfig(width: width),
                );
              }
            },
            radiusVision: Globals.radiusVision * 2,
            notObserved: () {
              runRandomMovement(
                dt,
                maxDistance: Globals.observeMaxDistance,
                minDistance: Globals.observeMinDistance,
              );
            },
        );
      }
    }
    super.update(dt);
  }
}