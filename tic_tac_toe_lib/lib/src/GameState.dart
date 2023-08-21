enum GameState {
  Playing,
  CrossWon,
  ZeroWon,
  Tie;

  GameState updateState(GameState other) {
    return other;
  }
}
