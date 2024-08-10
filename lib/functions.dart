import 'dart:math';

double radians(double angle) {
  return 0;
}
double degrees(double angle) {
  return 0;
}
final _random = Random();
double random([double start = 0, double end = 10]){
  return _random.nextDouble() * (end - start) + start;
}