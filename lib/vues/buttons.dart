import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/grille_bloc.dart';
import '../bloc/grille_event.dart';
import '../models/button_type.dart';

class GameActionButton extends StatelessWidget {
  final ButtonType buttonType;

  const GameActionButton({super.key, required this.buttonType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 5,
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            minimumSize: const Size(150, 50),
            backgroundColor: buttonType.bcgkdColor,
            shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(03))),
          ),
          onPressed: () => context
              .read<GrilleBloc>()
              .add(ButtonTappedEvent(buttonType: buttonType)),
          child: Text(buttonType.texte,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onPrimary))),
    );
  }
}
