import 'package:flutter/material.dart';
import 'package:template/shared/types/app_bar_data.dart';

class AppBarController extends ChangeNotifier {
  AppBarData state = AppBarData();
  ScrollController? controller;

  String prevTitle = 'none';

  void setTitle(String? title) {
    prevTitle = state.title ?? 'none';
    state = AppBarData(
      leading: state.leading,
      centerTitle: state.centerTitle,
      pinned: state.pinned,
      title: title,
    );
    notifyListeners();
  }

  void setCenterTitle(bool value) {
    state = AppBarData(
        leading: state.leading,
        title: state.title,
        pinned: value,
        centerTitle: state.centerTitle);
    notifyListeners();
  }

  void setPinned(bool value) {
    state = AppBarData(
      leading: state.leading,
      title: state.title,
      pinned: value,
      centerTitle: state.centerTitle,
    );
    notifyListeners();
  }

  void setState(AppBarData newState) {
    state = newState;
    notifyListeners();
  }

  void update() {
    notifyListeners();
  }
}
