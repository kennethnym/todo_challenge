import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';

/// A [Provider] that provides an instance of [Random] for generating
/// random things.
final randomGeneratorProvider = Provider((_) => Random.secure());
