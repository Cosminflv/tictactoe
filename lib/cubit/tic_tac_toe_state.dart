import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';

// ignore: must_be_immutable
class TicTacToeState {
  List<List<Piece?>>? mGameBoard;
  final GameState mState;
  final Turn? mTurn;
  final Duration mTime;
  final Duration mTimeX;
  final Duration mTimeO;

  @override
  // TODO: implement props
  //List<Object?> get props => [mGameBoard, mState, mTurn];

  TicTacToeState(
      {this.mGameBoard,
      this.mTurn,
      required this.mTime,
      required this.mState,
      required this.mTimeX,
      required this.mTimeO}) {
    mGameBoard = mGameBoard;
  }

  TicTacToeState copyWith(
          {List<List<Piece?>>? mGameBoard,
          GameState? mState,
          Turn? mTurn,
          Duration? mTime,
          Duration? mTimeX,
          Duration? mTimeO}) =>
      TicTacToeState(
          mGameBoard: mGameBoard ?? this.mGameBoard,
          mState: mState ?? this.mState,
          mTurn: mTurn ?? this.mTurn,
          mTime: mTime ?? this.mTime,
          mTimeX: mTimeX ?? this.mTimeX,
          mTimeO: mTimeO ?? this.mTimeO);

  //emit(state.copyWith(mBoardBoard/mState))
  //to update a specific state
}
