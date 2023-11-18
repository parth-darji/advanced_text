import 'hyperlink.dart';
import 'read_more.dart';

class AdvancedTextFeatures {
  final ReadMore readMore;
  final Hyperlink hyperlink;

  const AdvancedTextFeatures({
    this.hyperlink = const Hyperlink(),
    this.readMore = const ReadMore(),
  });
}
