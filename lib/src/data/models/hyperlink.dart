import 'package:flutter/material.dart';

import '../../core/utils/constants.dart';

class Hyperlink {
  final bool enable;
  final TextStyle style;
  final void Function(BuildContext context, String url)? onTap;

  const Hyperlink({
    this.enable = true,
    this.style = defaultHyperlinkTextStyle,
    this.onTap,
  });
}
