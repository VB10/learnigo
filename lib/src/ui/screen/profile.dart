import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var stackHeader = Stack(children: <Widget>[
      Container(
        height: 400,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(200)),
            gradient: LinearGradient(
              // 10% of the width, so there are ten blinds.
              colors: [
                const Color.fromRGBO(144, 39, 252, 1),
                const Color.fromRGBO(117, 20, 186, 1)
              ], // whitish to gray
              tileMode: TileMode.repeated,
            ),
            color: Colors.red),
      ),
      Container(
        alignment: Alignment.center,
        height: 400,
        child: SizedBox(
          height: 150,
          width: 150,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.asset(
              "lib/assets/profile.png",
            ),
          ),
        ),
      )
    ]);
    var buttonsGroup = Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Container(
            child: Card(
              color: Colors.green[300],
              child: ListTile(
                title: Text(
                  "Başarılı",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Text("30"),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: Card(
              color: Colors.red[300],
              child: ListTile(
                title: Text(
                  "Hatalı",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Text("25"),
              ),
            ),
          ),
        ),
      ],
    );
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            stackHeader,
            SizedBox(
              height: 30,
            ),
            Text("Veli Bacık",
                style: const TextStyle(
                    color: const Color(0xff191660),
                    fontWeight: FontWeight.w500,
                    fontFamily: "Google Sans",
                    fontStyle: FontStyle.normal,
                    fontSize: 30.5)),
            SizedBox(
              height: 30,
            ),
            buttonsGroup,
            SizedBox(
              height: 30,
            ),
            Container(
              height: 100,
              width: 200,
              color: Colors.red,
              child: RaisedButton(
                color: const Color.fromRGBO(144, 39, 252, 1),
                onPressed: () {},
                child: Icon(
                  Icons.exit_to_app,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
