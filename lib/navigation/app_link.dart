class AppLink {
  // 1
  static const String homePath = '/home';
  static const String onboardingPath = '/onboarding';
  static const String loginPath = '/login';
  static const String profilePath = '/profile';
  static const String itemPath = '/item';
  // 2
  static const String tabParam = 'tab';
  static const String idParam = 'id';
  // 3
  String? location;
  // 4
  int? currentTab;
  // 5
  String? itemId;
  // 6
  AppLink({
    this.location,
    this.currentTab,
    this.itemId,
  });

// TODO: Add fromLocation
  static AppLink fromLocation(String? location) {
    // 1
    location = Uri.decodeFull(location ?? '');
    print(location);
    // 2
    final uri = Uri.parse(location);
    print(uri);
    final params = uri.queryParameters;
    print(params);
    // 3
    final currentTab = int.tryParse(params[AppLink.tabParam] ?? '');
    print(currentTab);
    // 4
    final itemId = params[AppLink.idParam];
    // 5
    final link = AppLink(
      location: uri.path,
      currentTab: currentTab,
      itemId: itemId,
    );
    // 6
    print(link.location);
    return link;
  }


// TODO: Add toLocation

  String toLocation() {
    // 1
    String addKeyValPair({
      required String key,
      String? value,
    }) =>
        value == null ? '' : '${key}=$value&';
    // 2
    switch (location) {
    // 3
      case loginPath:
        return loginPath;
    // 4
      case onboardingPath:
        return onboardingPath;
    // 5
      case profilePath:
        return profilePath;
    // 6
      case itemPath:
        var loc = '$itemPath?';
        loc += addKeyValPair(
          key: idParam,
          value: itemId,
        );
        return Uri.encodeFull(loc);
    // 7
      default:
        var loc = '$homePath?';
        loc += addKeyValPair(
          key: tabParam,
          value: currentTab.toString(),
        );
        return Uri.encodeFull(loc);
    }
  }


}
