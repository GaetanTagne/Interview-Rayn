import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppStrings {
  static late AppLocalizations _appLocalizations;
  static late String appBarTitle;
  static late String gameButtonNewGame;
  static late String gameButtonResetHistory;
  static late String gameMsgeHand;
  static late String gameMsgeNoWinner;
  static late String gameMsgeCongrats;
  static late String gameMsgeYouWin;

  void init(BuildContext context) {
    _appLocalizations = AppLocalizations.of(context)!;
    appBarTitle = _appLocalizations.appBarTitle;
    gameButtonNewGame = _appLocalizations.gameButtonNewGame;
    gameButtonResetHistory = _appLocalizations.gameButtonResetHistory;
    gameMsgeHand = _appLocalizations.gameMsgeHand;
    gameMsgeNoWinner = _appLocalizations.gameMsgeNoWinner;
    gameMsgeCongrats = _appLocalizations.gameMsgeCongrats;
    gameMsgeYouWin = _appLocalizations.gameMsgeYouWin;
  }
}
