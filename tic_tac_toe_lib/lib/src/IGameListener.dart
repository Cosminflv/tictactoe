import 'GameState.dart';
import 'Piece.dart';
import 'Position.dart';

abstract class IGameListener {
  void onPiecePlaced(Position p, Piece piece);
  void onGameOver(GameState state);
  void onRestart();
}
