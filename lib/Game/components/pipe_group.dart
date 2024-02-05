import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappy_bird/Game/components/confi.dart';
import 'package:flappy_bird/Game/components/pipe.dart';
import 'package:flappy_bird/Game/flappy_bird.dart';
import 'package:flappy_bird/Game/pipe_position.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappyBirdGame> {
  PipeGroup();

  final random = Random();

  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x;
    final heightMinusGround = gameRef.size.y - Config.groundHeight;
    final spacing = 100 + random.nextDouble() * (heightMinusGround / 4);
    final centerY =
        spacing + random.nextDouble() * (heightMinusGround - spacing);
    addAll([
      Pipe(pipePostion: PipePostion.top, height: centerY - spacing / 2),
      Pipe(
          pipePostion: PipePostion.bottom,
          height: heightMinusGround - (centerY + spacing / 2)),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt;

    if (position.x < -20) {
      removeFromParent();
      updateScore();
    }

    if (gameRef.isHit) {
      removeFromParent();
      gameRef.isHit = false;
    }
  }

  updateScore() {
    gameRef.bird.score += 1;
  }
}
