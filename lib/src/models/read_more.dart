import 'advanced_styles.dart';
import 'trimmer.dart';

class ReadMore {
  final bool enable;
  final ReadMoreDecoration decoration;
  final void Function()? onTap;
  final AdvancedTrimmer trim;
  final String expandedText;
  final String collapsedText;

  const ReadMore({
    this.enable = true,
    this.decoration = const ReadMoreDecoration(),
    this.onTap,
    this.trim = const AdvancedTrimmer(),
    this.expandedText = '...Show less',
    this.collapsedText = '...Read more',
  });
}
