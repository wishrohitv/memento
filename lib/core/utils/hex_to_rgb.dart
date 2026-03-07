import 'dart:ui';

Color hexToRGB(String hex) {
  return Color(int.parse(hex, radix: 16) + 0xFF000000);
}
