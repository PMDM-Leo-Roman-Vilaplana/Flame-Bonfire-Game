// compendio de variables generales para acceder a items facilmente
import 'dart:core';

class Globals {
  Globals._();

  // Time limits
  static const double spriteStepTime = 0.1;

  // Distances
  static const int observeMaxDistance = 70;
  static const int observeMinDistance = 30;
  static const double radiusVision = 130;

  // Sounds
  static const String gameOverSound = 'effects/game_over.wav';
  static const String powerUpSound = 'effects/power_up.wav';
  static const String successSound = 'effects/success.wav';
  static const String explosionSound = 'effects/explosion.wav';
  static const String fireSound = 'effects/fire.wav';

  // Tamaños genericos
  static const double itemSize = 50.0;
  static const double smallItemSize = 25.0;
  static const double defaultTileSize = 32.0;
  static const double playerSize = Globals.defaultTileSize * 1.5;
  static const double dialogBox = 100;

  // Jugadores y modelos de Npc
  static const String greenNinjaSpriteSheet = 'sprite_sheets/green_ninja.png';
  static const String blueNinjaSpriteSheet = 'sprite_sheets/blue_ninja.png';
  static const String darkNinjaSpriteSheet = 'sprite_sheets/dark_ninja.png';
  static const String oldManSpriteSheet = 'sprite_sheets/old_man.png';
  static const String demonCyclopIdlSpriteSheet =
      'sprite_sheets/demon_cyclop_idle.png';
  static const String demonCyclopWalkSpriteSheet =
      'sprite_sheets/demon_cyclop_walk.png';

  // Efectos
  static const String cut = 'effects/cut.png';
  static const String smoke = 'effects/smoke.png';
  static const String bigEnergyBall = 'effects/big_energy_ball.png';
  static const String circularSlash = 'effects/circular_slash.png';
  static const String fireBall = 'effects/fire_ball.png';

  // Items
  static const String medipack = 'items/medipack.png';
  static const String shuriken = 'items/shuriken_single.png';
  static const String shurikenMagic = 'items/shuriken_magic.png';
  static const String sword = 'items/sword.png';
  static const String shurikenSingle = 'items/shuriken_single.png';
  static const String coin = 'items/coin.png';

  // Decoraciones
  static const String fire = 'decorations/fire.png';

  // Mapas
  static const String mapOne = 'map_one.json';
  static const String dungeon = 'dungeon.json';
  static const String woods = 'woods.json';

  //Elementos de UI
  static const String uiHealth = 'ui/health_ui.png';
  static const String uiMelee = 'ui/joystick_atack.png';
  static const String uiRanged = 'ui/joystick_atack_range.png';

  //BGM
  static const String musicMenu = 'bgm/welcome_to_crocodile_isle.mp3';
  static const String musicLvl1 = 'bgm/enemy_of_god.mp3';
  static const String musicLvl2 = 'bgm/majula.mp3';
  static const String musicBoss = 'bgm/boss_theme.mp3';
  static const String musicWin = 'bgm/luiga_theme.mp3';
  static const String musicDefeat = 'bgm/smtIV_tokyo_ooc.mp3';


}