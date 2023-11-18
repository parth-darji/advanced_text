import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:linkify/linkify.dart';

import 'data/models/features.dart';
import 'data/models/text_customization.dart';
import 'core/utils/constants.dart';
import 'core/utils/enums.dart';
import 'core/utils/linkify.dart';

class AdvancedText extends StatefulWidget {
  const AdvancedText(
    this.text, {
    Key? key,
    this.textCustomization,
    this.features = const AdvancedTextFeatures(),
  })  : assert(text != null),
        super(key: key);

  /// provide your main [text].
  final String? text;

  /// provide the decoration for your [text].
  final TextCustomization? textCustomization;

  /// Main features of advanced_text package.
  /// 1) Read More
  /// 2) Hyperlink
  final AdvancedTextFeatures features;

  @override
  AdvancedTextState createState() => AdvancedTextState();
}

class AdvancedTextState extends State<AdvancedText> {
  bool _readMoreStatus = true;

  void _onTapLink() {
    setState(() {
      _readMoreStatus = !_readMoreStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.textCustomization?.semanticsLabel != null) {
      return Semantics(
        textDirection: widget.textCustomization?.textDirection,
        label: widget.textCustomization?.semanticsLabel,
        child: ExcludeSemantics(
          child: mainWidget(),
        ),
      );
    }

    return mainWidget();
  }

  Widget mainWidget() {
    final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
    TextStyle? effectiveTextStyle = widget.textCustomization?.style;
    if (widget.textCustomization?.style == null ||
        (widget.textCustomization?.style?.inherit ?? false)) {
      effectiveTextStyle =
          defaultTextStyle.style.merge(widget.textCustomization?.style);
    }
    final defaultLessStyle = widget.features.readMore.decoration.lessStyle;
    final defaultMoreStyle = widget.features.readMore.decoration.moreStyle;

    final textAlign = widget.textCustomization?.textAlign ??
        defaultTextStyle.textAlign ??
        TextAlign.start;
    final textDirection =
        widget.textCustomization?.textDirection ?? Directionality.of(context);
    final textScaleFactor = widget.textCustomization?.textScaleFactor ??
        MediaQuery.textScaleFactorOf(context);
    final overflow = defaultTextStyle.overflow;
    final locale = widget.textCustomization?.locale ??
        Localizations.maybeLocaleOf(context);

    final TextSpan link = TextSpan(
      text: _readMoreStatus
          ? widget.features.readMore.collapsedText
          : widget.features.readMore.expandedText,
      style: _readMoreStatus ? defaultMoreStyle : defaultLessStyle,
      recognizer: TapGestureRecognizer()..onTap = _onTapLink,
    );

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        assert(constraints.hasBoundedWidth);
        final double maxWidth = constraints.maxWidth;

        // Create a TextSpan with data
        final TextSpan text = widget.features.hyperlink.enable
            ? buildTextSpan(
                linkify(widget.text ?? ""),
                style: widget.textCustomization?.style,
                onOpen: (link) => widget.features.hyperlink.onTap != null
                    ? widget.features.hyperlink.onTap!(context, link.url)
                    : onTapHyperLink(context, link),
                linkStyle: widget.features.hyperlink.style,
              )
            : TextSpan(
                style: effectiveTextStyle,
                text: widget.text,
              );

        // Layout and measure link
        TextPainter textPainter = TextPainter(
          text: link,
          textAlign: textAlign,
          textDirection: textDirection,
          textScaleFactor: textScaleFactor,
          maxLines: 2,
          ellipsis: overflow == TextOverflow.ellipsis ? kEllipsis : null,
          locale: locale,
        );

        textPainter.layout(minWidth: 0, maxWidth: maxWidth);

        // Layout and measure text
        textPainter.text = text;
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);

        TextSpan? textSpan;

        if (widget.features.readMore.enable) {
          switch (widget.features.readMore.trim.mode) {
            case TrimMode.length:
              if (widget.features.readMore.trim.length < widget.text!.length) {
                if (widget.features.hyperlink.enable) {
                  bool broke = false;
                  int totalCharacterCount = 0;
                  List<InlineSpan> textChildren = (text.children ?? []);
                  List<InlineSpan> shortTextSpanChildren = <InlineSpan>[];
                  for (int textChildrenIndex = 0;
                      textChildrenIndex < textChildren.length;
                      textChildrenIndex++) {
                    final TextSpan textSpan =
                        (textChildren[textChildrenIndex] as TextSpan);
                    final String textSpanText = (textSpan.text ?? "");
                    int localCharacterIndex = 0;
                    for (int textCharacterIndex = 0;
                        textCharacterIndex < textSpanText.length;
                        textCharacterIndex++) {
                      localCharacterIndex++;
                      totalCharacterCount++;

                      if (totalCharacterCount >
                          widget.features.readMore.trim.length) {
                        TextSpan temp1 =
                            textChildren[textChildrenIndex] as TextSpan;
                        TextSpan temp2 = TextSpan(
                          children: temp1.children,
                          locale: temp1.locale,
                          mouseCursor: temp1.mouseCursor,
                          onEnter: temp1.onEnter,
                          onExit: temp1.onExit,
                          recognizer: temp1.recognizer,
                          semanticsLabel: temp1.semanticsLabel,
                          spellOut: temp1.spellOut,
                          style: temp1.style,
                          text: temp1.text?.substring(0, localCharacterIndex),
                        );

                        for (int i = 0; i < textChildrenIndex; i++) {
                          shortTextSpanChildren
                              .add(textChildren[i] as TextSpan);
                        }
                        shortTextSpanChildren.add(temp2);
                        broke = true;
                        break;
                      }
                    }
                    if (broke) {
                      break;
                    }
                  }

                  final List<InlineSpan> finalTextSpan = _readMoreStatus
                      ? shortTextSpanChildren
                      : (text.children ?? <InlineSpan>[]);

                  textSpan = TextSpan(
                    children: [...finalTextSpan, link],
                    locale: text.locale,
                    mouseCursor: text.mouseCursor,
                    recognizer: text.recognizer,
                    onEnter: text.onEnter,
                    onExit: text.onExit,
                    semanticsLabel: text.semanticsLabel,
                    spellOut: text.spellOut,
                    style: effectiveTextStyle,
                    text: _readMoreStatus
                        ? text.text
                            ?.substring(0, widget.features.readMore.trim.length)
                        : text.text,
                  );
                } else {
                  textSpan = TextSpan(
                    style: effectiveTextStyle,
                    text: _readMoreStatus
                        ? widget.text
                            ?.substring(0, widget.features.readMore.trim.length)
                        : widget.text,
                    children: <TextSpan>[link],
                  );
                }
              } else {
                if (widget.features.hyperlink.enable) {
                  textSpan = TextSpan(
                    children: text.children,
                    locale: text.locale,
                    mouseCursor: text.mouseCursor,
                    recognizer: text.recognizer,
                    onEnter: text.onEnter,
                    onExit: text.onExit,
                    semanticsLabel: text.semanticsLabel,
                    spellOut: text.spellOut,
                    style: effectiveTextStyle,
                    text: text.text,
                  );
                } else {
                  textSpan = TextSpan(
                    style: effectiveTextStyle,
                    text: widget.text,
                  );
                }
              }
              break;
            default:
              throw Exception(
                  'TrimMode type: ${widget.features.readMore.trim.mode} is not supported');
          }
        } else {
          textSpan = TextSpan(
            style: effectiveTextStyle,
            text: widget.text,
          );
        }

        return RichText(
          textAlign: textAlign,
          textDirection: textDirection,
          softWrap: true,
          overflow: TextOverflow.clip,
          textScaleFactor: textScaleFactor,
          text: textSpan,
        );
      },
    );
  }
}
