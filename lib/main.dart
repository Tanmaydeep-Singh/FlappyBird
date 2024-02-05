import 'dart:js';

import 'package:flame/game.dart';
import 'package:flappy_bird/Game/flappy_bird.dart';
import 'package:flappy_bird/Game/screens/gameOverScreen.dart';
import 'package:flappy_bird/Game/screens/mainMenuScreen.dart';
import 'package:flutter/material.dart';

final game = FlappyBirdGame();
void main() {
  runApp(GameWidget(
    game: game,
    initialActiveOverlays: const [MainMenuScreen.id],
    overlayBuilderMap: {
      'mainMenu': (context, _) => MainMenuScreen(game: game),
      'gameOver': (context, _) => GameOverScreen(game: game)
    },
  ));
}
