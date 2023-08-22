import 'package:tic_tac_toe_lib/src/GameExceptions/GameOverException.dart';
import 'package:tic_tac_toe_lib/src/IGame.dart';
import 'package:tic_tac_toe_lib/src/IGameListener.dart';
import 'package:tic_tac_toe_lib/src/Position.dart';

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

  Game.boardString(String matrixInString)
      : _mGameBoard = Board.boardString(matrixInString),
        _mTurn = Turn.crossTurn,
        _mState = GameState.Playing;

  factory Game.produce() => Game();
  factory Game.produceFromString(String matrixInString) => Game.boardString(matrixInString);

  Board _mGameBoard;
  Turn _mTurn;
  GameState _mState;
  ListenerList listeners = [];

  @override
  void placePiece(Position p) {
    if (_mState != GameState.Playing) {
      throw GameOverException("The game has ended!\n");
    }

    if (_mState == GameState.Playing) {
      try {
        _mGameBoard.placePiece(p, pieceBasedOnTurn());
        notifyPiecePlaced(p, pieceBasedOnTurn());
        if (_mGameBoard.isOverWon(pieceBasedOnTurn())) {
          _mState = pieceBasedOnTurn() == Piece.Cross ? GameState.CrossWon : GameState.ZeroWon;
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

  void notifyPiecePlaced(Position p, Piece piece) {
    for (var curr in listeners) {
      curr.onPiecePlaced(p, piece);
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

  Piece pieceBasedOnTurn() {
    return _mTurn == Turn.crossTurn ? Piece.Cross : Piece.Zero;
  }

  bool isOver() {
    return _mState == GameState.CrossWon || _mState == GameState.ZeroWon || _mState == GameState.Tie;
  }

  bool isDraw() {
    return _mState == GameState.Tie;
  }

  Piece? at(Position p) {
    return _mGameBoard[p.x][p.y];
  }
}

typedef ListenerList = List<IGameListener>;
