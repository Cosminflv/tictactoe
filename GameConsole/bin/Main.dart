import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';

import 'package:tictactoe/console_class.dart';
import 'dart:io';

Future<void> main() async {
  Game g = Game(true);

  g.strategy = IStrategy.difficulty(Difficulty.easy);

  ConsoleClass console = ConsoleClass(g);
  g.addListener(console);

  do {
    await Future.delayed(Duration(milliseconds: 1), () {});
    var line = stdin.readLineSync();
    var fs = int.parse(line![0]);
    var ls = int.parse(line[2]);
    g.placePiece(Position(fs, ls));
  } while (!g.isOver());

  g.removeListener(console);
}
