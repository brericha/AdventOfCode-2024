import '../utils/index.dart';

class Day01 extends GenericDay {
  Day01() : super(1);

  @override
  (List<int> left, List<int> right) parseInput() {
    final rawInput = input.getPerLine();
    final left = <int>[];
    final right = <int>[];

    for (final line in rawInput) {
      final sides = line.split('   ');
      left.add(int.parse(sides[0]));
      right.add(int.parse(sides[1]));
    }

    return (left, right);
  }

  @override
  int solvePart1() {
    final (left, right) = parseInput();
    left.sort();
    right.sort();

    var differenceSum = 0;

    for (var i = 0; i < left.length; i++) {
      differenceSum += (left[i] - right[i]).abs();
    }

    return differenceSum;
  }

  @override
  int solvePart2() {
    final (left, right) = parseInput();

    var score = 0;

    for (final number in left) {
      score += number * right.where((e) => e == number).length;
    }

    return score;
  }
}
