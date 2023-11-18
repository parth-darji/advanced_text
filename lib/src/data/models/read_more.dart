import 'advanced_styles.dart';
import 'trimmer.dart';

class ReadMore {
  /// Enable and disable read more functionality.
  /// By default it is enabled.
  final bool enable;

  /// If you want to decorate the [Read More] and [Show less] clickable text then
  /// you can do it from this parameter.
  final ReadMoreDecoration decoration;

  /// Trim your text from here according to the trim mode such as length.
  final AdvancedTrimmer trim;

  /// Change the text for [expandedText]. By default it is "...Show less".
  final String expandedText;

  /// Change the text for [collapsedText]. By default it is "...Read more".
  final String collapsedText;

  const ReadMore({
    this.enable = true,
    this.decoration = const ReadMoreDecoration(),
    this.trim = const AdvancedTrimmer(),
    this.expandedText = '...Show less',
    this.collapsedText = '...Read more',
  });
}
