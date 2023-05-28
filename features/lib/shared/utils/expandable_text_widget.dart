import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String? text;
  final int? trimLines;
  const ExpandableTextWidget({
    super.key,
    this.text = '',
    this.trimLines = 2,
  });

  @override
  ExpandableTextWidgetState createState() => ExpandableTextWidgetState();
}

class ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  bool _readMore = true;

  void _onTapLink() {
    setState(() {
      if (_readMore = false) _readMore = !_readMore;
    });
  }

  @override
  Widget build(BuildContext context) {
    const clickableTextStyle = TextStyle(
      fontSize: 12.5,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    );

    const nonClickableTextStyle = TextStyle(
      fontSize: 12.5,
      color: Colors.black,
    );

    TextSpan link = TextSpan(
      text: _readMore ? "... read more" : "",
      style: clickableTextStyle,
      recognizer: TapGestureRecognizer()..onTap = _onTapLink,
    );

    Widget result = LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        assert(constraints.hasBoundedWidth);

        final double maxWidth = constraints.maxWidth;

        // Create a TextSpan with data
        final text = TextSpan(
          text: widget.text,
        );

        // Layout and measure link
        TextPainter textPainter = TextPainter(
          text: link,
          textDirection: TextDirection
              .rtl, //better to pass this from master widget if ltr and rtl both supported
          maxLines: widget.trimLines,
          ellipsis: '...',
        );

        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);

        final linkSize = textPainter.size;

        // Layout and measure text
        textPainter.text = text;

        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);

        final textSize = textPainter.size;

        // Get the endIndex of data
        int endIndex;

        final pos = textPainter.getPositionForOffset(Offset(
          textSize.width - linkSize.width,
          textSize.height - linkSize.height,
        ));

        endIndex = textPainter.getOffsetBefore(pos.offset)!;

        final TextSpan textSpan;

        if (textPainter.didExceedMaxLines) {
          textSpan = TextSpan(
            text: _readMore ? widget.text!.substring(0, endIndex) : widget.text,
            style: nonClickableTextStyle,
            children: [link],
          );
        } else {
          textSpan = TextSpan(
            text: widget.text,
          );
        }

        return RichText(
          softWrap: true,
          overflow: TextOverflow.clip,
          text: textSpan,
        );
      },
    );

    return result;
  }
}
