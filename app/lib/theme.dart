import 'package:paper_planes/util/fonts.dart';
import 'package:flutter/material.dart';

import 'util/colors.dart';

ThemeData getTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.kPaleNight,
    
    textTheme: TextTheme(
      headline1: TextStyle(
        fontFamily: Fonts.kRaleway,
        fontWeight: FontWeight.w500,
        fontSize: FontSize.kHeading, 
        color: AppColors.kBlack
        ),
      bodyText1: TextStyle(
        fontFamily: Fonts.kRaleway,
        fontWeight: FontWeight.w400,
        fontSize: FontSize.kBodyText, 
        color: AppColors.kMarshGreen
      ),
      
    )
  );
}
