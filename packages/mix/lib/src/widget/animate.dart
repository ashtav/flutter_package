part of 'widget.dart';

class DotIndicator extends StatelessWidget {
  final int dot;
  final Color color;
  DotIndicator({this.dot: 3, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: JumpingDotsProgressIndicator(
        numberOfDots: dot,
        color: color ?? Colors.white,
      ),
    );
  }
}

class _JumpingDot extends AnimatedWidget {
  final Color color;
  final double fontSize;

  _JumpingDot({Key key, Animation<double> animation, this.color, this.fontSize}) : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Container(
        height: animation.value,
        child: Container(
          margin: Ei.sym(h: 4),
          height: 15,
          width: 9,
          decoration: BoxDecoration(borderRadius: Br.radius(50), color: color),
        ));
  }
}

class JumpingDotsProgressIndicator extends StatefulWidget {
  final int numberOfDots;
  final double fontSize;
  final double dotSpacing;
  final Color color;
  final int milliseconds;
  final double beginTweenValue = 0.0;
  final double endTweenValue = 8.0;

  /// Creates a jumping do progress indicator.
  JumpingDotsProgressIndicator({
    this.numberOfDots = 3,
    this.fontSize = 10.0,
    this.color = Colors.black,
    this.dotSpacing = 0.0,
    this.milliseconds = 250,
  });

  _JumpingDotsProgressIndicatorState createState() => _JumpingDotsProgressIndicatorState(
        numberOfDots: this.numberOfDots,
        fontSize: this.fontSize,
        color: this.color,
        dotSpacing: this.dotSpacing,
        milliseconds: this.milliseconds,
      );
}

class _JumpingDotsProgressIndicatorState extends State<JumpingDotsProgressIndicator> with TickerProviderStateMixin {
  int numberOfDots;
  int milliseconds;
  double fontSize;
  double dotSpacing;
  Color color;
  List<AnimationController> controllers = [];
  List<Animation<double>> animations = [];
  List<Widget> _widgets = [];

  _JumpingDotsProgressIndicatorState({
    this.numberOfDots,
    this.fontSize,
    this.color,
    this.dotSpacing,
    this.milliseconds,
  });

  initState() {
    super.initState();
    for (int i = 0; i < numberOfDots; i++) {
      _addAnimationControllers();
      _buildAnimations(i);
      _addListOfDots(i);
    }

    controllers[0].forward();
  }

  void _addAnimationControllers() {
    controllers.add(AnimationController(duration: Duration(milliseconds: milliseconds), vsync: this));
  }

  void _addListOfDots(int index) {
    _widgets.add(
      _JumpingDot(
        animation: animations[index],
        fontSize: fontSize,
        color: color,
      ),
    );
  }

  void _buildAnimations(int index) {
    animations.add(
      Tween(begin: widget.beginTweenValue, end: widget.endTweenValue).animate(controllers[index])
        ..addStatusListener(
          (AnimationStatus status) {
            if (status == AnimationStatus.completed) controllers[index].reverse();
            if (index == numberOfDots - 1 && status == AnimationStatus.dismissed) {
              controllers[0].forward();
            }
            if (animations[index].value > widget.endTweenValue / 2 && index < numberOfDots - 1) {
              controllers[index + 1].forward();
            }
          },
        ),
    );
  }

  Widget build(BuildContext context) {
    return SizedBox(
      height: 15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _widgets,
      ),
    );
  }

  dispose() {
    for (int i = 0; i < numberOfDots; i++) controllers[i].dispose();
    super.dispose();
  }
}

class BlinkAnimate extends StatelessWidget {
  final Widget child;
  final Key key;

  BlinkAnimate({this.child, this.key});

  @override
  Widget build(BuildContext context) {
    return Animator(
      key: key,
      tween: Tween<double>(begin: 0, end: 300),
      cycles: 0,
      builder: (context, anim, f) {
        return AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          opacity: anim.value >= 150 ? 1 : 0,
          child: child,
        );
      },
    );
  }
}
