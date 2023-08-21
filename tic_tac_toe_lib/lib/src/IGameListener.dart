import 'GameState.dart';
import 'Piece.dart';

abstract class IGameListener {
  void onPiecePlaced(int row, int column, Piece piece);
  void onGameOver(GameState state);
  void onRestart();
}
