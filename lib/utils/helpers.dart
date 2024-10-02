// helper function to formate the time ex==> 60s = 01:00
String timeFormate(int time) {
  int sec = time % 60;
  int min = (time / 60).floor();
  String minute = min.toString().length <= 1 ? '0$min' : '$min';
  String seconds = sec.toString().length <= 1 ? '0$sec' : '$sec';
  return '$minute : $seconds';
}
