import 'package:flutter/material.dart';

import '../../core/utils/constants.dart';

class Hyperlink {
  /// Enable and disable hyperlink feature. By default, it is enabled.
  final bool enable;

  /// Change the text style for clickable link.
  final TextStyle style;

  /// On the tap of link, you can change the behavious from here.
  final void Function(BuildContext context, String url)? onTap;

  const Hyperlink({
    this.enable = true,
    this.style = defaultHyperlinkTextStyle,
    this.onTap,
  });
}
