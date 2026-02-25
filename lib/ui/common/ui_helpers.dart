import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

double get _tinySize => 5.0.w;
double get _smallSize => 10.0.w;
double get _mediumSize => 25.0.w;
double get _largeSize => 50.0.w;
double get _massiveSize => 120.0.w;

Widget get horizontalSpaceTiny => SizedBox(width: _tinySize);
Widget get horizontalSpaceSmall => SizedBox(width: _smallSize);
Widget get horizontalSpaceMedium => SizedBox(width: _mediumSize);
Widget get horizontalSpaceLarge => SizedBox(width: _largeSize);

Widget get verticalSpaceTiny => SizedBox(height: _tinySize.h);
Widget get verticalSpaceSmall => SizedBox(height: _smallSize.h);
Widget get verticalSpaceMedium => SizedBox(height: _mediumSize.h);
Widget get verticalSpaceLarge => SizedBox(height: _largeSize.h);
Widget get verticalSpaceMassive => SizedBox(height: _massiveSize.h);

Widget get spacedDivider => Column(
      children: <Widget>[
        verticalSpaceMedium,
        const Divider(color: Colors.blueGrey, height: 5.0),
        verticalSpaceMedium,
      ],
    );

Widget verticalSpace(double height) => SizedBox(height: height);

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightFraction(
  BuildContext context, {
  int dividedBy = 1,
  double offsetBy = 0,
  double max = 3000,
}) =>
    min((screenHeight(context) - offsetBy) / dividedBy, max);

double screenWidthFraction(
  BuildContext context, {
  int dividedBy = 1,
  double offsetBy = 0,
  double max = 3000,
}) =>
    min((screenWidth(context) - offsetBy) / dividedBy, max);

double halfScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 2);

double thirdScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 3);

double quarterScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 4);

double getResponsiveHorizontalSpaceMedium(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 10);
double getResponsiveSmallFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 14, max: 15);

double getResponsiveMediumFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 16, max: 17);

double getResponsiveLargeFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 21, max: 31);

double getResponsiveExtraLargeFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 25);

double getResponsiveMassiveFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 30);

double getResponsiveFontSize(
  BuildContext context, {
  double? fontSize,
  double? max,
}) {
  max ??= 100;

  var responsiveSize = min(
    screenWidthFraction(context, dividedBy: 10) * ((fontSize ?? 100) / 100),
    max,
  );

  return responsiveSize;
}
