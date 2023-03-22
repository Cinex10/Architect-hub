import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get getTimeElapsedEnglish {
    Duration difference = DateTime.now().difference(this);
    if (difference.inDays > 0) {
      return "${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago";
    } else if (difference.inHours > 0) {
      return "${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago";
    } else if (difference.inMinutes > 0) {
      return "${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago";
    } else {
      return "Just now";
    }
  }

  String get getTimeElapsedArabic {
    Duration difference = DateTime.now().difference(this);
    if (difference.inDays > 0) {
      return "منذ ${difference.inDays} يوم";
    } else if (difference.inHours > 0) {
      return "منذ ${difference.inHours} ساعة";
    } else if (difference.inMinutes > 0) {
      return "منذ ${difference.inMinutes} دقيقة";
    } else {
      print(difference);
      return "الآن";
    }
  }

  String get yyyyMMMdd {
    return DateFormat('yyyy MMM dd').format(this);
  }

  String get yMd {
    return DateFormat.yMd().format(this);
  }

  // ignore: non_constant_identifier_names
  String get yyyy_MM_dd {
    return DateFormat('yyyy-MM-dd').format(this);
  }
}
