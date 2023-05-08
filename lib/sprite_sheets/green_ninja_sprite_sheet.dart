import 'package:tfg_flutter_game/constants/globals.dart';
import 'package:bonfire/bonfire.dart';

class GreenNinjaSpriteSheet{

  static Future<void> load() async{

    final image = await Flame.images.load(Globals.greenNinjaSpriteSheet);
    spriteSheet = SpriteSheet.fromColumnsAndRows(
        image: image,
        columns: 4,
        rows: 7
    );
  }

  static late SpriteSheet spriteSheet;
}