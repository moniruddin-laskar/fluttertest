import 'package:intl/intl.dart';

int daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day, from.hour, from.minute);
  to = DateTime(to.year, to.month, to.day, to.hour, to.minute);
  return (to.difference(from).inDays);
}

var hrsData;
var mintData;

class DateFonts {
  ///Dateformatter Variable
  static var newDate;

  ///Date Formatter
  static dateAndTimeFormatChanged(date) {
    // var d = date.split("").toString();
    newDate = DateFormat("d MMM, yyyy, HH:mm").format(
      DateTime.parse(
        date,
      ),
    );

    return newDate;
  }

  static dateFormatChanged(date) {
    // var d = date.split("").toString();
    newDate = DateFormat("d MMMM, yyyy").format(
      DateTime.parse(
        date,
      ),
    );

    return newDate;
  }

  static timeFormatChanged(date) {
    // var d = date.split("").toString();
    newDate = DateFormat("h:mm a").format(
      DateTime.parse(
        date,
      ),
    );

    return newDate;
  }

  static dateForDOB(date) {
    // var d = date.split("").toString();
    newDate = DateFormat("d MMM, yyyy").format(
      DateTime.parse(
        date,
      ),
    );

    return newDate;
  }

  static dateForAppointmentFetch(date) {
    // var d = date.split("").toString();
    newDate = DateFormat("yyyy-MM-dd").format(
      DateTime.parse(
        date,
      ),
    );

    return newDate;
  }

  static getOnlyHoursFromDate(date) {
    // var d = date.split("").toString();
    newDate = DateFormat("H").format(
      DateTime.parse(
        date,
      ),
    );

    return newDate;
  }

  static getOnlyMinutesFromDate(date) {
    // var d = date.split("").toString();
    newDate = DateFormat("m").format(
      DateTime.parse(
        date,
      ),
    );

    return newDate;
  }

  static appointmentEditDateFormat(date) {
    newDate = DateFormat("yyyy-MM-dd HH:mm:ss").format(
      DateTime.parse(
        date,
      ),
    );

    return newDate;
  }

  static onlyDayIntValueFormat(date) {
    newDate = DateFormat("d").format(
      DateTime.parse(
        date,
      ),
    );

    return newDate;
  }
}

bool eventCardVisible = false;

var mainContainerHeight;

double eventCardHeight = 260.0;
