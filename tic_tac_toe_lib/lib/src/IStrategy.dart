import 'package:tic_tac_toe_lib/src/board.dart';

import 'position.dart';
import 'piece.dart';

abstract class IStrategy {
  Position bestMove(Board board, Piece pieceToPlace);
}
