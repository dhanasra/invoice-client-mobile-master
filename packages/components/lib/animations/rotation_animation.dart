part of components;

class RotationAnimation extends StatefulWidget {
  const RotationAnimation({
    Key? key,
    required this.child,
    required this.controller,
    required this.animation,
    this.begin = 0.0,
    this.end = 1,
    this.duration = 2,
    this.value = 0.5,
    this.curve = Curves.elasticInOut
  }) : super(key: key);

  final Widget child;
  final int duration;
  final double begin;
  final double end;
  final double value;
  final Curve curve;
  final ValueChanged<AnimationController> controller;
  final ValueChanged<Animation<double>> animation;

  @override
  _RotationAnimationState createState() => _RotationAnimationState();
}

class _RotationAnimationState extends State<RotationAnimation> with TickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> rotateAnim;

  @override
  void initState() {
    controller = AnimationController(vsync: this,duration: Duration(seconds: widget.duration),value: widget.value);
    rotateAnim = Tween<double>(begin: widget.begin,end: widget.end)
        .animate(CurvedAnimation(parent: controller, curve: widget.curve));

    widget.controller(controller);
    widget.animation(rotateAnim);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: rotateAnim,
      child: widget.child,
    );
  }
}
