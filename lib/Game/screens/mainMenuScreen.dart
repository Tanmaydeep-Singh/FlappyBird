import 'package:flappy_bird/Game/assets.dart';
import 'package:flappy_bird/Game/flappy_bird.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainMenuScreen extends StatelessWidget {
  final FlappyBirdGame game;
  static const String id = "mainMenu";
  const MainMenuScreen({super.key, required this.game}) : super();
  @override
  Widget build(BuildContext context) {
    game.pauseEngine();

    return Scaffold(
        body: GestureDetector(
      onTap: () {
        game.overlays.remove('mainMenu');
        game.resumeEngine();
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.menu), fit: BoxFit.cover)),
        child: Image.asset(Assets.message),
      ),
    ));
  }
}
