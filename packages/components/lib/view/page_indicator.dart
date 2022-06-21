part of components;

class PageIndicator extends StatelessWidget {
  final int count;
  final int selectedPosition;
  final List<double> margin;
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

  const PageIndicator({
    Key? key,
    required this.count,
    this.radius = round,
    this.margin = const [],
    required this.selectedPosition,
    this.dotColor = promptColor,
    this.dotHeight = 15,
    this.dotMargin = const [5,0],
    this.dotWidth = 15,
    this.selectedDotColor = btnColor,
    this.selectedDotHeight = 15,
    this.selectedDotMargin = const [5,0],
    this.selectedDotWidth = 15
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Box(
        margin: margin,
        height: dotHeight,
        width: double.infinity,
        alignment: Alignment.center,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: count,
            itemBuilder: (BuildContext context, int index) {
              return Box(
                height: selectedPosition == index?selectedDotHeight:dotHeight,
                margin: selectedPosition == index?selectedDotMargin:dotMargin,
                width: selectedPosition == index?selectedDotWidth:dotWidth,
                bgColor: selectedPosition == index?selectedDotColor:dotColor,
                radius: radius,
              );
            }
        )
    );
  }
}

