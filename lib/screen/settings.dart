import 'package:birth_calculateir/model/themmodle/thme.dart';
import 'package:birth_calculateir/model/urllauncher.dart';
import 'package:birth_calculateir/model/appbar.dart';
import 'package:birth_calculateir/youtals/factory_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:birth_calculateir/screen/user.dart';
import 'package:provider/provider.dart';
import 'homebage.dart';

class Settings extends StatefulWidget {
  @override
  SettingsState createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  ThemeChanger _theme;

  bool ched = false;

  TextStyle _style = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  var aswitch = Factory();
  var iconsSher = UrlLauncher();
  var userName = UserState.conteroller.text;
  var old = HomeState.old;
  var app = App();
  @override
  Widget build(BuildContext context) {
    //الماثود الخاص لبناء صفحة الاعادات
    ThemeChanger theme = Provider.of<ThemeChanger>(context);
    this._theme = theme;
    var userHeader = buildHeaderUser();
    var line = buildUnderLine();

    var buttonThem = buildListSettings1();
    var about = buildAbout();
    var icons = buildRowIcons();
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            child: ListView(
              children: [
                userHeader,
                buttonThem,
                line,
                about,
                icons,
              ],
            ),
          ),
        ));
  }

  Widget buildUnderLine() {
    return Divider(
      color: Colors.blueGrey,
      indent: 50,
    );
  }

  Widget buildHeaderUser() {
    return Container(
      color: Theme.of(context).primaryColor,
      child: DrawerHeader(
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).accentColor,
              maxRadius: 40,
              child: Icon(Icons.person),
            ),
            Text(userName),
            Text('${HomeState.theAge.ages}:العمر الحالي ')
          ],
        ),
      ),
    );
  }

  Widget buildRowIcons() {
    return Container(
      height: 130,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [buildIconsCall(), buildIconsSms(), buildIconsEmail()],
      ),
    );
  }

  Widget buildIconsCall() {
    return Container(
      child: IconButton(
          icon: Icon(Icons.call),
          onPressed: () {
            iconsSher.launchURL('tel:0550873299');
          }),
    );
  }

  Widget buildIconsSms() {
    return Container(
      child: IconButton(
          icon: Icon(Icons.sms),
          onPressed: () {
            iconsSher.launchURL('sms:0550873299');
          }),
    );
  }

  Widget buildIconsEmail() {
    return Container(
      child: IconButton(
          icon: Icon(Icons.email),
          onPressed: () {
            iconsSher.launchURL('mailto:0567405245g@gmail.com');
          }),
    );
  }

  Widget buildListSettings1() {
    if (_theme.getTheme() == Factory.dark()) {
      ched = true;
    }

    return Column(
      children: [
        ListTile(
          title: Text(
            'النمط',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: Icon(Icons.color_lens),
          trailing: Switch(
              activeColor: Theme.of(context).primaryColor,
              value: ched,
              onChanged: (val) {
                setState(() {
                  if (ched == true) {
                    _theme.setTheme(Factory.light());
                  }

                  if (ched == false) {
                    _theme.setTheme(Factory.dark());
                  }

                  ched = !ched;
                });
              }),
        ),
      ],
    );
  }

  Widget buildAbout() {
    return Container(
      height: 150,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: ExpansionTile(
        leading: Icon(Icons.info_outline),
        title: Text(
          'حول',
          style: _style,
        ),
        children: [
          Container(
              child: Text(
            'معلومات عن البرنامج',
          )),
          buildUnderLine(),
          Container(
              child:
                  Text('البرنامج خاص لمعرفة عمرك الحالي وتاريخ ميلادك القادم'))
        ],
      ),
    );
  }
}
