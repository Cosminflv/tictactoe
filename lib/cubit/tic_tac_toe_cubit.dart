import 'package:bloc/bloc.dart';

import 'package:tic_tac_toe_flutter/cubit/tic_tac_toe_state.dart';
import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';

class TicTacToeCubit extends Cubit<TicTacToeState> implements IGameListener {
  TicTacToeCubit() : super(TicTacToeState(mState: GameState.Playing, mTime: Duration.zero));

  IGame? g;

  void produce() {
    g = Game(true);
    g?.addListener(this);
  }

  void placePiece(Position p) {
    g!.placePiece(p);
  }

  void restart() {
    g!.restart();
  }

  @override
  void onGameOver(GameState gameState) {
    emit(TicTacToeState(mGameBoard: g?.gameBoard, mState: gameState, mTime: g!.stopWatch.elapsed));
  }

  @override
  void onPiecePlaced(Position p, Piece piece) {
    emit(TicTacToeState(
        mGameBoard: g?.gameBoard, mState: GameState.Playing, mTurn: g?.turn, mTime: g!.stopWatch.elapsed));
  }

  @override
  void onRestart() {
    emit(TicTacToeState(
        mGameBoard: g?.gameBoard, mState: GameState.Playing, mTurn: g?.turn, mTime: g!.stopWatch.elapsed));
  }

  @override
  void onTimerChange() {
    emit(TicTacToeState(
        mGameBoard: g?.gameBoard, mTime: g!.stopWatch.elapsed, mState: GameState.Playing, mTurn: g?.turn));
  }

  void setDifficulty(Difficulty difficulty) {
    g?.strategy = (IStrategy.difficulty(difficulty));
  }

  Turn turn() => g!.turn;
}
