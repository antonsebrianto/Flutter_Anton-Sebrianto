import 'dart:io';

void main() {
  for (int i = 1, k = 0; i <= 10; ++i, k = 0) {
    for (int space = 1; space <= 10 - i; ++space) {
      stdout.write("  ");
    }

    while (k != 2 * i - 1) {
      stdout.write("* ");
      ++k;
    }
    print("");
  }
}
