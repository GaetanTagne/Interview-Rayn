import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/bloc/grille_bloc.dart';
import '/bloc/grille_state.dart';
import '/models/player.dart';
import '/utils/size_config.dart';

class ScoreView extends StatelessWidget {
  final Player player;
  const ScoreView({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GrilleBloc, GrilleState>(
        buildWhen: (previous, current) =>
            previous.currentPlayer != current.currentPlayer,
        builder: (context, state) {
          return Container(
            height: ajH(100),
            width: SizeConfig.blockSizeHorizontal * 50,
            color: (state.currentPlayer ==
                    player) /*(provider.currentPlayer == player)*/
                ? Colors.grey.withOpacity(.2)
                : Colors.white,
            alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: ajW(20)),
                  child: player.icon,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      player.name,
                      style: TextStyle(
                          fontSize: ajW(20), fontWeight: FontWeight.bold),
                    ),
                    Text("${player.score}",
                        style: TextStyle(
                            fontSize: ajW(20), fontWeight: FontWeight.bold))
                  ],
                )
              ],
            ),
          );
        });
  }
}
