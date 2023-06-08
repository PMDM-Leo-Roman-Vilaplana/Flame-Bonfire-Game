import 'package:bonfire/bonfire.dart';
import 'package:flame_audio/flame_audio.dart';

import '../constants/globals.dart';
import '../players/green_ninja_player.dart';

class HealingHerb extends GameDecoration with Sensor<GreenNinjaPlayer>{

  final double _hp = 25;

  HealingHerb({required Vector2 position}): super.withSprite(sprite: Sprite.load(Globals.medipack), position: position, size: Vector2.all(Globals.smallItemSize),);

  @override
  void onContact(GameComponent component) {

    // recupera vida en contacto con el botiquin

    FlameAudio.play(Globals.powerUpSound);
    removeFromParent();
    gameRef.player!.addLife(_hp);
  }
}