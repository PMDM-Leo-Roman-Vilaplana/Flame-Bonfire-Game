import 'dart:async' as async;
import 'package:bonfire/bonfire.dart';
import 'package:tfg_flutter_game/game/the_green_ninja_game.dart';
import 'package:tfg_flutter_game/constants/animation_config.dart';
import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:tfg_flutter_game/sprite_sheets/sprite_sheets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tfg_flutter_game/utils/custom_sprite_animation_widget.dart';
import 'package:tfg_flutter_game/utils/audio_controller.dart';
import 'package:tfg_flutter_game/widgets/custom_radio.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});


  @override
  _MenuState createState() => _MenuState();

}

class _MenuState extends State<Menu>{

  bool showSplash = true;
  int currentPosition = 0;
  late async.Timer _timer;

  List<SpriteAnimation?> sprites = [

    AnimationConfig.greenNinjaAnimation(spriteSheet: GreenNinjaSpriteSheet.spriteSheet).idleRight,
    AnimationConfig.oldManAnimation(spriteSheet: OldManSpriteSheet.spriteSheet).idleRight,
    AnimationConfig.darkNinjaAnimation(spriteSheet: DarkNinjaSpriteSheet.spriteSheet).idleRight,
    AnimationConfig.blueNinjaAnimation(spriteSheet: BlueNinjaSpriteSheet.spriteSheet).idleRight,
    AnimationConfig.demonCyclopAnimation().idleRight,

  ];

  @override
  void dispose(){
    // Sounds.stopBackgroundSound()
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      child: showSplash ? buildSplash() : buildMenu(),
    );
  }

  Widget buildMenu(){
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Column (
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text("Chingo Mototruco",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Normal',
                    fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if(sprites.isNotEmpty)
                SizedBox(
                  height: 100,
                  width: 100,
                  child: CustomSpriteAnimationWidget(
                    animation: sprites[currentPosition],
                  ),
                ),
              const SizedBox(
                height:30,
              ),
              SizedBox(
                height: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    minimumSize: Size(100,40),
                  ),
                  child: const Text(
                    "Juega ahora",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Normal',
                      fontSize: 17.0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder:(context) => const GreenNinjaGame()),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20
              ),
              DefectorRadio<bool>(
                value: false,
                label: 'Keyboard',
                group: GreenNinjaGame.useJoystick,
                onChange: (value){
                  setState((){
                    GreenNinjaGame.useJoystick = value;
                  });
                },
              ),
              const SizedBox(
                height:10,
              ),
              DefectorRadio<bool>(
                value: true,
                label: 'Joystick',
                group: GreenNinjaGame.useJoystick,
                onChange: (value){
                  setState((){
                    GreenNinjaGame.useJoystick = value;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              if(!GreenNinjaGame.useJoystick)
                SizedBox(
                  height: 80,
                  width: 200,
                  child: Sprite.load('').asWidget(),
                )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 20,
          margin: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                "Desarrollado por "
              ),
              InkWell(
                onTap: () {
                  _launchURL("https://github.com/PMDM-Leo-Roman-Vilaplana/Flame-Bonfire-Game");
                },
                child: const Text(
                  'Leo "leshrike" Roman',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                    fontFamily: 'Normal',
                    fontSize: 12.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSplash(){
    return FlameSplashScreen(
        theme: FlameSplashTheme.dark,
        onFinish: (BuildContext context){
          setState((){
            showSplash = false;
          });
          startTimer();
        },
    );
  }

  void startTimer(){
    _timer = async.Timer.periodic(Duration(seconds: 2), (timer) {
      currentPosition++;
      if(currentPosition > sprites.length - 1){
        currentPosition = 0;
      }
    });
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(url as Uri)){
      await launchUrl(url as Uri);
    }
  }

}