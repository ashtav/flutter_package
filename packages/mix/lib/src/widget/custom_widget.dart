part of 'widget.dart';

/// Shortcut of `SizedBox.shrink()`
class None extends StatelessWidget {
  final Key key;
  None({this.key});

  @override
  Widget build(BuildContext context) => SizedBox.shrink(key: key);
}

/// `PreventScrollGlow` digunakan untuk menghilangkan efek glow pada ListView
///
/// ``` dart
/// PreventScrollGlow(
///   child: ListView()
/// )
/// ```
class PreventScrollGlow extends StatelessWidget {
  final Widget child;
  PreventScrollGlow({this.child});

  @override
  Widget build(BuildContext context) => ScrollConfiguration(behavior: ScrollConfig(), child: child);
}

class ScrollConfig extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

/// `FocusOff` digunakan untuk unfocus semua `TextField` saat widget diluar `TextField` ditap
///
/// ``` dart
/// FocusOff(
///   child: Scaffold()
/// )
/// ```
class FocusOff extends StatelessWidget {
  final Widget child;
  FocusOff({@required this.child});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => Fn.unfocus(),
        child: child,
      );
}

/// ``` dart
/// FlipH(
///   child: Icon()
/// )
/// ```
class FlipH extends StatelessWidget {
  final Widget icon;
  FlipH(this.icon);

  @override
  Widget build(BuildContext context) => Transform(alignment: Alignment.center, transform: Matrix4.rotationY(pi), child: icon);
}

class Button extends StatelessWidget {
  Button(
      {this.key,
      this.child,
      this.elevation: 0,
      this.onTap,
      this.onLongPress,
      this.onDoubleTap,
      this.padding,
      this.color,
      this.splash,
      this.highlightColor,
      this.radius,
      this.margin,
      this.shape,
      this.enableSplash: true,
      this.splashByBaseColor: false,
      this.border});

  final Key key;
  final Widget child;
  final Function onTap, onLongPress, onDoubleTap;
  final EdgeInsetsGeometry padding, margin;
  final Color color, splash, highlightColor;
  final BorderRadiusGeometry radius;
  final BoxBorder border;
  final double elevation;
  final ShapeBorder shape;
  final bool enableSplash, splashByBaseColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.all(0),
      child: Material(
        key: key,
        elevation: elevation,
        color: color ?? Colors.transparent,
        // color: color == null ? Colors.transparent : color,
        borderRadius: radius,
        shape: shape,
        child: InkWell(
            onDoubleTap: onDoubleTap,
            onLongPress: onLongPress,
            splashColor: !enableSplash
                ? Colors.transparent
                : splash == null
                    ? color == null || !splashByBaseColor
                        ? Color.fromRGBO(0, 0, 0, .03)
                        : color.withOpacity(.08)
                    : splash,
            highlightColor: !enableSplash
                ? Colors.transparent
                : highlightColor == null
                    ? color == null || !splashByBaseColor
                        ? Color.fromRGBO(0, 0, 0, .03)
                        : color.withOpacity(.1)
                    : highlightColor,
            onTap: onTap,
            borderRadius: radius,
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: radius,
                  border: border,
                  // color: color,
                ),
                padding: padding == null ? EdgeInsets.all(0) : padding,
                child: child)),
      ),
    );
  }
}

/// Custom animate loader dengan `Sekeleton()`
class Skeleton extends StatelessWidget {
  final Color baseColor, highlightColor, color;
  final double height, width, radius;
  final EdgeInsets margin;

  Skeleton(
      {this.baseColor: Colors.black26,
      this.highlightColor: Colors.black12,
      this.color: Colors.black54,
      this.height: 15,
      this.width: 50,
      this.margin,
      this.radius: 30});

  @override
  Widget build(BuildContext context) => Container(
        margin: margin,
        child: Shimmer.fromColors(
          baseColor: baseColor,
          highlightColor: highlightColor,
          child: Container(
            height: height,
            width: width,
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(radius)),
          ),
        ),
      );
}

