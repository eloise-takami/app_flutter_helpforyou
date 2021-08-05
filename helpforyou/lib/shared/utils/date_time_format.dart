class DateTimeFormat {
  static String dateAndTime(DateTime dt) =>
      '${twoDigits(dt.day)}/${twoDigits(dt.month)}/${dt.year} ${dt.hour}:${dt.minute}';

  static String twoDigits(int i) => i < 10 ? '0$i' : '$i';
}
