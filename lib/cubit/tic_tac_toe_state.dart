import 'package:equatable/equatable.dart';
import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';

// ignore: must_be_immutable
class TicTacToeState extends Equatable {
  List<List<Piece?>>? mGameBoard;
  final GameState mState;

  @override
  // TODO: implement props
  List<Object?> get props => [mGameBoard, mState];

  TicTacToeState({this.mGameBoard, required this.mState}) {
    mGameBoard = List.generate(3, (index) => List.generate(3, (index) => null));
  }

  TicTacToeState copyWith({List<List<Piece?>>? mGameBoard, GameState? mState}) =>
      TicTacToeState(mGameBoard: mGameBoard ?? this.mGameBoard, mState: mState ?? this.mState);

  //emit(state.copyWith(mBoardBoard/mState))
  //to update a specific state
}
