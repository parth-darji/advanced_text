import '../../core/utils/enums.dart';

class AdvancedTrimmer {
  final int length;
  final TrimMode mode;

  const AdvancedTrimmer({
    this.length = 240,
    this.mode = TrimMode.length,
  });
}
