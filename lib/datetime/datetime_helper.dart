String convertDateTimeToString(DateTime dateTime){
  String day = dateTime.day.toString().padLeft(2,'0');
  String month = dateTime.month.toString().padLeft(2,'0');
  String year = dateTime.year.toString();

  return "$day/$month/$year";
}