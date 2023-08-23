import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';
import 'package:tictactoe/console_class.dart';
import 'dart:io';

void main() {
  Game g = Game();

  ConsoleClass console = ConsoleClass();
  g.addListener(console);

  do {
    var line = stdin.readLineSync();
    var fs = int.parse(line![0]);
    var ls = int.parse(line[2]);
    g.placePiece(Position(fs, ls));
  } while (!g.isOver());

  g.removeListener(console);
}
