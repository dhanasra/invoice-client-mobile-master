part of components;

class CarouselContainer extends StatefulWidget {
  final List<Widget> items;
  final PageController controller;
  final double containerHeight;
  final Color bgColor;
  final double imageHeight;
  final double imageWidth;
  final List<double> padding;
  //dot style
  final double? dotWidth;
  final double? dotHeight;
  final List<double> dotMargin;
  final Color? dotColor;
  final double radius;
  final double? selectedDotWidth;
  final double? selectedDotHeight;
  final List<double> selectedDotMargin;
  final Color? selectedDotColor;
  final List<double>? indicatorMargin;
  final bool indicatorIsVisible;

  const CarouselContainer({
    Key? key,
    required this.items,
    required this.controller,
    this.bgColor = white,
    this.padding = const [0],
    this.containerHeight = 500,
    this.imageHeight = 400,
    this.imageWidth = 400,
    this.dotColor = promptColor,
    this.selectedDotColor = btnColor,
    this.dotMargin  = const [5,0],
    this.selectedDotMargin = const [5,0],
    this.selectedDotWidth = 12,
    this.dotWidth = 10,
    this.selectedDotHeight = 14,
    this.dotHeight = 12,
    this.radius = round,
    this.indicatorMargin,
    this.indicatorIsVisible = true
  });


  @override
  _CarouselContainerState createState() => _CarouselContainerState();
}

class _CarouselContainerState extends State<CarouselContainer> {

  int position = 0;

  @override
  Widget build(BuildContext context) {
    return Box(
      bgColor: widget.bgColor,
      child: ListView(
        shrinkWrap: true,
        children: [
          Box(
            child: carouselSlider(),
            height: widget.containerHeight,
          ),
          widget.indicatorIsVisible
              ? PageIndicator(
            margin: widget.indicatorMargin ?? [0],
            count: widget.items.length,
            selectedPosition: position,
            dotColor: widget.dotColor,
            dotHeight: widget.dotHeight,
            dotWidth: widget.dotWidth,
            dotMargin: widget.dotMargin,
            selectedDotColor: widget.selectedDotColor,
            selectedDotHeight: widget.selectedDotHeight,
            selectedDotMargin: widget.selectedDotMargin,
            selectedDotWidth: widget.selectedDotWidth,
            radius: widget.radius,
          )
              : Container()
        ],
      ),
    );
  }

  Widget carouselSlider() {
    return PageView.builder(
      itemCount: widget.items.length,
      scrollDirection: Axis.horizontal,
      pageSnapping: true,
      controller: widget.controller,
      physics: const BouncingScrollPhysics(),
      onPageChanged: (pos) {
        setState(() {
          position = pos;
        });
      },
      itemBuilder: (BuildContext context, position) {
        return widget.items[position];
      },
    );
  }
}