import 'package:bonfire/bonfire.dart';
import 'package:tfg_flutter_game/players/green_ninja_player.dart';
import 'package:flutter/material.dart';
import 'package:tfg_flutter_game/constants/globals.dart';

class BarHPComponent extends InterfaceComponent {

  double padding = 20;
  double widthBar = 90;
  double strokeWidth = 12;
  double maxLife = 0;
  double life = 0;

  //stamina ?

  double stamina = 0;
  double maxStamina = 100;

  BarHPComponent()
      : super (
          id: 1,
          position: Vector2(20,20),
          spriteUnselected: Sprite.load(Globals.uiHealth),
          size: Vector2(120,40),
  );

  @override
  void update (double t){
      if (gameRef.player != null){
        life = gameRef.player!.life;
        maxLife = gameRef.player!.maxLife;

        if (gameRef.player is GreenNinjaPlayer){
         stamina = (gameRef.player as GreenNinjaPlayer).stamina;
        }
      }
      super.update(t);
  }

  @override
  void render (Canvas c){
    try {
      _drawLife(c);
      _drawStamina(c);
    }catch(e){}
    super.render(c);
  }

  void _drawLife(Canvas canvas){

    //medidas de la barra de vida
    double xBar = 48;
    double yBar = 31.5;

    // barra inferior que va a contener otra barra cuyo tamaño variara representando la vida actual del persobaje
    canvas.drawLine(
      Offset(xBar,yBar),
      Offset(xBar + widthBar, yBar),
      Paint()
        ..color = Colors.blueGrey[800]!
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.fill);


    double currentBarLife = (life * widthBar) / maxLife;

    canvas.drawLine(
      Offset(xBar,yBar),
      Offset(xBar + currentBarLife, yBar),
      Paint()
        ..color = _getColorLife(currentBarLife)
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.fill);
  }

  void _drawStamina(Canvas canvas){

    double xBar = 48;
    double yBar = 47;

    double currentBarStamina = (stamina * widthBar) / maxStamina;

    canvas.drawLine(
        Offset(xBar, yBar),
        Offset(xBar + currentBarStamina, yBar),
        Paint()
          ..color = Colors.yellow
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.fill);
  }

  // cambiamos el color de la barra de vida en función de la vida restante
  Color _getColorLife(double currentBarLife){

    if (currentBarLife > widthBar - (widthBar/ 3)){
      return Colors.green;
    }
    if (currentBarLife > (widthBar / 3)){
      return Colors.yellow;
    }else {
      return Colors.red;
    }
  }
}