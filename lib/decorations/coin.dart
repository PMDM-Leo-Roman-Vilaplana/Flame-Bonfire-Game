import 'package:bonfire/bonfire.dart';
import 'package:flame_audio/flame_audio.dart';

import '../constants/animation_config.dart';
import '../constants/globals.dart';
import '../players/green_ninja_player.dart';
import '../screens/victory_screen.dart';

class Coin extends GameDecoration with Sensor<GreenNinjaPlayer>{

  Coin({required Vector2 position}):
       super.withAnimation(animation: AnimationConfig.coinAnimation(), position: position, size: Vector2.all(Globals.smallItemSize));

  @override
  void onContact(GameComponent collision) {

    // recupera vida en contacto con el botiquin

    if (collision is GreenNinjaPlayer) {

      FlameAudio.play(Globals.successSound);
      removeFromParent();
      collision.medalObtained = true;
      // una vez recogida la moneda, se mostrara en la ui.
    }

    // antes, recoger la medalla terminaba la partida
    //gameRef.pauseEngine();
    //gameRef.overlayManager.add(GameWonScreen.id);

  }
}