import 'dart:io';
import 'package:birth_calculateir/model/appbar.dart';
import 'package:birth_calculateir/screen/settings.dart';
import 'package:flutter/material.dart';

import 'homebage.dart';

class HomeTabs extends StatefulWidget {
  @override
  HomeTabsState createState() => HomeTabsState();
}

class HomeTabsState extends State<HomeTabs> {
  @override
  var app = App();
  bool pop = true;
  Widget build(BuildContext context) {
    //الماثواد الخاصة لتحكم بصفحات البرنامج
    return WillPopScope(
      onWillPop: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('هل تريد الخروج من التطبيق ؟'),
                actions: [
                  ElevatedButton(onPressed: () => exit(0), child: Text('خروج')),
                  ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text('الغاء'))
                ],
                content: Text('هل انت متأكيد!'),
              )),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: app.app(context),
          body: TabBarView(
            children: [Home(), Settings()],
          ),
        ),
      ),
    );
  }
}
