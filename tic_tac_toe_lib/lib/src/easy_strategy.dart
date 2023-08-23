import 'dart:math';

import 'package:tic_tac_toe_lib/src/IStrategy.dart';
import 'package:tic_tac_toe_lib/src/board.dart';
import 'package:tic_tac_toe_lib/src/piece.dart';
import 'package:tic_tac_toe_lib/src/position.dart';

class Easy implements IStrategy {
  @override
  Position bestMove(Board board, Piece pieceToPlace) {
    Random random = Random();
    int randomX = random.nextInt(3);
    int randomY = random.nextInt(3);
    return Position(randomX, randomY);
  }

  Easy();
}
