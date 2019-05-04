import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  List<Widget> cardList;
  double x = 0;
  double y = 0;

  void _removeCard(index) {
    setState(() {
      cardList.removeAt(index);
    });
  }

  Tween _tween = new AlignmentTween(
    begin: new Alignment(-1.0, 0.0),
    end: new Alignment(1.0, 0.0),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cardList = _getMatchCard();
    controller = AnimationController(
        duration: const Duration(seconds: 1), vsync: this, value: 0);
    animation = _tween.animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var animatedBuilderKK = AnimatedBuilder(
      animation: controller,
      child: Align(alignment: animation.value, child: cardList.first),
      builder: (BuildContext context, Widget child) {
        return Transform.translate(
          offset: Offset(-500 * controller.value, 0),
          child: Transform.rotate(
              angle: controller.value * -3.14 / 12.0, child: child),
        );
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(child: animatedBuilderKK),
            RaisedButton(
              onPressed: () {
                // Animation<Offset> moveLeftToCenter = new Tween(
                //         begin: new Offset(0.0, 500 / 2),
                //         end: new Offset(100 / 2, 500 / 2))
                //     .animate(controller);

                this
                    .controller
                    .animateTo(1, duration: Duration(seconds: 1))
                    .then((v) {
                  print("oke");
                  this.controller.reset();
                });
                // setState(() {
                //   // cardList.removeAt(index);
                //   x = 0;
                //   y = 50;
                // });
              },
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _getMatchCard() {
    // var controllerX = AnimationController(
    //     duration: const Duration(seconds: 1), vsync: this, value: 0);
    // var animatedBuilderKK = AnimatedBuilder(
    //   animation: controllerX,
    //   child: Container(
    //     width: 300,
    //     height: 500,
    //   ),
    //   builder: (BuildContext context, Widget child) {
    //     return Transform.translate(
    //       offset: Offset(-500 * controller.value, 0),
    //       child: Transform.rotate(
    //           angle: controller.value * -3.14 / 12.0, child: child),
    //     );
    //   },
    // );
    List<MatchCard> cards = new List();
    cards.add(MatchCard(255, 0, 0, 10));
    cards.add(MatchCard(0, 255, 0, 20));
    cards.add(MatchCard(0, 0, 255, 30));

    List<Widget> cardList = new List();
    var y = 3;
    for (int x = 0; x < y; x++) {
      cardList.add(
        Container(
          child: Card(
            elevation: 12,
            color: Color.fromARGB(255, cards[x].redColor, cards[x].greenColor,
                cards[x].blueColor),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              width: 300,
              height: 500,
            ),
          ),
        ),
      );
    }

    return cardList;
  }
}

class MatchCard {
  int redColor = 0;
  int greenColor = 0;
  int blueColor = 0;
  double margin = 0;

  MatchCard(int red, int green, int blue, double marginTop) {
    redColor = red;
    greenColor = green;
    blueColor = blue;
    margin = marginTop;
  }
}
