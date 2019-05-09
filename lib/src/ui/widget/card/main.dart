import 'package:flutter/material.dart';
import 'package:learnigo/src/ui/screen/gameSW/buttons.dart';

import '../column_row_fit.dart';

class MovieCardWidget extends StatefulWidget {
  MovieCardWidget(
      {Key key,
      @required this.child,
      this.onRightPress,
      this.onLeftPress,
      this.onLeft,
      this.onRight,
      this.children})
      : super(key: key);

  final Widget child;
  final List<Widget> children;
  final VoidCallback onRightPress;
  final Widget onRight;
  final VoidCallback onLeftPress;
  final Widget onLeft;

  @override
  _MovieCardWidgetState createState() => _MovieCardWidgetState();
}

class _MovieCardWidgetState extends State<MovieCardWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  int _offset = 500;

  Tween _tween = new AlignmentTween(
    begin: new Alignment(-1.0, 0.0),
    end: new Alignment(1.0, 0.0),
  );
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(seconds: 2), vsync: this, value: 0);
    animation = _tween.animate(controller);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void start(bool isRight) {
    this._offset = isRight ? 500 : -500;
    this
        .controller
        .animateTo(1, duration: Duration(milliseconds: 500))
        .then((v) {
      print("oke");
      this.controller.reset();
      if (isRight) {
        this.widget.onRightPress();
      } else {
        this.widget.onLeftPress();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget animatedBuilder = AnimatedBuilder(
      animation: controller,
      child: this.widget.child,
      builder: (BuildContext context, Widget child) {
        return Transform.translate(
          offset: Offset(this._offset * controller.value, 0),
          child: Transform.rotate(
              angle: controller.value * -3.14 / 12.0, child: child),
        );
      },
    );

    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Expanded(child: animatedBuilder),
          Expanded(
            flex: 1,
            child: ExpandedColumnWidget(
              children: <Widget>[
                Expanded(
                    child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () => this.start(false),
                  child: this.widget.onLeft,
                )),
                Expanded(
                    child: InkWell(
                        onTap: () {
                          this.start(true);
                        },
                        child: this.widget.onRight))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
