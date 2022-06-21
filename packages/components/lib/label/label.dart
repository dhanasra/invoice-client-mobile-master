part of components;

class Label extends StatelessWidget {
  const Label({
    Key? key,
    this.width,
    this.height,
    this.isShadow = false,
    this.padding = const [],
    this.margin = const [],
    this.expanded = false,
    this.isReverse = false,
    this.isVertical = false,
    this.mainAxisSize = min,
    this.mainAxisAlignment = mainCenter,
    this.crossAxisAlignment = crossCenter,
    this.fontFamily,
    this.theme,
    this.fontSize = 18,
    this.fontWeight,
    required this.label,
    this.textHeight,
    this.textAlign,
    this.color,
    this.decoration,
    this.textMargin = const [],
    this.textPadding = const [],
    this.decorationStyle,
    this.decorationThickness,
    this.decorationColor,
    this.labelBgColor,
    this.letterSpacing,
    this.overflow,
    this.prefix,
    this.suffix,
    this.bgColor = Colors.transparent
  }) : super(key: key);

  //overall division
  final double? width;
  final double? height;
  final bool isShadow;
  final List<double> padding;
  final List<double> margin;
  final bool expanded;
  final bool isVertical;
  final bool isReverse;

  //alignment
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;

  //text
  final String label;
  final Color? color;
  final Color? labelBgColor;
  final double fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final double? textHeight;
  final TextStyle? theme;
  final double? letterSpacing;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final Color? bgColor;
  final double? decorationThickness;
  final TextDecorationStyle? decorationStyle;
  final List<double> textPadding;
  final List<double> textMargin;
  final TextAlign? textAlign;

  //additional
  final Widget? prefix;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: isReverse?TextDirection.rtl:TextDirection.ltr,
        child: Box(
            width: width,
            height: height,
            padding: padding,
            margin: margin,
            bgColor: bgColor,
            expanded: expanded,
            child: isVertical
                ?Column(
              mainAxisSize: mainAxisSize,
              mainAxisAlignment: mainAxisAlignment,
              crossAxisAlignment: crossAxisAlignment,
              children: children(),
            )
                :Row(
              mainAxisSize: mainAxisSize,
              mainAxisAlignment: mainAxisAlignment,
              crossAxisAlignment: crossAxisAlignment,
              children: children(),
            )
        )
    );
  }

  List<Widget> children(){
    return [
      prefix??Container(),
      Box(
        bgColor: labelBgColor,
        padding: textPadding,
        margin: textMargin,
        child: Text(
          label,
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
      ),
      suffix??Container()
    ];
  }
}
