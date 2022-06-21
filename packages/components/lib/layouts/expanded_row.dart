part of components;

class ExpandedRow extends StatelessWidget {
  const ExpandedRow({
    Key? key,
    this.width,
    this.height,
    this.bgColor = Colors.transparent,
    this.isShadow = false,
    this.padding = const [],
    this.margin = const [],
    required this.children
  }) : super(key: key);

  //overall division
  final double? width;
  final double? height;
  final bool isShadow;
  final Color? bgColor;
  final List<double> padding;
  final List<double> margin;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Box(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        bgColor: bgColor,
        radius: sharp,
        child: row()
    );
  }

  Widget row(){
    return Row(
      crossAxisAlignment: crossStart,
      children: children.map((e) {
        return Expanded(
          child: e,
        );
      }).toList(),
    );
  }
}
