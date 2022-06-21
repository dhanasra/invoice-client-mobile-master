part of components;

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    this.type = elevated,
    this.width,
    this.height = 45,
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
    this.fontSize = btnText,
    this.fontWeight = btnTextWeight,
    required this.label,
    this.textHeight,
    this.textAlign,
    this.color = white,
    this.buttonColor = btnColor,
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
    this.borderWidth = thin,
    this.noBorder = true,
    this.isLoading = false,
    this.loaderColor = borderColor,
    this.buttonBorderColor = borderColor,
    this.radius = blunt,
    required this.onPressed
  }) : super(key: key);

  final int type;
  final double borderWidth;
  final bool noBorder;
  final bool isLoading;
  final Color loaderColor;

  //overall division
  final double? width;
  final double height;
  final bool isShadow;
  final List<double> padding;
  final List<double> margin;
  final bool expanded;
  final bool isVertical;
  final bool isReverse;
  final double radius;

  //alignment
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;

  //text
  final String label;
  final Color color;
  final Color buttonColor;
  final Color buttonBorderColor;
  final Color? labelBgColor;
  final double fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final double? textHeight;
  final double? letterSpacing;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final double? decorationThickness;
  final TextDecorationStyle? decorationStyle;
  final List<double> textPadding;
  final List<double> textMargin;
  final TextAlign? textAlign;

  //additional
  final Widget? prefix;
  final Widget? suffix;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Box(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        bgColor: Colors.transparent,
        expanded: expanded,
        child: type == 0
            ? ElevatedButton(
                onPressed: isLoading ? null :onPressed, child: isLoading ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(loaderColor) ,
                ) :button(),style: style(),)
            : TextButton(
                onPressed: isLoading ? null :onPressed, child: isLoading ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(loaderColor) ,
                ) :button(),style: style(),)

    );
  }

  ButtonStyle style(){
    return ButtonStyle(
        backgroundColor: MaterialStateProperty.all(buttonColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
                side: BorderSide(
                    width: borderWidth,
                    style: noBorder?BorderStyle.none:BorderStyle.solid,
                    color: buttonBorderColor)
            )
        )
    );
  }

  Widget button(){
    return Label(
      isReverse: isReverse,
      isVertical: isVertical,
      mainAxisSize: mainAxisSize,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      label: label,
      textHeight: textHeight,
      textAlign: textAlign,
      color: color,
      decoration: decoration,
      textMargin: textMargin,
      textPadding: textPadding,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      decorationColor: decorationColor,
      labelBgColor: labelBgColor,
      letterSpacing: letterSpacing,
      overflow: overflow,
      prefix: prefix,
      suffix: suffix,
    );
  }
}
