import 'package:day/day.dart';
import 'package:queen_slim/constants/index.dart';

class DateUtil {
  static String todayFormat() {
    return Day().toLocal().format(Constants.DATE_FORMAT_YYYYMMDD);
  }

  static String todayFormatWithSlashSeparator() {
    return Day().toLocal().format(Constants.DATE_FORMAT_YYYYMMDD_PAGE);
  }
}
