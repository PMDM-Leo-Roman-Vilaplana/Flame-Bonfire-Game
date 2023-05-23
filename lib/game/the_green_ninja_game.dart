import 'package:bonfire/bonfire.dart';
import 'package:flutter/services.dart';
import 'package:tfg_flutter_game/constants/globals.dart';
import 'package:flutter/material.dart';
import 'package:tfg_flutter_game/enemies/blue_ninja.dart';
import 'package:tfg_flutter_game/enemies/dark_ninja.dart';
import 'package:tfg_flutter_game/enemies/demon_enemy.dart';
import 'package:tfg_flutter_game/enums/attack_type.dart';
import 'package:tfg_flutter_game/sprite_sheets/old_man_sprite_sheet.dart';
import 'package:tfg_flutter_game/sprite_sheets/sprite_sheets.dart';

import '../NPC/old_man_npc.dart';
import '../decorations/fire.dart';
import '../players/green_ninja_player.dart';
import '../sprite_sheets/green_ninja_sprite_sheet.dart';

class GreenNinjaGame extends StatefulWidget {
  const GreenNinjaGame({Key? key}) : super(key: key);

  @override
  State<GreenNinjaGame> createState() => _GreenNinjaGameState();
}

class _GreenNinjaGameState extends State<GreenNinjaGame> {
  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      lightingColorGame: Colors.black.withOpacity(0.5),
      // si no tenemos un objeto jugador el joystick moverá el mapa
        player: GreenNinjaPlayer(
            position: Vector2(40, 40),
            spriteSheet: GreenNinjaSpriteSheet.spriteSheet),
        joystick: Joystick(
          directional: JoystickDirectional(),
          keyboardConfig: KeyboardConfig(keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
            acceptedKeys: [
              LogicalKeyboardKey.space,
              LogicalKeyboardKey.controlLeft,
            ],
          ),
            actions:[
                JoystickAction(actionId: AttackType.melee,
                size: 80,
                margin: EdgeInsets.only(bottom:50, right: 50),
                  align: JoystickActionAlign.BOTTOM_RIGHT,
                  sprite: Sprite.load(Globals.sword),
                ),

              JoystickAction(actionId: AttackType.range,
                size: 50,
                margin: EdgeInsets.only(bottom:50, right: 160),
                align: JoystickActionAlign.BOTTOM_RIGHT,
                sprite: Sprite.load(Globals.shurikenSingle),
              )
            ]
        ),
        map: WorldMapByTiled(Globals.mapOne,
            forceTileSize: Vector2(32, 32),
            objectsBuilder: {
              'old_man': (properties) => OldManNpc(position: properties.position, spriteSheet: OldManSpriteSheet.spriteSheet),
              'dark_ninja': (properties) => DarkNinjaEnemy(position: properties.position, spriteSheet: DarkNinjaSpriteSheet.spriteSheet),
              'demon': (properties) => DemonEnemy(position: properties.position),
              'blue_ninja':(properties) => BlueNinjaEnemy(position: properties.position ,spriteSheet: BlueNinjaSpriteSheet.spriteSheet),
              'fire':(properties)=>Fire(position:properties.position),
            },
        )
    );
  }
}
