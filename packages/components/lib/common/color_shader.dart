part of components;

class ColorShader extends StatelessWidget {
  const ColorShader({
    Key? key,
    required this.child,
    this.colors,
    this.stops = const [0.4,0.5,0.6],
    this.blendMode = BlendMode.srcIn
  }) : super(key: key);

  final Widget child;
  final List<Color>? colors;
  final List<double> stops;
  final BlendMode blendMode;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: blendMode,
      shaderCallback: (bounds) => LinearGradient(colors: colors??[
        primaryColor,
        primaryColor.withOpacity(0.5),
        primaryColor,
      ],stops: stops).createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: child,
    );
  }
}
