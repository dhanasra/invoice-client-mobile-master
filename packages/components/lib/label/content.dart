part of components;

class Content extends StatelessWidget {
  const Content({
    Key? key,
    this.width,
    this.height,
    this.padding = const [],
    this.margin = const [],
    this.expanded = false,
    this.fontFamily,
    this.fontSize = 18,
    this.fontWeight,
    required this.text,
    this.textHeight,
    this.theme,
    this.textAlign,
    this.color,
    this.decoration,
    this.decorationStyle,
    this.decorationThickness,
    this.decorationColor,
    this.letterSpacing,
    this.overflow,
    this.bgColor = Colors.transparent
  }) : super(key: key);

  //overall division
  final double? width;
  final double? height;
  final List<double> padding;
  final List<double> margin;
  final bool expanded;

  //text
  final String text;
  final Color? color;
  final double fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final double? textHeight;
  final double? letterSpacing;
  final TextStyle? theme;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final Color? bgColor;
  final double? decorationThickness;
  final TextDecorationStyle? decorationStyle;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Box(
            width: width,
            height: height,
            padding: padding,
            margin: margin,
            bgColor: bgColor,
            expanded: expanded,
            child: Text(
              text,
              overflow: overflow,
              maxLines: 3,
              textAlign: textAlign??TextAlign.center,
              style: theme??TextStyle(
                  fontSize: fontSize,
                  fontFamily: fontFamily,
                  fontWeight: fontWeight,
                  color: color??Colors.black,
                  letterSpacing: letterSpacing,
                  height: textHeight,
                  decoration: decoration,
                  decorationColor: decorationColor,
                  decorationThickness: decorationThickness,
                  decorationStyle: decorationStyle
              ),
            ).tr(),
    );
  }
}
