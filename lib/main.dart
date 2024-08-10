import 'package:asteroids/spacecraft.dart';
import 'package:asteroids/star.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(GameWidget(game: MyGame()));
}

class MyGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    await add(
      TextComponent(
        text: "00.0"
      )
    );
    final image = await images.load('crate.png');
    final sheet = SpriteSheet.fromColumnsAndRows(
      image: image,
      columns: 6,
      rows: 1,
    );
    final joystick = JoystickComponent(
      knob: SpriteComponent(
        sprite: sheet.getSpriteById(1),
        size: Vector2.all(100),
      ),
      background: SpriteComponent(
        sprite: sheet.getSpriteById(0),
        size: Vector2.all(150),
      ),
      margin: const EdgeInsets.only(left: 40, bottom: 40),
    );

    final player = Player(joystick);
    add(player);
    add(joystick);
  }
}

class Player extends SpriteComponent with HasGameRef {
  Player(this.joystick)
      : super(
          anchor: Anchor.center,
          size: Vector2.all(100.0),
        );

  /// Pixels/s
  double maxSpeed = 300.0;

  final JoystickComponent joystick;

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite('crate.png',
        srcSize: Vector2.all(38), srcPosition: Vector2.all(0));
    position = gameRef.size / 2;
  }

  @override
  void update(double dt) async {
    if (joystick.direction != JoystickDirection.idle) {
      position.add(joystick.relativeDelta * maxSpeed * dt);
      angle = joystick.delta.screenAngle();
    }
  }
}

class Main extends World {
  final Spacecraft spacecraft;
  final List<Star> stars = [];
  Main() : spacecraft = Spacecraft();
  @override
  void render(Canvas canvas) {
    spacecraft.draw(canvas);
    for (var star in stars) {
      star.draw(canvas);
    }
  }

  @override
  void update(double dt) {
    spacecraft.move();
    for (var star in stars) {
      star.move();
    }
  }

  @override
  onLoad() async {
    final joystick = JoystickComponent(size: 200);
    await add(joystick);
    for (int i = 0; i < 100; i++) {
      final star = Star.random();
      stars.add(star);
      await add(star);
    }
    await add(spacecraft);
  }
}
