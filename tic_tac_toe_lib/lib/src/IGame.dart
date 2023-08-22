import 'package:tic_tac_toe_lib/src/IGameListener.dart';
import 'package:tic_tac_toe_lib/src/Position.dart';

abstract class IGame {
  void placePiece(Position p);
  void restart();
  void addListener(IGameListener listener);
  void removeListener(IGameListener listener);
}
