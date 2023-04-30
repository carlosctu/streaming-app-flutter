import 'package:components/design_components.dart';
import 'package:features/home/model/anime_list_view_data.dart';
import 'package:features/home/widgets/carousel_section/widgets/carousel_anime_container_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AnimePageArguments {
  final AnimeViewData anime;
  AnimePageArguments({
    required this.anime,
  });
}

class AnimePage extends StatefulWidget {
  final AnimePageArguments args;
  const AnimePage({
    super.key,
    required this.args,
  });

  static const name = "/anime";

  @override
  State<AnimePage> createState() => _AnimePageState();
}

class _AnimePageState extends State<AnimePage> {
  bool _isExpanded = false;

  void _handleExpansion(bool isExpanded) {
    setState(() {
      _isExpanded = isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.args.anime);

    final anime = widget.args.anime;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Image.network(
                anime.attributes!.posterImage!.original!,
                fit: BoxFit.fill,
                loadingBuilder: (context, child, loadingProgress) {
                  return Container(
                    child: loadingProgress == null
                        ? AnimeCoverImage(
                            anime: anime,
                            child: child,
                          )
                        : ShimmerEffect(
                            height: 500,
                            width: MediaQuery.of(context).size.width,
                          ),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      anime.attributes?.canonicalTitle ?? '',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ExpandableText(
                      text: anime.attributes?.synopsis?.split('(')[0],
                    ),
                    Text('Content'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimeCoverImage extends StatelessWidget {
  final AnimeViewData anime;
  final Widget child;
  const AnimeCoverImage({
    super.key,
    required this.anime,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SizedBox(
          height: anime
              .attributes?.posterImage?.imageInfo?.dimensions?.medium?.height
              ?.toDouble(),
          width: MediaQuery.of(context).size.width,
          child: child,
        ),
        Container(
          height: 80,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.9),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.7),
                spreadRadius: 5,
                blurRadius: 60,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ExpandableText extends StatefulWidget {
  final String? text;
  final int? trimLines;
  const ExpandableText({
    super.key,
    this.text = '',
    this.trimLines = 2,
  });

  @override
  ExpandableTextState createState() => ExpandableTextState();
}

class ExpandableTextState extends State<ExpandableText> {
  bool _readMore = true;

  void _onTapLink() {
    setState(() {
      if (_readMore = false) _readMore = !_readMore;
    });
  }

  @override
  Widget build(BuildContext context) {
    const clickableTextStyle = TextStyle(
      fontSize: 13,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    );

    const nonClickableTextStyle = TextStyle(
      fontSize: 13,
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
          textSize.height,
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
