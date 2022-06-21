part of components;


class ScaleAnimation extends StatefulWidget {
  const ScaleAnimation({
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
  _ScaleAnimationState createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<ScaleAnimation> with TickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> scaleAnim;

  @override
  void initState() {
    controller = AnimationController(vsync: this,duration: Duration(seconds: widget.duration),value: widget.value);
    scaleAnim = Tween<double>(begin: widget.begin,end: widget.end)
        .animate(CurvedAnimation(parent: controller, curve: widget.curve));

    widget.controller(controller);
    widget.animation(scaleAnim);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
        scale: scaleAnim,
        child: widget.child,
    );
  }
}
