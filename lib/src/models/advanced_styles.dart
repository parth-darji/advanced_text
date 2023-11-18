import 'package:flutter/material.dart';

import '../utils/constants.dart';

class ReadMoreDecoration {
  final TextStyle moreStyle;
  final TextStyle lessStyle;

  const ReadMoreDecoration({
    this.moreStyle = defaultReadMoreTextStyle,
    this.lessStyle = defaultShowLessTextStyle,
  });
}
