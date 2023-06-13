import 'package:bonfire/bonfire.dart';
import 'package:flame_audio/flame_audio.dart';

import '../constants/animation_config.dart';
import '../constants/globals.dart';
import '../players/green_ninja_player.dart';
import '../screens/victory_screen.dart';

class Wall extends GameDecoration with ObjectCollision {
  Wall({required Vector2 position})
      : super(
          position: position,
          size: Vector2.all(Globals.defaultTileSize),
        ) {
    setupCollision(
      CollisionConfig(
        enable: true,
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(32, 32),
            align: Vector2(0, 0),
          ),
        ],
      ),
    );
  }

  @override
  void onContact(GameComponent component) {
    component = component as GreenNinjaPlayer;
    // sonido de colision contra pared
  }
}
