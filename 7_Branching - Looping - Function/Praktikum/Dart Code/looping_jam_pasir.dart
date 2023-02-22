import 'dart:io';

int n = 5;

void main() {
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < i; j++) {
      stdout.write(" ");
    }
    for (int k = 0; k < (n - i) * 2 - 1; k++) {
      stdout.write("0");
    }
    print("");
  }

  for (int i = 2; i <= n; i++) {
    for (int j = 1; j <= n - i; j++) {
      stdout.write(" ");
    }
    for (int k = 0; k < 2 * i - 1; k++) {
      stdout.write("0");
    }
    print("");
  }
}
