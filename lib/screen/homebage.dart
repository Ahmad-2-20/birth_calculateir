import 'package:birth_calculateir/model/appbar.dart';
import 'package:birth_calculateir/model/calculetmodal.dart';
import 'package:birth_calculateir/model/nextbirth.dart';
import 'package:birth_calculateir/model/theage.dart';
import 'package:birth_calculateir/youtals/reformat.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  DateTime timeNow = DateTime.now();
  DateTime birthDayValue;
  static var old;
  DateTime todayValue;
  var calculate = Calculate();
  var textEditingController1 = TextEditingController();
  var textEditingController2 =
      TextEditingController(text: ReFormatDate.reFormat(DateTime.now()));
  var nextBirth = NextBirth();
  static var theAge = TheAge();
  var app = App();
  ////////////////////////////
  double widthSize = 120;
  double heightSize = 50;
  double fonHeightSize = 20;
  @override
  Widget build(BuildContext context) {
    //الماثواد الخاصة لصفحة الرائسية للبرنامج
    Widget space = _buildSub();
    Widget dateOfBirth = _buildSubTitle('تاريخ الميلاد');
    Widget toDayDate = _buildSubTitle('تاريخ اليوم ');
    Widget text = _buildTextField();
    Widget text2 = _buildTextField2();
    Widget row = _buildRowBottun();
    Widget ageIs = _buildSubTitle('عمرك هو');
    Widget rowContaineData1 = _buildRowContainerData1();
    Widget nextDayBirth = _buildSubTitle('يوم ميلادك القادم');
    Widget rowContaineData2 = _buildRowContainerData2();
    return Scaffold(
      //
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                space,
                dateOfBirth,
                text,
                space,
                toDayDate,
                text2,
                row,
                ageIs,
                rowContaineData1,
                nextDayBirth,
                rowContaineData2
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          )),
    );
  }

  Widget _buildSub() {
    //الماثاود للمسافة
    return SizedBox(
      height: 25,
    );
  }

  Widget _buildSubTitle(String text) {
    return Text(
      //الماثاود الحخاصة بالعناوين في البرنامج
      text,
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
    );
  }

  Widget _buildTextField() {
    //الماثواد الخاصة باجمال الادخال

    return TextField(
      controller: textEditingController1,
      decoration: _buildDecoration(),
      textDirection: TextDirection.rtl,
      onTap: () {
        showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1940),
                lastDate: DateTime.now())
            .then((value) {
          birthDayValue = value;
          setState(() {
            textEditingController1.text = ReFormatDate.reFormat(birthDayValue);
          });
          print(birthDayValue);
        });
      },
      readOnly: true,
    );
  }

  Widget _buildTextField2() {
    //الماثواد الخاصة بجمال الادخال
    return TextField(
      controller: textEditingController2,
      decoration: _buildDecoration(),
      textDirection: TextDirection.rtl,
      onTap: () {
        showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1940),
                lastDate: DateTime.now())
            .then((value) {
          todayValue = value;
          setState(() {
            textEditingController2.text = ReFormatDate.reFormat(todayValue);
          });
          print(todayValue);
        });
      },
      readOnly: true,
    );
  }

  InputDecoration _buildDecoration() {
    //الماثواد الخاصة للتعديل في شكل الماثواد الخاصة لجمال الادخال الاولى
    return InputDecoration(
      prefixIcon: Icon(
        Icons.date_range,
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 20),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
    );
  }

  Widget _buildRowBottun() {
    var color = MaterialStateProperty.all(Theme.of(context).primaryColor);
    //الماثواد الخاصة للازرا المسح وحساب الاعمار
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              width: widthSize,
              height: heightSize,
              child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: color),
                  onPressed: () {
                    setState(() {
                      theAge =
                          calculate.ageCalculate(birthDayValue, todayValue);
                      nextBirth = calculate.calculateBirthNext(
                          birthDayValue, todayValue);
                    });
                  },
                  child: Text(
                    'احسب العمر',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: fonHeightSize),
                  ))),
          Container(
              width: widthSize,
              height: heightSize,
              child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: color),
                  onPressed: () {
                    setState(() {
                      theAge = TheAge();
                      nextBirth = NextBirth();
                      textEditingController1.text = "";
                    });
                  },
                  child: Text(
                    'مسح',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: fonHeightSize),
                  )))
        ],
      ),
    );
  }

  Widget _buildContainerData(String text2, String text1) {
    //الماثواد للصوفوف الاخيرا في البارنامج للعناوين
    return Container(
      child: Column(
        children: [
          Container(
            height: heightSize,
            width: widthSize,
            child: Card(
              color: Theme.of(context).primaryColor,
              child: Center(
                  child: Text(
                text2,
                style: TextStyle(
                    fontSize: fonHeightSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
            ),
          ),
          Container(
            height: heightSize,
            width: widthSize,
            child: Card(
              child: Center(
                  child: Text(
                text1,
                style: TextStyle(
                    fontSize: fonHeightSize, fontWeight: FontWeight.bold),
              )),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRowContainerData1() {
    //الماثواد الخاصة لصف العمر الحالي
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildContainerData(
          'العمر',
          theAge.ages.toString(),
        ),
        _buildContainerData('الشهر', theAge.months.toString()),
        _buildContainerData('اليوم', theAge.days.toString()),
      ],
    );
  }

  Widget _buildRowContainerData2() {
    //الماثواد الخاصة للصف يوم الميلاد القادم
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildContainerData(nextBirth.months.toString(), 'الشهر'),
        _buildContainerData(nextBirth.days.toString(), 'اليوم'),
      ],
    );
  }
}
