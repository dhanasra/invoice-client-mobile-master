part of components;

class Loader extends StatelessWidget {
  const Loader({
    Key? key,
    this.alignment = center,
    this.color = white,
    this.valueColor = primaryColor,
    this.width = 16,
    this.height = 16,
    this.strokeWidth = 2
  }) : super(key: key);

  final Alignment alignment;
  final Color valueColor;
  final Color color;
  final double strokeWidth;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Box(
      alignment: alignment,
      child: SizedBox(
        width: width,
        height: height,
        child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(valueColor),
            color: color,
            strokeWidth: strokeWidth
        ),
      )
    );
  }
}

