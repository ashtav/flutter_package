part of 'widget.dart';

class ZoomIn extends StatefulWidget {
  ZoomIn({this.child, this.delay});
  final Widget child;
  final int delay;

  @override
  _ZoomInState createState() => _ZoomInState();
}

class _ZoomInState extends State<ZoomIn> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;
  Timer timer;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    scaleAnimation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    widget.delay == null
        ? controller.forward()
        : timer = Timer(Duration(milliseconds: widget.delay), () {
            controller.forward();
          });
  }

  @override
  void dispose() {
    controller.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: scaleAnimation, child: widget.child);
  }
}

class SlideLeft extends StatefulWidget {
  final Widget child;
  final int delay;
  final double speed;
  SlideLeft({@required this.child, this.delay, this.speed: 0.50});
  @override
  _SlideLeftState createState() => _SlideLeftState();
}

class _SlideLeftState extends State<SlideLeft> with TickerProviderStateMixin {
  AnimationController _animController;
  Animation<Offset> _animOffset;
  Timer timer;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    final curve = CurvedAnimation(curve: Curves.decelerate, parent: _animController);
    _animOffset = Tween<Offset>(begin: Offset(widget.speed, 0.0), end: Offset.zero).animate(curve);
    widget.delay == null
        ? _animController.forward()
        : timer = Timer(Duration(milliseconds: widget.delay), () {
            _animController.forward();
          });
  }

  @override
  void dispose() {
    _animController.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(child: SlideTransition(position: _animOffset, child: widget.child), opacity: _animController);
  }
}

class SlideRight extends StatefulWidget {
  final Widget child;
  final int delay;
  final double speed;
  SlideRight({@required this.child, this.delay, this.speed: 0.50});
  @override
  _SlideRightState createState() => _SlideRightState();
}

class _SlideRightState extends State<SlideRight> with TickerProviderStateMixin {
  AnimationController _animController;
  Animation<Offset> _animOffset;
  Timer timer;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    final curve = CurvedAnimation(curve: Curves.decelerate, parent: _animController);
    _animOffset = Tween<Offset>(begin: Offset(-widget.speed, 0.0), end: Offset.zero).animate(curve);
    widget.delay == null
        ? _animController.forward()
        : timer = Timer(Duration(milliseconds: widget.delay), () {
            _animController.forward();
          });
  }

  @override
  void dispose() {
    _animController.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(child: SlideTransition(position: _animOffset, child: widget.child), opacity: _animController);
  }
}

class SlideUp extends StatefulWidget {
  final Widget child;
  final int delay;
  final double speed;
  SlideUp({@required this.child, this.delay, this.speed: 0.50});
  @override
  _SlideUpState createState() => _SlideUpState();
}

class _SlideUpState extends State<SlideUp> with TickerProviderStateMixin {
  AnimationController _animController;
  Animation<Offset> _animOffset;
  Timer timer;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    final curve = CurvedAnimation(curve: Curves.decelerate, parent: _animController);
    _animOffset = Tween<Offset>(begin: Offset(0.0, widget.speed), end: Offset.zero).animate(curve);
    widget.delay == null
        ? _animController.forward()
        : timer = Timer(Duration(milliseconds: widget.delay), () {
            _animController.forward();
          });
  }

  @override
  void dispose() {
    _animController.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(child: SlideTransition(position: _animOffset, child: widget.child), opacity: _animController);
  }
}

class SlideDown extends StatefulWidget {
  final Widget child;
  final int delay;
  final double speed;
  SlideDown({@required this.child, this.delay, this.speed: 0.50});
  @override
  _SlideDownState createState() => _SlideDownState();
}

class _SlideDownState extends State<SlideDown> with TickerProviderStateMixin {
  AnimationController _animController;
  Animation<Offset> _animOffset;
  Timer timer;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    final curve = CurvedAnimation(curve: Curves.decelerate, parent: _animController);
    _animOffset = Tween<Offset>(begin: Offset(0.0, -widget.speed), end: Offset.zero).animate(curve);
    widget.delay == null
        ? _animController.forward()
        : timer = Timer(Duration(milliseconds: widget.delay), () {
            _animController.forward();
          });
  }

  @override
  void dispose() {
    _animController.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(child: SlideTransition(position: _animOffset, child: widget.child), opacity: _animController);
  }
}
