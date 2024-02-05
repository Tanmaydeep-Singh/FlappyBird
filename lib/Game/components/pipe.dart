import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/Game/assets.dart';
import 'package:flappy_bird/Game/components/confi.dart';
import 'package:flappy_bird/Game/flappy_bird.dart';
import 'package:flappy_bird/Game/pipe_position.dart';

class Pipe extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Pipe({
    required this.pipePostion,
    required this.height,
  });

  @override
  final double height;
  final PipePostion pipePostion;

  @override
  Future<void> onLoad() async {
    final pipe = await Flame.images.load(Assets.pipe);
    final pipeRotated = await Flame.images.load(Assets.pipeRotated);
    size = Vector2(50, height);

    switch (pipePostion) {
      case PipePostion.top:
        position.y = 0;
        sprite = Sprite(pipeRotated);
        break;
      case PipePostion.bottom:
        position.y = gameRef.size.y - size.y - Config.groundHeight;
        sprite = Sprite(pipe);
        break;
    }

    add(RectangleHitbox());
  }
}
