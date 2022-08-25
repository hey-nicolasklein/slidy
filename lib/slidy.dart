import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:slidy/roundedArrow.dart';

class Slidy extends StatefulWidget {
  /// Called when the nob reaches the top.
  final Function action;

  /// Height of the slider.
  final double height;

  /// Width of the slider.
  final double width;

  /// The radius of the slider button.
  final double radius;

  /// The color around the slider.
  final Color outerBackgroundColor;

  /// The inside color of the slider.
  /// If a [innerGradient] is set, this value is overridden.
  final Color innerBackgroundColor;

  /// The gradient displayed inside the slider.
  final Gradient? innerGradient;

  /// The color of the draggable nob.
  final Color nobColor;

  /// Optionally define an icon to be shown inside the draggable nob.
  final Icon? nobIcon;

  /// Should a shimmer be shown over the backgroundElement.
  final bool shimmer;

  /// Color behind the shimmer.
  final Color shimmerColor;

  /// Color of the shimmer.
  final Color shimmerHighlightedColor;

  /// A widget to be shown behind the slider button.
  final Widget? backgroundElement;

  /// Show an upwards pointing arrow as the backgroundElement.
  final bool displayArrowBackgroundElement;

  /// The offset threshold the nob has to be dragged in order to be
  /// considered dismissed. When set to 0.7 the nob has to be dragged
  /// at least 70% towards the maximum.
  final double dismissThresholds;

  const Slidy({
    Key? key,
    required this.action,
    this.width = 60,
    this.height = 150,
    this.radius = 100,
    this.outerBackgroundColor = const Color(0xff495BFF),
    this.innerBackgroundColor = const Color(0xff495BFF),
    this.innerGradient = const LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [
          Color(0x32252860),
          Color(0x32903AFF),
        ]),
    this.nobIcon,
    this.nobColor = const Color(0xFF495BFF),
    this.backgroundElement,
    this.shimmer = true,
    this.shimmerColor = const Color(0xff495BFF),
    this.shimmerHighlightedColor = Colors.white,
    this.dismissThresholds = 0.9,
    this.displayArrowBackgroundElement = false,
  }) : super(key: key);

  @override
  State<Slidy> createState() => _SlidyState();
}

class _SlidyState extends State<Slidy> {
  double sliderPosition = 0;
  double prevSliderPosition = 0;

  Key sliderKey = UniqueKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFF252860),
          border: Border.all(
              color: widget.outerBackgroundColor,
              width: 2,
              style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(widget.radius)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
              gradient: widget.innerGradient,
              color: widget.innerBackgroundColor,
              borderRadius: BorderRadius.circular(widget.radius)),
          child: Stack(
            children: <Widget>[
              /// Background widget
              Container(
                alignment: Alignment.center,
                child: Builder(builder: (context) {
                  if (widget.backgroundElement != null) {
                    return Opacity(
                      opacity: (1 - sliderPosition).abs(),
                      child: widget.shimmer
                          ? Builder(builder: (context) {
                              return Shimmer.fromColors(
                                direction: ShimmerDirection.btt,
                                baseColor: widget.shimmerColor,
                                highlightColor: widget.shimmerHighlightedColor,
                                child: widget.backgroundElement!,
                              );
                            })
                          : widget.backgroundElement!,
                    );
                  } else if (widget.displayArrowBackgroundElement) {
                    return Opacity(
                      opacity: (1 - sliderPosition).abs(),
                      child: RoundedArrow(
                        width: widget.width > 40
                            ? widget.width - 40
                            : widget.width - 20,
                      ),
                    );
                  }
                  return Container();
                }),
              ),
              Padding(
                padding: EdgeInsets.only(top: widget.width),
                child: Dismissible(
                  onUpdate: ((details) {
                    updateOpacity(details.progress);
                  }),
                  key: sliderKey,
                  direction: DismissDirection.up,
                  dismissThresholds: {
                    DismissDirection.up: widget.dismissThresholds
                  },
                  confirmDismiss: (direction) {
                    widget.action();
                    return Future.value(false);
                  },

                  /// Draggable nob
                  child: Container(
                    width: widget.height - widget.width,
                    height: widget.height,
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: widget.width,
                      width: widget.width,
                      decoration: BoxDecoration(
                          color: widget.nobColor,
                          borderRadius: BorderRadius.circular(widget.radius)),
                      child: Center(child: widget.nobIcon),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Updates the current slider positon used to determine
  /// the [widget.backgroundElement] opacity.
  void updateOpacity(double newSliderPosition) {
    /// Only update the sliderPositon if the difference is over
    /// a certain threshold
    if ((newSliderPosition - sliderPosition).abs() > 0.01) {
      setState(() {
        sliderPosition = newSliderPosition;
      });
    }
  }
}
