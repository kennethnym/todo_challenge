import 'dart:math';

/// Provides additional util functions on [Random]
extension RandomUtils on Random {
  /// Generate a random number with [bit] bits.
  int nextBigInt({required int bit}) {
    // we generate the number in chunks of 16 bits.
    // since [nextInt] only supports up to 2^32 - 1.
    const chunkSize = 16;

    var result = 0;
    var chunks = bit / chunkSize;
    for (var i = 0; i < chunks; i++) {
      final chunk = nextInt(1 << chunkSize);
      result <<= chunkSize;
      result += chunk;
    }

    return result;
  }
}
