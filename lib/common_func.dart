import 'package:intl/intl.dart';

class CommonFunc {
  static String datetimeToHuman(DateTime dateTime) {
    final DateFormat dateFormat = DateFormat("hh:m a E dd-MMM-yyyy");
    return dateFormat.format(dateTime);
    // return dateTime.hour.toString() +
    //     ":" +
    //     dateTime.minute.toString() +
    //     " " +
    //     dateTime.day.toString() +
    //     "/" +
    //     dateTime.month.toString() +
    //     "/" +
    //     dateTime.year.toString();
  }
}