/// `CenterDialog` akan memberikan widget untuk `ShowDialog` pada posisi tengah, sehingga kita hanya fokus pada isi dari dialog tersebut
///
/// ``` dart
/// CenterDialog(
///   child: /// your widget
/// )
/// ```
class CenterDialog extends StatelessWidget {
  final Widget child;
  final double margin;

  CenterDialog({@required this.child, this.margin: 15});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Material(color: Colors.transparent, child: Container(margin: EdgeInsets.all(margin), child: child))]));
  }
}

/// ``` dart
/// WidgetsBinding.instance.addObserver( LifecycleEventHandler(resumeCallBack: () async => (){
///   //do something...
/// }));
/// ```
///
/// parameters `resumeCallBack` and `suspendingCallBack`
class LifecycleEventHandler extends WidgetsBindingObserver {
  final AsyncCallback resumeCallBack;
  final AsyncCallback suspendingCallBack;

  LifecycleEventHandler({
    this.resumeCallBack,
    this.suspendingCallBack,
  });

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        if (resumeCallBack != null) {
          await resumeCallBack();
        }
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        if (suspendingCallBack != null) {
          await suspendingCallBack();
        }
        break;
    }
  }
}

///
/// ``` dart
/// Modal.bottomSheet(BottomSheetWidget());
/// ```
///
class BottomSheetWidget extends StatelessWidget {
  final Widget child;
  final double radius;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;

  BottomSheetWidget({this.child, this.radius: 5, this.backgroundColor, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: ClipRRect(
        borderRadius: padding == null
            ? BorderRadius.only(
                topLeft: Radius.circular(radius),
                topRight: Radius.circular(radius),
              )
            : BorderRadius.all(Radius.circular(radius)),
        child: Container(color: backgroundColor ?? Colors.white, child: Wrap(children: <Widget>[child])),
      ),
    );
  }
}

//
//
//

class Indicator {
  /// ``` dart
  /// Indicator.overlay();
  /// ```
  static overlay({String message, bool dismiss: true, Function then, double size: 50, TextStyle messageStyle}) async {
    showDialog(
        context: Get.overlayContext,
        barrierDismissible: dismiss,
        builder: (_) => CenterDialog(
              child: ZoomIn(
                child: Column(
                  children: [
                    SizedBox(
                      height: size,
                      width: size,
                      child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white), strokeWidth: 2),
                    ),
                    message == null
                        ? SizedBox.shrink()
                        : Container(margin: EdgeInsets.only(top: 15), child: Text(message ?? '', style: messageStyle ?? TextStyle(color: C.white)))
                  ],
                ),
              ),
            )).then((value) {
      if (then != null) then(value);
    });
  }

  /// ``` dart
  /// Indicator.spiner();
  /// ```
  static spiner({Key key, double size: 17, Color color}) {
    return SizedBox(
      key: key,
      height: size,
      width: size,
      child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(color ?? Colors.white), strokeWidth: 2),
    );
  }
}

class Modal {
  /// Shortcut dari fungsi `showDialog()`
  ///
  /// ``` dart
  /// Modal.open(CustomWidget());
  /// ```
  ///
  static Future open(Widget widget, {Function(dynamic) then}) =>
      showDialog(context: Get.overlayContext, builder: (_) => widget).then((_) => then == null ? () {} : then(_));

  /// Shortcut dari fungsi `showModalBottomSheet()`
  ///
  /// ``` dart
  /// Modal.bottomSheet(CustomWidget());
  /// ```
  ///
  static Future bottomSheet(Widget widget, {BuildContext context, Function(dynamic) then}) => showModalBottomSheet<dynamic>(
      isScrollControlled: true,
      context: context ?? Get.overlayContext,
      backgroundColor: Colors.transparent,
      builder: (BuildContext _) => widget).then((_) => then == null ? () {} : then(_));
}
