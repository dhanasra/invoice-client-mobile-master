part of components;

class WaveAnimation extends StatefulWidget  {
  const WaveAnimation({
    Key? key,
    required this.child,
    required this.controller,
    required this.animation,
    this.lowerBound = 0.8,
    this.upperBound = 1,
    this.duration = 2,
    this.waveColor = Colors.blue,
    this.waveGap = 20,
    this.radius = 100
  }) : super(key: key);

  final Widget child;
  final int duration;
  final double lowerBound;
  final double upperBound;
  final Color waveColor;
  final int waveGap;
  final int radius;
  final ValueChanged<AnimationController> controller;
  final ValueChanged<Animation> animation;

  @override
  _WaveAnimationState createState() => _WaveAnimationState();
}

class _WaveAnimationState extends State<WaveAnimation> with TickerProviderStateMixin{
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      lowerBound: widget.lowerBound,
      upperBound: widget.upperBound,
      duration: Duration(seconds: widget.duration),
    )..repeat();

    animation = CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    widget.controller(controller);
    widget.animation(animation);

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Stack(
              alignment: Alignment.center,
              children: <Widget>[
                _buildContainer((widget.radius) * controller.value),
                _buildContainer((widget.radius+widget.waveGap) * controller.value),
                _buildContainer((widget.radius+(2*widget.waveGap)) * controller.value),
                Align(child: widget.child),
              ],
        );
      },
    );
  }

  Widget _buildContainer(double radius) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.waveColor.withOpacity(1 - controller.value),
      ),
    );
  }
}


