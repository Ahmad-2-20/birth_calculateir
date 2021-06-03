import 'package:birth_calculateir/screen/user.dart';
import 'package:flutter/material.dart';

class App {
  AppBar app(context) {
    return AppBar(
      //مثواد appbar وtabBar
      elevation: 0,
      actions: [
        IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => User()));
            })
      ],
      bottom: TabBar(
        indicatorWeight: 2,
        tabs: [Text('الرئسية'), Text('الاعادات ')],
      ),
      title: Center(
        child: Container(
            height: 70,
            width: 70,
            child: Image(
              image: AssetImage('images/background - Copy.png'),
            )),
      ),
    );
  }
}
