import 'package:flutter/material.dart';

class MovieCardWidget extends StatefulWidget {
  MovieCardWidget({Key key, @required this.child, this.onPressed})
      : super(key: key);

  final Widget child;
  final Function onPressed;

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
          Wrap(
            spacing: 10,
            children: <Widget>[
              RaisedButton(
                child: Icon(
                  Icons.favorite,
                  color: Colors.pink,
                ),
                onPressed: () {
                  this._offset = 500;
                  this
                      .controller
                      .animateTo(1, duration: Duration(milliseconds: 500))
                      .then((v) {
                    print("oke");
                    this.controller.reset();
                    this.widget.onPressed();
                  });
                },
              ),
              RaisedButton(
                child: Icon(Icons.arrow_right),
                onPressed: () {
                  this._offset = -500;
                  this
                      .controller
                      .animateTo(1, duration: Duration(milliseconds: 500))
                      .then((v) {
                    print("oke");
                    this.controller.reset();
                  });
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
