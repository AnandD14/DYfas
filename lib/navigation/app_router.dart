import 'package:flutter/material.dart';

import '../Model/models.dart';
import '../screen/screens.dart';
import 'app_link.dart';

// 1
class AppRouter extends RouterDelegate<AppLink>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  // 2
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  // 3
  final AppStateManager appStateManager;
  final BasketManager basketManager;
  final FavoriteManager favoriteManager;
  final UserManager userManager;

  AppRouter({
    required this.appStateManager,
    required this.basketManager,
    required this.favoriteManager,
    required this.userManager

  })
      : navigatorKey = GlobalKey<NavigatorState>() {
    // TODO: Add Listeners
    appStateManager.addListener(notifyListeners);
    basketManager.addListener(notifyListeners);
    favoriteManager.addListener(notifyListeners);
    userManager.addListener(notifyListeners);

  }

  // TODO: Dispose listeners
  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    basketManager.removeListener(notifyListeners);
    favoriteManager.removeListener(notifyListeners);
    userManager.addListener(notifyListeners);
    super.dispose();
  }

  // 6
  @override
  Widget build(BuildContext context) {
    // 7
    return Navigator(
      // 8
      key: navigatorKey,
      // TODO: Add onPopPage
      onPopPage: _handlePopPage,
      // 9
      pages: [
        // TODO: Add SplashScreen
        if (!appStateManager.isInitialized) SplashScreen.page(),
        // TODO: Add LoginScreen
        if (appStateManager.isInitialized && !appStateManager.isLoggedIn)
          LoginScreen.page(),
        // TODO: Add OnboardingScreen
        if (appStateManager.isLoggedIn && !appStateManager.isOnboardingComplete)
          OnboardingScreen.page(),
        // TODO: Add Home
        if (appStateManager.isOnboardingComplete)
          HomeScreen.page(appStateManager.getSelectedTab),
        // TODO: Create new item
        // TODO: Select GroceryItemScreen
        // TODO: Add Profile Screen
        // TODO: Add WebView Screen
      ],
    );
  }

  bool _handlePopPage(
      // 1
      Route<dynamic> route,
      // 2
      result) {
    // 3
        if (!route.didPop(result)) {
      // 4
          return false;
        }

    // 5
    // TODO: Handle Onboarding and splash
        if (route.settings.name == DyFasPages.onboardingPath) {
          appStateManager.logout();
        }


      return true;
    }

  AppLink getCurrentPath() {
    // 1
    if (!appStateManager.isLoggedIn) {
      return AppLink(location: AppLink.loginPath);
      // 2
    } else if (!appStateManager.isOnboardingComplete) {
      return AppLink(location: AppLink.onboardingPath);
      // 3
    } else if (userManager.didSelectUser) {
      return AppLink(location: AppLink.profilePath);
      // 4
    } /*else if (userManager.isCreatingNewItem) {
      return AppLink(location: AppLink.itemPath);
      // 5
    } else if (userManager.selectedGroceryItem != null) {
      final id = groceryManager.selectedGroceryItem?.id;
      return AppLink(location: AppLink.itemPath, itemId: id);
      // 6
    } */else {
      return AppLink(
          location: AppLink.homePath,
          currentTab: appStateManager.getSelectedTab);
    }
  }

  @override
  AppLink get currentConfiguration => getCurrentPath();

  // 10
  @override
  Future<void> setNewRoutePath(AppLink newLink) async {
    // 2
    switch (newLink.location) {
    // 3
      case AppLink.profilePath:
        userManager.tapOnProfile(true);
        break;
    // 4
      case AppLink.itemPath:
      // 5
        final itemId = newLink.itemId;
     /*   if (itemId != null) {
          groceryManager.setSelectedGroceryItem(itemId);
        } else {
          // 6
          groceryManager.createNewItem();
        }*/
        // 7
       // userManager.tapOnProfile(false);
        break;
    // 8
      case AppLink.homePath:
      // 9
        appStateManager.goToTab(newLink.currentTab ?? 0);
        // 10
       // userManager.tapOnProfile(false);
       // groceryManager.groceryItemTapped(-1);
        break;
    // 11
      default:
        break;
    }
  }

}
