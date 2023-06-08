import 'package:bonfire/bonfire.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:tfg_flutter_game/enemies/dark_ninja.dart';

import '../constants/animation_config.dart';
import '../constants/globals.dart';
import '../players/green_ninja_player.dart';
import '../screens/victory_screen.dart';

class VoidFall extends GameDecoration with Sensor  {
  final double _damage = 5;

  VoidFall({required Vector2 position}) :
        super(
        position: position,
        size: Vector2.all(Globals.defaultTileSize),
      );

  @override
  void onContact(GameComponent component) {

    if (component is GreenNinjaPlayer){
      component.position = Vector2(600, 170);
      component.showDamage(_damage);
      component.removeLife(_damage);
    }

    if (component is DarkNinjaEnemy){
      // si un ninja negro (enemigo base) cae en el vacio, muere
      component.removeFromParent();
    }
  }
}