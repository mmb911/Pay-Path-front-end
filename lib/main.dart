//ATTENTION!!!!!
/*
1. Please refer to lib/constants/global_constants.dart
2. Refer to lib/widgets to see custom made widgets that were used throughout the app.
3. Refer to lib/router.dart to see the navigation routes for the app
4. Refer to lib/providers/user_provider to see app's state manager for the users data
5. Refer to money_transfer_server to see the nodejs code controlling the backend
*/


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:paypath_last/config/routes/custom_push_navigators.dart';
import 'package:paypath_last/config/routes/router.dart';
import 'package:paypath_last/config/theme/theme_manager.dart';
import 'package:paypath_last/core/utils/utils.dart';
import 'package:paypath_last/features/auth/providers/auth_provider.dart';
import 'package:paypath_last/features/auth/providers/user_provider.dart';
import 'package:paypath_last/features/auth/screens/login_pin_screen.dart';
import 'package:paypath_last/features/auth/screens/login_screen.dart';
import 'package:paypath_last/features/auth/services/auth_service.dart';
import 'package:paypath_last/features/onboarding/screens/onboarding_screen.dart';
import 'package:paypath_last/initialization_screen.dart';
import 'package:paypath_last/no_internet_screen.dart';

import 'package:provider/provider.dart';

import 'widgets/main_app.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  static const String route = "/my-app";
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeManager themeManager = ThemeManager();
  final AuthService authService = AuthService();
  late Future _future;
  bool check = true;

  @override
  void initState() {
    super.initState();
    _future = obtainTokenAndUserData(context);
    checkInternetConnection();
    //AwesomeNotifications().requestPermissionToSendNotifications();
  }

  obtainTokenAndUserData(BuildContext context) async {
    await authService.obtainTokenAndUserData(context);
  }

  checkInternetConnection() async {
    check = await InternetConnectionChecker().hasConnection;
    return check;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    final user = Provider.of<UserProvider>(context).user;
    return MaterialApp(
      theme: themeManager.lightTheme,
      darkTheme: themeManager.lightTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => appRoutes(settings),
      home: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return check == true
                ? user.isVerified != false
                ? user.token.isNotEmpty
                ? user.pin.isNotEmpty
                ? const LoginPinScreen()
                : MainApp(
              currentPage: 0,
            )
                : const OnBoardingScreen()
                : const LoginScreen()
                : NoInternetScreen(onTap: () {
              checkInternetConnection();
              print("check: $check");
              obtainTokenAndUserData(context);
              if (check == true) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  MyApp.route,
                      (route) => false,
                );
              } else {
                showDialogLoader(context);
                Future.delayed(const Duration(seconds: 5), () {
                  popNav(context);
                });
              }
            });
          } else {}

          return const InitializationScreen();
        },
      ),
    );
  }
}
