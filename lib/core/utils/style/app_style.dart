import 'package:contacts_app/core/utils/color/color.dart';
import 'package:flutter/material.dart';

class AppStyles {
  static const TextStyle font16WhiteMudium = TextStyle(
    color: ColorApp.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle hintTextStyle = TextStyle(
    color: ColorApp.white,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle elevatedButtonTextStyle = TextStyle(
    backgroundColor: ColorApp.gold,
    color: ColorApp.darkBlue,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle cardUserNameTextStyle = TextStyle(
    color: ColorApp.darkBlue,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle cardContentTextStyle = TextStyle(
    color: ColorApp.darkBlue,
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );
}