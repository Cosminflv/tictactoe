import 'package:tic_tac_toe_lib/src/IGame.dart';
import 'package:tic_tac_toe_lib/src/Strategy/IStrategy.dart';
import 'package:tic_tac_toe_lib/src/igame_listener.dart';
import 'package:tic_tac_toe_lib/src/logging.dart';
import 'package:tic_tac_toe_lib/src/position.dart';

import 'Turn.dart';
import 'board.dart';
import 'piece.dart';
import 'game_state.dart';
import 'GameExceptions/game_exceptions.dart';

class Game implements IGame {
  final log = logger(Game);

  Game()
      : _mGameBoard = Board(),
        _mTurn = Turn.crossTurn,
        _mState = GameState.Playing,
        _mStrategy = null;

  Game.boardString(String matrixInString)
      : _mGameBoard = Board.fromString(matrixInString),
        _mTurn = Turn.crossTurn,
        _mState = GameState.Playing;

  factory Game.produce() => Game();
  factory Game.produceFromString(String matrixInString) => Game.boardString(matrixInString);

  Board _mGameBoard;
  Turn _mTurn;
  GameState _mState;
  ListenerList listeners = [];
  IStrategy? _mStrategy;

  @override
  void placePiece(Position p) {
    if (_mState != GameState.Playing) {
      log.e('GameOverException thrown!');
      throw GameOverException("The game has ended!\n");
    }

    try {
      log.i('placePiece(p, pieceBasedOnTurn()) has been called');
      _mGameBoard.placePiece(p, pieceBasedOnTurn());
      log.i('notifyPiecePlaced(p, pieceBasedOnTurn()) has been called');
      notifyPiecePlaced(p, pieceBasedOnTurn());
      if (_mGameBoard.isOverWon(pieceBasedOnTurn())) {
        _mState = pieceBasedOnTurn() == Piece.Cross ? GameState.CrossWon : GameState.ZeroWon;
        log.i('notifyGameOver(_mState) ');
        notifyGameOver(_mState);
      }

      if (_mGameBoard.isDraw()) {
        _mState = GameState.Tie;
        log.i('notifyGameOver(_mState) called');
        notifyGameOver(_mState);
      }

      if (_mStrategy != null && _mState == GameState.Playing) {
        log.i('bestMove(_mGameBoard) called');
        Position toPlacePosition = _mStrategy!.bestMove(_mGameBoard);
        log.i('placePiece(toPlacePosition, pieceBasedOnTurn() + 1) called');
        _mGameBoard.placePiece(toPlacePosition, pieceBasedOnTurn() + 1);

        log.i('notifyPiecePlaced(toPlacePosition, Piece.Zero) called');
        notifyPiecePlaced(toPlacePosition, Piece.Zero);

        if (_mGameBoard.isOverWon(Piece.Zero)) {
          _mState = pieceBasedOnTurn() == Piece.Cross ? GameState.CrossWon : GameState.ZeroWon;
          notifyGameOver(GameState.ZeroWon);
          log.i('Computer won');
        }

        if (_mGameBoard.isDraw()) {
          _mState = GameState.Tie;
          log.i('notifyGameOver(GameState.Tie) called');
          notifyGameOver(GameState.Tie);
        }
      } else {
        log.i('switchTurn called');
        _mTurn = _mTurn.switchTurn();
      }
    } on GameException catch (e) {
      print(e.message);
    }
  }

  @override
  void restart() {
    _mGameBoard = Board();
    _mTurn = Turn.crossTurn;
    _mState = GameState.Playing;
    log.e('Game has restarted');
    notifyRestart();
  }

  @override
  void addListener(IGameListener listenerToAdd) => listeners.add(listenerToAdd);
  @override
  void removeListener(IGameListener listenerToRemove) => listeners.remove(listenerToRemove);
  @override
  Piece? at(Position p) {
    return _mGameBoard[p.x][p.y];
  }

  set strategy(IStrategy? strategy) => _mStrategy = strategy;
  IStrategy? get strategy => _mStrategy;

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
}

typedef ListenerList = List<IGameListener>;
