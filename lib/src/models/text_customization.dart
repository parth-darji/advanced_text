import 'package:flutter/material.dart';

class TextCustomization {
  /// provide your main [text] style.
  final TextStyle? style;

  /// provide the alignment for your main [text].
  final TextAlign? textAlign;

  /// provide the direction for your main [text] whether ltr and rtl.
  final TextDirection? textDirection;

  /// provide the locale for your [text].
  final Locale? locale;

  /// provide the textScaleFactor for your main [text].
  final double? textScaleFactor;

  /// provide the semanticsLabel for your [text].
  final String? semanticsLabel;

  const TextCustomization({
    this.style,
    this.textAlign,
    this.textDirection,
    this.textScaleFactor,
    this.locale,
    this.semanticsLabel,
  });
}
