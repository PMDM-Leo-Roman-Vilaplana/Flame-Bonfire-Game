import 'package:bonfire/bonfire.dart';
import 'package:flutter/services.dart';
import 'package:tfg_flutter_game/constants/globals.dart';
import 'package:flutter/material.dart';
import 'package:tfg_flutter_game/enemies/blue_ninja.dart';
import 'package:tfg_flutter_game/enemies/dark_ninja.dart';
import 'package:tfg_flutter_game/enemies/demon_enemy.dart';
import 'package:tfg_flutter_game/enums/attack_type.dart';
import 'package:tfg_flutter_game/enums/map_id.dart';
import 'package:tfg_flutter_game/screens/game_over_screen.dart';
import 'package:tfg_flutter_game/sprite_sheets/old_man_sprite_sheet.dart';
import 'package:tfg_flutter_game/sprite_sheets/sprite_sheets.dart';

import '../NPC/inmate.dart';
import '../NPC/inmate2.dart';
import '../NPC/old_man_npc.dart';
import '../decorations/fire.dart';
import '../hitboxes/exit_door.dart';
import '../hitboxes/void.dart';
import '../hitboxes/wall.dart';
import '../interface/NinjaInterface.dart';
import '../players/green_ninja_player.dart';
import '../screens/victory_screen.dart';
import '../sprite_sheets/green_ninja_sprite_sheet.dart';

MapId currentMapId = MapId.uno;
late Function(MapId) selectMap;

class GreenNinjaGame extends StatefulWidget {
  static bool useJoystick = true;
  const GreenNinjaGame({Key? key}) : super(key: key);

  @override
  State<GreenNinjaGame> createState() => _GreenNinjaGameState();
}

class _GreenNinjaGameState extends State<GreenNinjaGame> {

  @override
  void dispose(){
    currentMapId = MapId.uno;
    super.dispose();
  }

  @override
  void initState() {
    selectMap = (MapId id) {
      setState(() {
        currentMapId = id;
      });
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Joystick joystick =  Joystick(
        directional: JoystickDirectional(),
        actions:[
          JoystickAction(actionId: AttackType.melee,
            size: 60,
            margin: EdgeInsets.only(bottom:50, right: 50),
            align: JoystickActionAlign.BOTTOM_RIGHT,
            sprite: Sprite.load(Globals.uiMelee),
          ),
          JoystickAction(actionId: AttackType.range,
            size: 60,
            margin: EdgeInsets.only(bottom:50, right: 160),
            align: JoystickActionAlign.BOTTOM_RIGHT,
            sprite: Sprite.load(Globals.uiRanged),
          )
        ]
    );

    if(!GreenNinjaGame.useJoystick){
      joystick = Joystick(
        keyboardConfig: KeyboardConfig(
          keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
          acceptedKeys: [
              LogicalKeyboardKey.space,
              LogicalKeyboardKey.controlLeft,
          ],
        ),
      );
    }
    switch(currentMapId){
      default:
        return BonfireWidget(
            key: Key(DateTime.now().toIso8601String()),
            showCollisionArea: true,
            overlayBuilderMap: {
              GameOverScreen.id:(context,game)=> const GameOverScreen(),
              GameWonScreen.id:(context,game)=> const GameWonScreen(),
              'mini_map':(context,game) => MiniMap(
                  game:game,
                  size: Vector2(120,120),
                  margin: EdgeInsets.all(20),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color:Colors.white.withOpacity(0.5),)
              ),
            },
            interface: NinjaInterface(),
            initialActiveOverlays: const <String>['mini_map'],
            lightingColorGame: Colors.black.withOpacity(0.7),
            // si no tenemos un objeto jugador el joystick moverá el mapa
            player: GreenNinjaPlayer(
                position: Vector2(600, 170),
                spriteSheet: GreenNinjaSpriteSheet.spriteSheet),
            joystick: joystick,
            map: WorldMapByTiled(Globals.dungeon,
              forceTileSize: Vector2(32, 32),
              objectsBuilder: {
                'old_man': (properties) => OldManNpc(position: properties.position, spriteSheet: OldManSpriteSheet.spriteSheet),
                'dark_ninja': (properties) => DarkNinjaEnemy(position: properties.position, spriteSheet: DarkNinjaSpriteSheet.spriteSheet),
                'demon': (properties) => DemonEnemy(position: properties.position),
                'blue_ninja':(properties) => BlueNinjaEnemy(position: properties.position ,spriteSheet: BlueNinjaSpriteSheet.spriteSheet),
                'fire':(properties)=>Fire(position:properties.position),
                'inmate':(properties) => Inmate(position:properties.position, size: Globals.defaultTileSize, showcaseText: "Inmate"),
                'inmate2': (properties) => Inmate2(position: properties.position, size:Globals.defaultTileSize, showcaseText: "Inmate2"),
                'void':(properties)=>VoidFall(position:properties.position),
                'wall':(properties)=>Wall(position:properties.position),
                'exit_door':(properties)=>ExitDoor(position:properties.position),
              },
            )
        );
        break;
    }
  }
}
