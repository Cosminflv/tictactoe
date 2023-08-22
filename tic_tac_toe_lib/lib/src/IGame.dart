import 'package:tic_tac_toe_lib/src/IGameListener.dart';

abstract class IGame {
  void placePiece(int row, int column);
  void restart();
  void addListener(IGameListener listener);
  void removeListener(IGameListener listener);
}
