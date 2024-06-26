import 'package:flutter/material.dart';

extension ToSizeBox on double {
  Widget get asSizeBox {
    return SizedBox(
      width: this,
      height: this,
    );
  }
}
  extension MyMedia on BuildContext {
  get query => MediaQuery.of(this).size;
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  SizedBox get responsiveHeight => SizedBox(height:screenHeight);
  SizedBox get responsiveWidth => SizedBox(width:screenWidth);
  EdgeInsetsGeometry get screenPadding => MediaQuery.of(this).padding;
}
extension MySizeBox on num{
  SizedBox get asSizeBoxWidth => SizedBox(width: toDouble(),);
  SizedBox get asSizeBoxHeight => SizedBox(height: toDouble(),);
}