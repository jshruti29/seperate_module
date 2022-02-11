import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String data;
  final TextAlign? textAlign;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? softWrap;

  TextWidget(this.data,{this.overflow,this.textAlign,this.style,this.maxLines,this.softWrap});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style,
      textAlign: textAlign,
      maxLines:maxLines,
      overflow: overflow,
      softWrap: softWrap,
      textScaleFactor: 1.0,
    );
  }
}
