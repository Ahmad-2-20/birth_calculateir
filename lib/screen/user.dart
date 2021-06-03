import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'hometabs.dart';

class User extends StatefulWidget {
  @override
  UserState createState() => UserState();
}

class UserState extends State<User> {
  static var conteroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //الماثواد لتسجيل الدوخول
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [titel(), textField(), enterButon()],
    ));
  }

  Widget titel() {
    return Text(
      'اهلا وسهلا',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }

  Widget textField() {
    return Container(
      padding: EdgeInsets.only(bottom: 25, right: 25, left: 25),
      child: TextField(
        keyboardType: TextInputType.name,
        controller: conteroller,
        decoration: inputDecoration(),
      ),
    );
  }

  InputDecoration inputDecoration() {
    return InputDecoration(
        hintText: 'ادخل اسمك',
        contentPadding: EdgeInsets.symmetric(vertical: 20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        prefixIcon: Icon(Icons.person),
        hintStyle: TextStyle(fontWeight: FontWeight.bold));
  }

  Widget enterButon() {
    return Container(
      width: 200,
      height: 50,
      child: ElevatedButton(
          onPressed: () {
            if (conteroller.text.isNotEmpty) {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => HomeTabs())));
            }
          },
          child: Text(
            'التالي ',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(10),
            backgroundColor: MaterialStateColor.resolveWith(
                (states) => Theme.of(context).primaryColor),
          )),
    );
  }
}
