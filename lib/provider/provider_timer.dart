import 'package:flutter/foundation.dart';

class ProviderTimer with ChangeNotifier{
  String _time = '00:00:01';
  //setter
  set timer (String time){
    _time = time;
    notifyListeners();
  }
  //getter
  String get time => _time;
}