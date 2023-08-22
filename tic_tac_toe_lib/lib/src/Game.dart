import 'package:tic_tac_toe_lib/src/GameExceptions/GameOverException.dart';
import 'package:tic_tac_toe_lib/src/IGame.dart';
import 'package:tic_tac_toe_lib/src/IGameListener.dart';

import 'Turn.dart';
import 'Board.dart';
import 'Piece.dart';
import 'GameState.dart';
import 'GameExceptions/GameExceptions.dart';

class Game implements IGame {
  Game()
      : _mGameBoard = Board(),
        _mTurn = Turn.crossTurn,
        _mState = GameState.Playing;

  Board _mGameBoard;
  Turn _mTurn;
  GameState _mState;
  ListenerList listeners = [];

  @override
  void placePiece(int row, int column) {
    if (_mState != GameState.Playing) {
      throw GameOverException("The game has ended!\n");
    }

    if (_mState == GameState.Playing) {
      try {
        _mGameBoard.placePiece(row, column, getPiece());
        notifyPiecePlaced(row, column, getPiece());
        if (_mGameBoard.isOverWon(getPiece())) {
          _mState = getPiece() == Piece.Cross ? GameState.CrossWon : GameState.ZeroWon;
          notifyGameOver(_mState);
        }

        if (_mGameBoard.isDraw()) {
          _mState = GameState.Tie;
          notifyGameOver(_mState);
        }

        _mTurn = _mTurn.switchTurn();
      } on GameException catch (e) {
        print(e.message);
      }
    }
  }

  @override
  void restart() {
    _mGameBoard = Board();
    _mTurn = Turn.crossTurn;
    _mState = GameState.Playing;

    notifyRestart();
  }

  @override
  void addListener(IGameListener listenerToAdd) => listeners.add(listenerToAdd);
  @override
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
