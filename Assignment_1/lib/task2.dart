import 'dart:io';

void main() {
  stdout.write('Enter your name: ');
  String? name = stdin.readLineSync();
  name = (name == null || name.trim().isEmpty) ? 'User' : name.trim();

  stdout.write('Enter your age: ');
  String? ageInput = stdin.readLineSync();
  int? age = int.tryParse(ageInput ?? '');

  if (age == null) {
    print(
      'Invalid age input. Please run the program again and enter a valid number.',
    );
    return;
  }

  if (age < 18) {
    print('Sorry $name, you are not eligible to register.');
    return; // stop execution
  }

  stdout.write('How many numbers do you want to enter? ');
  String? nInput = stdin.readLineSync();
  int? n = int.tryParse(nInput ?? '');

  if (n == null || n <= 0) {
    print('Please enter a valid positive number for quantity. Exiting.');
    return;
  }

  List<int> numbers = [];

  for (int i = 0; i < n; i++) {
    stdout.write('Enter number ${i + 1}: ');
    String? numInput = stdin.readLineSync();
    int? value = int.tryParse(numInput ?? '');
    if (value == null) {
      print('Invalid input. Please enter an integer. Re-enter this number.');
      i--; // repeat this iteration
      continue;
    }
    numbers.add(value);
  }

  int sumEven = 0;
  int sumOdd = 0;
  int largest = numbers[0];
  int smallest = numbers[0];

  for (var v in numbers) {
    if (v % 2 == 0)
      sumEven += v;
    else
      sumOdd += v;

    if (v > largest) largest = v;
    if (v < smallest) smallest = v;
  }

  print('\n--- Results ---');
  print('Name: $name');
  print('Age: $age');
  print('Numbers entered: ${numbers.join(', ')}');
  print('Sum of even numbers: $sumEven');
  print('Sum of odd numbers: $sumOdd');
  print('Largest number: $largest');
  print('Smallest number: $smallest');
}
