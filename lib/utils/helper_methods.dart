import 'dart:math';

final _random = Random();

/// delay random duration
/// the max duration is 2 seconds
randomDelay() {
  Future.delayed(Duration(milliseconds: _random.nextInt(2000)));
}
