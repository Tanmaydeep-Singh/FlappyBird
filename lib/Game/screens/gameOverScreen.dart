import 'package:flappy_bird/Game/assets.dart';
import 'package:flappy_bird/Game/flappy_bird.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GameOverScreen extends StatelessWidget {
  final FlappyBirdGame game;
  static const String id = "gameOver";
  const GameOverScreen({super.key, required this.game}) : super();

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();

    return Material(
      color: Colors.black38,
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Score: ${game.bird.score}',
              style: const TextStyle(
                fontSize: 60,
                fontFamily: 'Game',
                color: Colors.white,
              )),
          Image.asset(Assets.gameOver),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onRestart,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            child: const Text(
              'Restart',
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      )),
    );
  }

  void onRestart() {
    game.bird.reset();
    game.overlays.remove('gameOver');
    game.resumeEngine();
  }
}
