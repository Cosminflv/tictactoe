import 'package:tic_tac_toe_lib/src/GameExceptions/cannot_place_exception.dart';
import 'package:tic_tac_toe_lib/src/GameExceptions/out_of_the_table_exception.dart';
import 'package:tic_tac_toe_lib/src/position.dart';

import 'piece.dart';

class Board {
  Board() {
    _board = [
      [null, null, null],
      [null, null, null],
      [null, null, null],
    ];
  }

  static int max(int x, int y) => x > y ? x : y;
  static int min(int x, int y) => x > y ? y : x;

  List<List<Piece?>>? _board;

  Board.fromString(String displayString) {
    List<String> rows = displayString.trim().split('\n');
    _board = List.generate(3, (row) {
      return rows[row]
          .split(' ')
          .map((char) => char == 'x'
              ? Piece.Cross
              : char == 'o'
                  ? Piece.Zero
                  : null)
          .toList();
    });
  }

  Board.initializer(List<List<Piece?>> initialBoard) : _board = initialBoard;

  void placePiece(Position p, Piece piece) {
    if (!isInTable(p.x, p.y)) {
      throw OutOfTableException("The position in not valid!\n");
    }

    if (_board?[p.x][p.y] != null) {
      throw CannotPlaceException("The square is occupied!\n");
    }
    _board?[p.x][p.y] = piece;
  }

  bool isOverWon(Piece piece) {
    for (int i = 0; i < 3; i++) {
      if (checkRow(i, piece) || checkColumn(i, piece)) {
        return true;
      }
    }
    if (checkPrimaryDiagonal(piece) || checkSecondaryDiagonal(piece)) {
      return true;
    }
    return false;
  }

  bool isDraw() {
    int emptySpaces = 9;

    for (int i = 0; i < 3; i++) {
      emptySpaces -= _board?[i].where((cell) => cell != null).length ?? 0;
    }

    return emptySpaces == 0;
  }

  bool checkRow(int rowToCheck, Piece pieceToFind) {
    int count = 0;

    for (Piece? currPiece in _board![rowToCheck]) {
      if (currPiece == pieceToFind) {
        count++;
      }
    }

    return count == 3 ? true : false;
  }

  bool checkColumn(int columnToCheck, Piece pieceToFind) {
    int count = 0;

    for (List<Piece?> currRow in _board!) {
      if (currRow[columnToCheck] == pieceToFind) {
        count++;
      }
    }

    return count == 3 ? true : false;
  }

  bool checkPrimaryDiagonal(Piece pieceToFind) {
    int count = 0;

    for (int i = 0; i < _board!.length; i++) {
      if (_board![i][i] == pieceToFind) {
        count++;
      }
    }

    return count == 3 ? true : false;
  }

  bool checkSecondaryDiagonal(Piece pieceToFind) {
    int count = 0;

    for (int i = 0; i < _board!.length; i++) {
      if (_board![i][_board!.length - i - 1] == pieceToFind) {
        count++;
      }
    }

    return count == 3 ? true : false;
  }

  bool isInTable(int x, int y) {
    return (x >= 0 && x < 3) && (y >= 0 && x < 3);
  }

  int minimax(int depth, bool isMax) {
    if (isOverWon(Piece.Cross)) {
      return 10;
    }

    if (isOverWon(Piece.Zero)) {
      return -10;
    }

    if (isDraw()) {
      return 0;
    }

    if (isMax) {
      int best = -1000;

      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          if (at(Position(i, j)) == null) {
            //Make the move
            _board?[i][j] = Piece.Cross;

            //Call minimax recursively and choose
            //the maximum value
            best = max(best, minimax(depth + 1, !isMax));

            //Undo the move
            _board?[i][j] = null;
          }
        }
      }
      return best;
    } else {
      int best = 1000;

      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          if (at(Position(i, j)) == null) {
            _board?[i][j] = Piece.Zero;

            best = min(best, minimax(depth + 1, !isMax));

            _board?[i][j] = null;
          }
        }
      }
      return best;
    }
  }

  Position findBestMove() {
    int bestVal = -1000;
    Position bestMove = Position(-1, -1);

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (_board?[i][j] == null) {
          _board?[i][j] = Piece.Cross;

          int moveVal = minimax(0, false);

          _board?[i][j] = null;

          if (moveVal > bestVal) {
            bestMove = Position(i, j);
            bestVal = moveVal;
          }
        }
      }
    }
    return bestMove;
  }

  List<Piece?> operator [](int index) => _board![index];

  Piece? producePiece(String element) {
    switch (element) {
      case 'o':
        {
          return Piece.Zero;
        }
      case 'x':
        {
          return Piece.Cross;
        }
      default:
        {
          return null;
        }
    }
  }

  Piece? at(Position p) {
    return _board?[p.x][p.y];
  }
}
