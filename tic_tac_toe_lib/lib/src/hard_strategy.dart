import 'package:tic_tac_toe_lib/src/IStrategy.dart';
import 'package:tic_tac_toe_lib/src/board.dart';
import 'package:tic_tac_toe_lib/src/piece.dart';
import 'package:tic_tac_toe_lib/src/position.dart';

class Hard implements IStrategy {
  Hard();

  static int max(int x, int y) => x >= y ? x : y;
  static int min(int x, int y) => x > y ? y : x;

  @override
  Position bestMove(Board board, Piece pieceToPlace) {
    int bestVal = -1000;
    Position bestMove = Position(-1, -1);

    if (board[2][2] == Piece.Cross && onlyOneCross(board)) {
      return Position(1, 1);
    }

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] == null) {
          board[i][j] = pieceToPlace;

          int moveVal = minimax(board, 0, true);

          board[i][j] = null;

          if (moveVal > bestVal) {
            bestMove = Position(i, j);
            bestVal = moveVal;
          }
        }
      }
    }
    return bestMove;
  }

  int minimax(Board board, int depth, bool isMax) {
    int score = evaluateScore(board);

    if (score == 10) {
      return score - depth;
    }

    if (score == -10) {
      return score + depth;
    }

    if (board.isDraw() || depth >= 9) {
      return 0;
    }

    if (isMax) {
      int best = -1000;

      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          if (board.at(Position(i, j)) == null) {
            //Make the move
            board[i][j] = Piece.Cross;

            //Call minimax recursively and choose
            //the maximum value
            best = max(best, minimax(board, depth + 1, !isMax));

            //Undo the move
            board[i][j] = null;
          }
        }
      }
      return best;
    } else {
      int best = 1000;

      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          if (board.at(Position(i, j)) == null) {
            board[i][j] = Piece.Zero;

            best = min(best, minimax(board, depth + 1, !isMax));

            board[i][j] = null;
          }
        }
      }
      return best;
    }
  }

  int evaluateScore(Board board) {
    if (board.isOverWon(Piece.Cross)) {
      return -10;
    }

    if (board.isOverWon(Piece.Zero)) {
      return 10;
    }

    return 0;
  }

  bool onlyOneCross(Board board) {
    int crossFreq = 0;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board.at(Position(i, j)) == Piece.Cross) {
          crossFreq++;
        }
      }
    }
    return crossFreq == 1;
  }
}
