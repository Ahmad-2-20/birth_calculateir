import 'package:age/age.dart';
import 'package:birth_calculateir/model/theage.dart';
import 'nextbirth.dart';

class Calculate {
  var _age = TheAge();
  var birth = NextBirth();
  TheAge ageCalculate(DateTime birthday, DateTime today) {
    //الماثواد الخاصة لحساب العمر في البرنامج
    AgeDuration age;
    // Find out your age
    age = Age.dateDifference(
        fromDate: birthday, toDate: today, includeToDate: false);

    print('Your age is $age');
    _age.ages = age.years;
    _age.months = age.months;
    _age.days = age.days;
    return _age;
  }

  NextBirth calculateBirthNext(DateTime birthday, DateTime today) {
    //الماثواد الخاصة لحساب يوم الميلاد

    DateTime tempDate = DateTime(today.year, birthday.month, birthday.day);
    DateTime nextBirthdayDate = tempDate.isBefore(today)
        ? Age.add(date: tempDate, duration: AgeDuration(years: 1))
        : tempDate;

    AgeDuration nextBirthdayDuration =
        Age.dateDifference(fromDate: today, toDate: nextBirthdayDate);

    print(
        'You next birthday will be on $nextBirthdayDate or in $nextBirthdayDuration');
    birth.ages = nextBirthdayDuration.years;
    birth.months = nextBirthdayDuration.months;
    birth.days = nextBirthdayDuration.days;

    return birth;
  }
}
