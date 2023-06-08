import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../enums/map_id.dart';
import '../game/the_green_ninja_game.dart';

class GameOverScreen extends StatelessWidget {
  const GameOverScreen({Key? key}) : super(key: key);

  static const String id = 'game_over';

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.transparent.withOpacity(0.5),
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("HAS MUERTO",
              style: TextStyle(
                color: Colors.red,
                fontSize: 100,
                fontWeight: FontWeight.bold,
              )),
                  SizedBox(height:100),
                  ElevatedButton(
                      onPressed: ()=> selectMap(MapId.uno),
                      child: const Text('Volver a empezar'))
        ])),
      );
}
