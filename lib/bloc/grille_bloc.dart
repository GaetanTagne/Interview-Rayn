import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/button_type.dart';
import '/mock_data.dart';
import '/models/player.dart';
import '/services/player_service.dart';
import '/vue_models/grille_controller.dart';
import 'grille_event.dart';
import 'grille_state.dart';

class GrilleBloc extends Bloc<GrilleEvent, GrilleState> {
  GrilleBloc({
    Player? firstPplayer,
    Player? secondPplayer,
  }) : super(InitState(
            p1: firstPplayer ?? mock1Player,
            p2: secondPplayer ?? mock2Player)) {
    loadHistory();

    on<CellTappedEvent>(onGridCellTapped);
    on<ButtonTappedEvent>(onButtonTapped);
  }

  Player get _nextPlayer =>
      (state.currentPlayer == state.p1) ? state.p2 : state.p1;
  Player? get _winner => GrilleController(state.grille).getWinner();

  void onButtonTapped(
      ButtonTappedEvent event, Emitter<GrilleState> emit) async {
    final currentState = state;
    final g = currentState.grille;

    await GrilleController(g).cleanGrille();
    switch (event.buttonType) {
      case ButtonType.newGame:
        emit(RunningState(
            currentPlayer: _nextPlayer,
            grille: g,
            p1: currentState.p1,
            p2: currentState.p2,
            winner: _winner));
        break;

      case ButtonType.resetHistory:
        await resetHistory();
        emit(RunningState(
            currentPlayer: _nextPlayer,
            grille: g,
            p1: currentState.p1,
            p2: currentState.p2,
            winner: _winner));
        break;
    }
  }

  onGridCellTapped(CellTappedEvent event, Emitter<GrilleState> emit) {
    final currentState = state;

    final g = currentState.grille;

    if (GrilleController(currentState.grille)
        .actionPossible(event.cellTapped)) {
      g[event.cellTapped.first][event.cellTapped.second] =
          currentState.currentPlayer;
      saveGameWinner();
      emit(RunningState(
          currentPlayer: _nextPlayer,
          grille: g,
          p1: state.p1,
          p2: state.p2,
          winner: _winner));
    }
  }

  resetHistory() async {
    state.p1.resetScore();
    state.p2.resetScore();
    await PlayerService.savePlayer(state.p1);
    await PlayerService.savePlayer(state.p1);
  }

  void loadHistory() async {
    state.p1.score = (await PlayerService.getScore(state.p1)) ?? 0;
    state.p2.score = (await PlayerService.getScore(state.p2)) ?? 0;
  }

  saveGameWinner() async {
    _winner?.incermentScore();
    if (_winner != null) {
      await PlayerService.savePlayer(_winner!);
    }
  }
}
