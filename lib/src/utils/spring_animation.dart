import 'package:flutter/animation.dart';
import 'package:flutter/physics.dart';

/// An extension on [AnimationController] that provides
/// a shorthand to perform spring-based animations.
extension SpringAnimation on AnimationController {
  /// Performs a spring-based animation with the given parameters, starting
  /// from the current value of this [AnimationController].
  void spring({
    required double to,
    double stiffness = 300,
    double damping = 40,
  }) {
    animateWith(
      SpringSimulation(
        SpringDescription(stiffness: stiffness, damping: damping, mass: 1.0),
        value,
        to,
        1.0,
      ),
    );
  }
}
