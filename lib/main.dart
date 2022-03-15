import 'package:flutter/material.dart';
import 'package:luga_fataa/dyfas_theme.dart';
import 'package:provider/provider.dart';
import 'Model/models.dart';
import 'navigation/app_route_parser.dart';
import 'navigation/app_router.dart';
import 'package:logging/logging.dart';


void main() {
  _setupLogging();
  runApp(MyApp());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  final theme = DyfasTheme.dark();
  final _appStateManager = AppStateManager();
  final _basketManager = BasketManager();
  final _favoriteManager = FavoriteManager();
  final _userManager = UserManager();
  final routeParser = AppRouteParser();
  late AppRouter _appRouter;



  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter(
      appStateManager: _appStateManager,
      basketManager: _basketManager,
      favoriteManager: _favoriteManager,
      userManager: _userManager,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => _basketManager,
        ),
        ChangeNotifierProvider(
          create: (context) => _favoriteManager,
        ),
        ChangeNotifierProvider(
          create: (context) => _appStateManager,
        ),
        ChangeNotifierProvider(
          create: (context) => _userManager,
        ),

        // TODO: Add AppStateManager ChangeNotifierProvider
      ],
      child: Consumer<UserManager>(
        builder: (context, profileManager, child) {
          ThemeData theme;
          if (profileManager.darkMode) {
            theme = DyfasTheme.dark();
          } else {
            theme = DyfasTheme.light();
          }

          return MaterialApp.router(
            theme: theme,
            title: 'DayaFas',
            backButtonDispatcher: RootBackButtonDispatcher(),
            // 1
            routeInformationParser: routeParser,
            // 2
            routerDelegate: _appRouter,
          );
        },
      ),
    );
  }
}
