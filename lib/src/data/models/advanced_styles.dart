import 'package:flutter/material.dart';

import '../../core/utils/constants.dart';

class ReadMoreDecoration {
  /// "Read more" text style to decorate it according your needs.
  final TextStyle moreStyle;

  /// "Show less" text style to decorate it according your needs.
  final TextStyle lessStyle;

  const ReadMoreDecoration({
    this.moreStyle = defaultReadMoreTextStyle,
    this.lessStyle = defaultShowLessTextStyle,
  });
}
