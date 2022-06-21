part of components;

class FadeAnimation extends StatefulWidget  {
  const FadeAnimation({
    Key? key,
    required this.child,
    required this.controller,
    required this.animation,
    this.begin = 0.0,
    this.end = 1,
    this.duration = 2
  }) : super(key: key);

  final Widget child;
  final int duration;
  final double begin;
  final double end;
  final ValueChanged<AnimationController> controller;
  final ValueChanged<Animation<double>> animation;

  @override
  _FadeAnimationState createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation> with TickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> fadeAnim;

  @override
  void initState() {
    controller = AnimationController(vsync: this,duration: Duration(seconds: widget.duration));
    fadeAnim = Tween<double>(begin: widget.begin,end: widget.end).animate(controller);
    widget.controller(controller);
    widget.animation(fadeAnim);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: fadeAnim,
        child:widget.child
    );
  }
}
