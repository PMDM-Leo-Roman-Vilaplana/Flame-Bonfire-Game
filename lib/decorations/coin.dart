import 'package:bonfire/bonfire.dart';
import 'package:flame_audio/flame_audio.dart';

import '../constants/animation_config.dart';
import '../constants/globals.dart';
import '../players/green_ninja_player.dart';

class Coin extends GameDecoration with Sensor<GreenNinjaPlayer>{

  Coin({required Vector2 position}):
       super.withAnimation(animation: AnimationConfig.coinAnimation(), position: position, size: Vector2.all(Globals.smallItemSize));

  @override
  void onContact(GameComponent component) {

    // recupera vida en contacto con el botiquin

    FlameAudio.play(Globals.successSound);
    removeFromParent();
  }
}