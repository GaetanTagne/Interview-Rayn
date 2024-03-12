import 'package:flutter/widgets.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;
  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static late double safeBlockHorizontal;
  static late double safeBlockVertical;

  static double b = 0;
  static double v = 0;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }
}

const double ratioHeight = 896;
const double ratioWidth = 375;

double ajH(double height) => SizeConfig.screenHeight / (ratioHeight / height);
double ajW(double width) => SizeConfig.screenWidth / (ratioWidth / width);
SizedBox sh(double h) =>
    SizedBox(height: h * SizeConfig.screenHeight / ratioHeight);
SizedBox sw(double b) =>
    SizedBox(width: b * SizeConfig.screenWidth / ratioWidth);
