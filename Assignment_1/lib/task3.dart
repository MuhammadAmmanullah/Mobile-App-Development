import 'dart:io';

void main() {
  stdout.write('Enter an integer n: ');
  String? input = stdin.readLineSync();
  int? n = int.tryParse(input ?? '');

  if (n == null || n <= 0) {
    print('Please enter a positive integer greater than 0.');
    return;
  }

  for (int row = 1; row <= n; row++) {
    // Build the line 1 2 ... row
    StringBuffer line = StringBuffer();
    for (int num = 1; num <= row; num++) {
      line.write(num);
      if (num != row) line.write(' ');
    }
    print(line.toString());
  }
}
