import 'package:bonfire/bonfire.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../constants/animation_config.dart';
import '../constants/globals.dart';
import '../enums/map_id.dart';
import '../game/the_green_ninja_game.dart';
import '../players/green_ninja_player.dart';
import '../screens/victory_screen.dart';
import '../sprite_sheets/green_ninja_sprite_sheet.dart';
import '../sprite_sheets/old_man_sprite_sheet.dart';

class ExitDoor extends SimpleNpc with Sensor<GreenNinjaPlayer> {
  ExitDoor({required Vector2 position})
      : super(
    position: position,
    size: Vector2.all(Globals.defaultTileSize),
  );

  @override
  void onContact(GameComponent component) {
    component = component as GreenNinjaPlayer;

    if (component.medalObtained) {
      FlameAudio.play(Globals.successSound);

      selectMap(MapId.dos);

    } else {
        _escapeDialog();
        component.position = Vector2(100,140);
    }
  }

  void _escapeDialog(){
    gameRef.camera.moveToTargetAnimated(this, zoom: 2, finish: () {
      TalkDialog.show(gameRef.context, [
        _speak(text: "Esta puerta tiene una hendidura extraña... parece una medalla", isHero: true),
      ], logicalKeyboardKeysToNext: [
        LogicalKeyboardKey.space,
        LogicalKeyboardKey.enter,
      ], onClose: () {
        gameRef.camera.moveToPlayerAnimated(zoom: 1);
      });
    });
  }

  Say _speak({required String text, required bool isHero}) => Say(
      text: [TextSpan(text: text)],
      person: SizedBox(
        height: Globals.dialogBox,
        width: Globals.dialogBox,
        child: isHero
            ? GreenNinjaSpriteSheet.spriteSheet.getSprite(0, 0).asWidget()
            : OldManSpriteSheet.spriteSheet.getSprite(0, 0).asWidget(),
      ),
      personSayDirection:
      isHero ? PersonSayDirection.LEFT : PersonSayDirection.RIGHT);
}
