import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int trimLines;
  final TextStyle? textStyle; // Regular text style
  final TextStyle? linkStyle; // "See more..." style
  final String seeMoreText;
  final String seeLessText;

  const ExpandableText({
    super.key,
    required this.text,
    this.trimLines = 2,
    this.textStyle,
    this.linkStyle,
    this.seeMoreText = 'See more...',
    this.seeLessText = 'See less',
  });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final text = widget.text;

    return LayoutBuilder(
      builder: (context, constraints) {
        final span = TextSpan(text: text, style: widget.textStyle ?? TextStyle(color: Colors.black));
        final tp = TextPainter(
          text: span,
          maxLines: widget.trimLines,
          textDirection: TextDirection.ltr,
        );
        tp.layout(maxWidth: constraints.maxWidth);

        if (!tp.didExceedMaxLines) {
          // Text fits, no need to truncate
          return Text(text, style: widget.textStyle);
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              maxLines: isExpanded ? null : widget.trimLines,
              overflow: TextOverflow.fade,
              style: widget.textStyle,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Text(
                isExpanded ? widget.seeLessText : widget.seeMoreText,
                style: widget.linkStyle ?? TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
  }
}

