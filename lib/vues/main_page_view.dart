import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/bloc/grille_bloc.dart';
import '/bloc/grille_event.dart';
import '/bloc/grille_state.dart';
import '/models/button_type.dart';
import '/utils/size_config.dart';
import '/utils/strings.dart';
import 'buttons.dart';
import 'grid_view.dart';
import 'score_view.dart';

class MainPageView extends StatelessWidget {
  const MainPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GrilleBloc, GrilleState>(
        buildWhen: (previous, current) =>
            (previous.grille != current.grille) ||
            (previous.currentPlayer != current.currentPlayer),
        builder: (context, state) {
          return SingleChildScrollView(
              child: Column(children: [
            Row(children: [
              ScoreView(player: state.p1),
              ScoreView(player: state.p2)
            ]),
            sh(20),
            GameTableView(
                gridData: state.grille,
                onTapCell: (p) {
                  context
                      .read<GrilleBloc>()
                      .add(CellTappedEvent(cellTapped: p));
                }),
            sh(30),
            message(state, context),
            const GameActionButton(buttonType: ButtonType.newGame),
            const GameActionButton(buttonType: ButtonType.resetHistory)
          ]));
        });
  }

  Widget message(provider, BuildContext context) {
    if (provider.partieEnCours) {
      return Text(
          "${provider.currentPlayer.name} : ${AppStrings.gameMsgeHand} ",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.black));
    } else if (provider.winner != null) {
      return Text(
          "${AppStrings.gameMsgeCongrats} ${provider.winner!.name}, ${AppStrings.gameMsgeYouWin}",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.red));
    } else {
      return Text(AppStrings.gameMsgeNoWinner,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold, color: Colors.blue));
    }
  }
}
