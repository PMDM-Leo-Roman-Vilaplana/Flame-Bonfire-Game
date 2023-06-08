import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:tfg_flutter_game/constants/globals.dart';
import 'package:tfg_flutter_game/game/the_green_ninja_game.dart';
import 'package:tfg_flutter_game/screens/main_menu.dart';
import 'package:tfg_flutter_game/sprite_sheets/sprite_sheets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await OldManSpriteSheet.load();
  await GreenNinjaSpriteSheet.load();
  await DarkNinjaSpriteSheet.load();
  await BlueNinjaSpriteSheet.load();

  await FlameAudio.audioCache.loadAll([
    Globals.gameOverSound,
    Globals.powerUpSound,
    Globals.successSound,
    Globals.explosionSound,
    Globals.fireSound,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Game',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Menu());
  }
}
