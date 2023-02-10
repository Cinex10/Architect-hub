import 'package:architect_hub/ressources/color_manager.dart';
import 'package:architect_hub/ressources/font_manager.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) =>
    TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    );

// Regular style

TextStyle getRegularStyle({
  double fontSize = FontSize.s12,
  Color color = ColorManager.black,
}) =>
    _getTextStyle(
      fontSize,
      FontWeightManager.regular,
      color,
    );

// Medium style

TextStyle getMediumStyle({
  double fontSize = FontSize.s12,
  Color color = ColorManager.black,
}) =>
    _getTextStyle(
      fontSize,
      FontWeightManager.medium,
      color,
    );

// Light style

TextStyle getLightStyle({
  double fontSize = FontSize.s12,
  Color color = ColorManager.black,
}) =>
    _getTextStyle(
      fontSize,
      FontWeightManager.light,
      color,
    );

// Bold style

TextStyle getBoldStyle({
  double fontSize = FontSize.s12,
  Color color = ColorManager.black,
}) =>
    _getTextStyle(
      fontSize,
      FontWeightManager.bold,
      color,
    );

// SemiBold style

TextStyle getSemiBoldStyle({
  double fontSize = FontSize.s12,
  Color color = ColorManager.black,
}) =>
    _getTextStyle(
      fontSize,
      FontWeightManager.semiBold,
      color,
    );
