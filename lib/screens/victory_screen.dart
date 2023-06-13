import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../enums/map_id.dart';
import '../game/the_green_ninja_game.dart';

class GameWonScreen extends StatelessWidget {
  const GameWonScreen ({Key? key}) : super(key: key);

  static const String id = 'victory';
  @override
  Widget build(BuildContext context) => Material(
    color: Colors.transparent.withOpacity(0.8),
    child: Center(
        child:
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("ENEMIGO DERROTADO",
              style: TextStyle(
                color: Colors.green,
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
