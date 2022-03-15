import 'dart:async';

import 'package:flutter/material.dart';

import 'app_cache.dart';

class DYFasTab {
  static const int home = 0;
  static const int basket = 1;
  static const int favorite = 2;
  static const int user = 3;
}

class AppStateManager extends ChangeNotifier {
  bool _initialized = false;
  // 3
  bool _loggedIn = false;
  // 4
  bool _onboardingComplete = false;
  // 5
  int _selectedTab = DYFasTab.home;

  final _appCache = AppCache();

  // 6
  bool get isInitialized => _initialized;
  bool get isLoggedIn => _loggedIn;
  bool get isOnboardingComplete => _onboardingComplete;
  int get getSelectedTab => _selectedTab;

  Future<void> initializeApp() async {
    // 7
    _loggedIn = await _appCache.isUserLoggedIn();
    _onboardingComplete = await _appCache.didCompleteOnboarding();

    Timer(const Duration(milliseconds: 2000), () {
      // 8
      _initialized = true;
      // 9
      notifyListeners();
    },
    );
  }

 void login(String username, String password) async {
    // 10
    _loggedIn = true;
    await _appCache.cacheUser();
    notifyListeners();
  }

  void completeOnboarding() async{
    _onboardingComplete = true;
    await _appCache.completeOnboarding();
    notifyListeners();
  }

  void goToTab(index) {
    _selectedTab = index;
    notifyListeners();
  }

  void logout() async{
    // 12
    _initialized = false;
    _selectedTab = 0;
    await _appCache.invalidate();
    // 13
    initializeApp();
    // 14
    notifyListeners();
  }


}
