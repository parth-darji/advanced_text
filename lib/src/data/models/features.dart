import 'hyperlink.dart';
import 'read_more.dart';

class AdvancedTextFeatures {
  /// this feature you can use to trim you text into some desired length and show the [Read More] text
  final ReadMore readMore;

  /// You can use this feature to identify hyperlink into your text.
  /// You can customize how it will look like [Style]
  /// And also you can change what will happen on clicking on that link.
  final Hyperlink hyperlink;

  const AdvancedTextFeatures({
    this.hyperlink = const Hyperlink(),
    this.readMore = const ReadMore(),
  });
}
