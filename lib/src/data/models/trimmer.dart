import '../../core/utils/enums.dart';

class AdvancedTrimmer {
  /// You can pass the trim length. It will trim until those character and will the "Read more" text after that to expand the text.
  final int length;

  /// Set the mode for trim feature. By default it is [TrimMode.length].
  final TrimMode mode;

  const AdvancedTrimmer({
    this.length = 240,
    this.mode = TrimMode.length,
  });
}
