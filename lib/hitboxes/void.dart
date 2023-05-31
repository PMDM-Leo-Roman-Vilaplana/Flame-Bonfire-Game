import 'package:bonfire/bonfire.dart';
import 'package:flame_audio/flame_audio.dart';

import '../constants/animation_config.dart';
import '../constants/globals.dart';
import '../players/green_ninja_player.dart';
import '../screens/victory_screen.dart';

class VoidFall extends GameDecoration with Sensor<GreenNinjaPlayer> {
  final double _damage = 10;

  VoidFall({required Vector2 position}) :
        super(
        position: position,
        size: Vector2.all(Globals.defaultTileSize),
      );

  @override
  void onContact(GameComponent component) {
    // recupera vida en contacto con el botiquin
    component = component as GreenNinjaPlayer;
    component.position = Vector2(80,120);
    component.showDamage(_damage);
    component.removeLife(_damage);
  }
}