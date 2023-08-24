import 'dart:math';

import 'package:tic_tac_toe_lib/src/Strategy/IStrategy.dart';
import 'package:tic_tac_toe_lib/src/board.dart';
import 'package:tic_tac_toe_lib/src/piece.dart';
import 'package:tic_tac_toe_lib/src/position.dart';

class Easy with EasyMixin implements IStrategy {
  @override
  Position bestMove(Board board, Piece pieceToPlace) {
    return randomMove(board, pieceToPlace);
  }
}

mixin EasyMixin {
  Position randomMove(Board board, Piece pieceToPlace) {
    List<Position> emptyPositions = board.emptyPositions();

    Random random = Random();

    int randomValue = random.nextInt(emptyPositions.length);

    return emptyPositions[randomValue];
  }
}
