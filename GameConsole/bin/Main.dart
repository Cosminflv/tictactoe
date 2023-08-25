import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';

import 'package:tictactoe/console_class.dart';
import 'dart:io';

Future<void> main() async {
  Game g = Game(true);

  g.strategy = IStrategy.difficulty(Difficulty.hard);

  ConsoleClass console = ConsoleClass(g);
  g.addListener(console);

  var line = '-';

  do {
    await Future.delayed(Duration(milliseconds: 1), () {});
    var line = stdin.readLineSync();
    if (line == 'exit') {
      break;
    }
    var fs = int.parse(line![0]);
    var ls = int.parse(line[2]);
    g.placePiece(Position(fs, ls));

    if (g.isOver()) {
      print('Restart? y/n\n');
      line = stdin.readLineSync();
      if (line == 'y') {
        g.restart();
      } else {
        exit(0);
      }
    }
  } while (line != 'exit');

  g.removeListener(console);

  exit(0);
}
