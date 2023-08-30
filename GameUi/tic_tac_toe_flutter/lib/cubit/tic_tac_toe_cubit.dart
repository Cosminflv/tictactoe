import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tic_tac_toe_state.dart';

class TicTacToeCubit extends Cubit<TicTacToeState> {
  TicTacToeCubit() : super(TicTacToeInitial());
}
