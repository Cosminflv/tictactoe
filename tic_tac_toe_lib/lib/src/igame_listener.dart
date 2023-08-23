import 'package:tic_tac_toe_lib/src/position.dart';

import 'game_state.dart';
import 'piece.dart';

abstract class IGameListener {
  void onPiecePlaced(Position p, Piece piece);
  void onGameOver(GameState state);
  void onRestart();
}
