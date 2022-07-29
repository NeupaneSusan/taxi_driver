

import 'package:flutter/material.dart';

// import 'package:provider/provider.dart';
// import 'package:texidriver/page/component/nointernetdialog_page.dart';
// import 'package:texidriver/provider/map_provider.dart';

class TimeCounterController extends ChangeNotifier {
  int _remainingTime = 90;
  get remainingTime => _remainingTime;
  set setRemainingTime(int val) {
    _remainingTime = val;
    notifyListeners();
  }

  updateRemainingTime() {
    if (_remainingTime != 0) {
      _remainingTime--;
      notifyListeners();
    }
  }
}

