import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/Game/components/background.dart';
import 'package:flappy_bird/Game/components/bird.dart';
import 'package:flappy_bird/Game/components/confi.dart';
import 'package:flappy_bird/Game/components/ground.dart';
import 'package:flappy_bird/Game/components/pipe_group.dart';
import 'package:flutter/material.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  late Bird bird;
  late TextComponent score;
  bool isHit = false;

  Timer intervel = Timer(Config.pipeInterval, repeat: true);

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      score = buildScore(),
    ]);

    intervel.onTick = () => add(PipeGroup());
  }

  TextComponent buildScore() {
    return TextComponent(
      text: 'Score: 0',
      position: Vector2(size.x / 2, size.y / 2 * 0.2),
      anchor: Anchor.center,
      textRenderer: TextPaint(
          style: TextStyle(
        fontSize: 60,
        fontFamily: 'Game',
        color: Colors.white,
      )),
    );
  }

  @override
  void onTap() {
    super.onTap();
    bird.fly();
  }

  @override
  void update(double dt) {
    super.update(dt);
    intervel.update(dt);
    score.text = 'Score: ${bird.score}';
  }
}
