import '../models/button_type.dart';
import '/models/paire.dart';

abstract class GrilleEvent {
  const GrilleEvent();
}

class CellTappedEvent extends GrilleEvent {
  final Pair cellTapped;
  const CellTappedEvent({required this.cellTapped});
}

class ButtonTappedEvent extends GrilleEvent {
  final ButtonType buttonType;
  const ButtonTappedEvent({required this.buttonType});
}
