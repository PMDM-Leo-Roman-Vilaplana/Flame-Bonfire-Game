import 'package:bonfire/bonfire.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tfg_flutter_game/constants/globals.dart';
import 'package:tfg_flutter_game/constants/animation_config.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:tfg_flutter_game/constants/collision_config.dart';

import '../screens/victory_screen.dart';
class DemonEnemy extends SimpleEnemy with AutomaticRandomMovement, UseBarLife, ObjectCollision {

  // TODO: Ataque de los enemigos OWO
  bool _seePlayerToAttackMelee = false;
  final double _damage = 10;
  bool _observed = false;
  DemonEnemy({required Vector2 position})
      : super (
    position: position,
    size: Vector2(Globals.playerSize * 3, Globals.playerSize * 3),
    speed: 70,
    life: 400,
    initDirection: Direction.down,
    animation:
    AnimationConfig.demonCyclopAnimation(),
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
    FlameAudio.bgm.stop();
    FlameAudio.bgm.play(Globals.musicWin);
    gameRef.camera.shake(intensity: 4);
    removeFromParent();
    super.die();
    FlameAudio.play(Globals.successSound);
    gameRef.pauseEngine();
    gameRef.overlayManager.add(GameWonScreen.id);
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
        radiusVision: Globals.radiusVision * 6,
        observed: (){
          if(!_observed) {
            _observed = true;
            FlameAudio.bgm.play(Globals.musicBoss);
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
                animationRight: AnimationConfig.fireBallAnimation(),
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