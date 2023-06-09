import 'package:bonfire/bonfire.dart';

class CollisionConfigs {
  CollisionConfigs._();

  // colisiones del personaje jugable
  static CollisionConfig playerCollisionConfig() => CollisionConfig(
    collisions: [
      CollisionArea.circle(
        radius: 21.5,
        align: Vector2(
          12.5,
          0,
        ),
      ),
    ],
  );

  // configuracion generica para proyectiles
  static CollisionConfig projectileCollisionConfig({required double width}) =>
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2.all(width / 2),
            align: Vector2(width * 0.25, width * 0.25),
          ),
        ],
      );
}