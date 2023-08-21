import 'package:tic_tac_toe_lib/src/IGameListener.dart';

import 'Turn.dart';
import 'Board.dart';
import 'Piece.dart';
import 'GameState.dart';
import 'GameExceptions/GameExceptions.dart';

class Game {
  Game()
      : _mGameBoard = Board(),
        _mTurn = Turn.crossTurn,
        _mState = GameState.Playing;

  Board _mGameBoard;
  Turn _mTurn;
  GameState _mState;
  ListenerList listeners = [];

  void placePiece(int row, int column) {
    if (_mState == GameState.Playing) {
      try {
        _mGameBoard.placePiece(row, column, getPiece());
        notifyPiecePlaced(row, column, getPiece());
        if (_mGameBoard.isOverWon(getPiece())) {
          _mState = getPiece() == Piece.Cross ? GameState.CrossWon : GameState.ZeroWon;
          notifyGameOver(_mState);
        }
        _mTurn = _mTurn.switchTurn();
      } on GameException catch (e) {
        print(e.message);
      }
    }
  }

  void restart() {
    _mGameBoard = Board();
    _mTurn = Turn.crossTurn;
    _mState = GameState.Playing;

    notifyRestart();
  }

  void addListener(IGameListener listenerToAdd) => listeners.add(listenerToAdd);
  void removeListener(IGameListener listenerToRemove) => listeners.remove(listenerToRemove);

  void notifyPiecePlaced(int row, int column, Piece piece) {
    for (var curr in listeners) {
      curr.onPiecePlaced(row, column, piece);
    }
  }

  void notifyGameOver(GameState state) {
    for (var curr in listeners) {
      curr.onGameOver(state);
    }
  }

  void notifyRestart() {
    for (var curr in listeners) {
      curr.onRestart();
    }
  }

  Piece getPiece() {
    return _mTurn == Turn.crossTurn ? Piece.Cross : Piece.Zero;
  }

  bool isOver() {
    return _mState == GameState.CrossWon || _mState == GameState.ZeroWon || _mState == GameState.Tie;
  }
}

typedef ListenerList = List<IGameListener>;
