import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird/Game/assets.dart';
import 'package:flappy_bird/Game/flappy_bird.dart';

class Background extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  Background();

  @override
  Future<void> onLoad() async {
    final background = await Flame.images.load(Assets.backgorund);
    size = gameRef.size;
    sprite = Sprite(background);
  }
}
