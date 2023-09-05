import 'package:mockito/mockito.dart';
import 'package:tic_tac_toe_flutter/cubit/tic_tac_toe_cubit.dart';
import 'package:tic_tac_toe_flutter/cubit/tic_tac_toe_state.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:tic_tac_toe_lib/tic_tac_toe_lib.dart';

import 'mock_generator.mocks.dart';

void main() {
  blocTest<TicTacToeCubit, TicTacToeState>(
    'emits [copyState] when placePiece is called.',
    build: () => TicTacToeCubit(),
    act: (cubit) {
      MockIGame mockedGame = MockIGame();
      cubit.setGame(mockedGame);
      cubit.placePiece(Position(0, 0));

      verify(mockedGame.placePiece(Position(0, 0)));
    },
    expect: () => const [],
  );

  blocTest<TicTacToeCubit, TicTacToeState>(
    'emits [copyState] when MyEvent is added.',
    build: () => TicTacToeCubit(),
    act: (cubit) {
      MockIGame mockedGame = MockIGame();
      cubit.setGame(mockedGame);

      when(mockedGame.isOver()).thenReturn(false);
      when(mockedGame.stopWatchElapsed).thenReturn(const Duration(seconds: 5));
      when(mockedGame.stopWatchLimitedElapsed).thenReturn(const Duration(seconds: 5));
      cubit.onTimerChange();
    },
    expect: () => [
      TicTacToeState(
          mTime: const Duration(seconds: 5), mState: GameState.Playing, mTimeLimited: const Duration(seconds: 5))
    ],
  );

  blocTest<TicTacToeCubit, TicTacToeState>(
    'emits the correct state when the game is over',
    build: () => TicTacToeCubit(),
    act: (cubit) {
      MockIGame mockedGame = MockIGame();
      cubit.setGame(mockedGame);

      cubit.restart();

      verify(mockedGame.restart()).called(1);
    },
    expect: () => [],
  );

  blocTest<TicTacToeCubit, TicTacToeState>(
    'when restarting',
    build: () => TicTacToeCubit(),
    act: (cubit) {
      MockIGame mockedGame = MockIGame();
      cubit.setGame(mockedGame);

      when(mockedGame.gameBoard).thenReturn([[]]);

      cubit.onRestart();
    },
    expect: () => [
      TicTacToeState(
          mGameBoard: const [[]],
          mState: GameState.Playing,
          mTurn: Turn.crossTurn,
          mTimeLimited: Duration.zero,
          mTime: Duration.zero)
    ],
  );

  blocTest<TicTacToeCubit, TicTacToeState>(
    'emits CrossWon game state',
    build: () => TicTacToeCubit(),
    act: (cubit) {
      MockIGame mockedGame = MockIGame();
      cubit.setGame(mockedGame);

      when(mockedGame.gameBoard).thenReturn([
        [Piece.Cross, Piece.Cross, Piece.Cross],
        [],
        [],
      ]);

      cubit.onGameOver(GameState.CrossWon);
    },
    expect: () => [
      TicTacToeState(
        mState: GameState.CrossWon,
        mTimeLimited: Duration.zero,
        mTime: Duration.zero,
      )
    ],
  );

  blocTest<TicTacToeCubit, TicTacToeState>(
    'emits the zeroTurn state after cross placed',
    build: () => TicTacToeCubit(),
    act: (cubit) {
      MockIGame mockedGame = MockIGame();
      cubit.setGame(mockedGame);

      cubit.placePiece(Position(0, 0));

      cubit.onSwitchTurn(Turn.crossTurn);

      when(mockedGame.turn).thenReturn(Turn.zeroTurn);
    },
  );
}
