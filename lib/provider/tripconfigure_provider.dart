import 'package:flutter/material.dart';

class TripConfigureProvider with ChangeNotifier {
  int _tripStatus = 0;
  bool _isArrived = true;
  bool _isDestination = false;

  //0 means reject;
  // 1 means accept;
  // 2 means arrived;
  // 3 means start trip;
  // 4 mena end trip;
  void setStatus(int value) {
    _tripStatus = value;
    notifyListeners();
  }

  void setisArrived(bool val) {
    _isArrived = val;
    notifyListeners();
  }

  void setisDestination(bool val) {
    _isDestination = val;
    notifyListeners();
  }

  int get tripStatus => _tripStatus;
  bool get isArrived => _isArrived;
  bool get isDestination => _isDestination;

  void clear() {
    _tripStatus = 0;
    _isArrived = true;
    _isDestination = false;
    notifyListeners();
  }
}
