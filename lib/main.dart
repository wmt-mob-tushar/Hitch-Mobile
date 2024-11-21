import 'dart:io';

import 'package:hitech_mobile/redux/app_state.dart';
import 'package:hitech_mobile/redux/app_store.dart';
import 'package:hitech_mobile/screens/non_auth/login/login.dart';
import 'package:hitech_mobile/screens/splash/splash.dart';
import 'package:hitech_mobile/utils/navigation_service.dart';
import 'package:hitech_mobile/utils/routes.dart';
import 'package:hitech_mobile/utils/shared_pref_utils.dart';
import 'package:hitech_mobile/utils/notification_handler.dart';
import 'package:hitech_mobile/utils/connection_checker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (await FlutterJailbreakDetection.jailbroken) {
    exit(0);
  }
  await SharedPrefUtils.init();
  final store = await AppStore.init();
  runApp(MyApp(store: store));
}

class MyApp extends StatefulWidget {
  final Store<AppState> store;

  const MyApp({super.key, required this.store});

  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  /// Initialize the base notification handler
  /// Reminder: Don't forget to add the app icon for notifications
  /// and update the basic info before proceeding with further project setup.
  final NotificationHandler notificationHandler = NotificationHandler();

  /// Initialize the ConnectionChecker instance. This utility is used to monitor the device's internet connection status.
  /// Note:
  /// 1. Ensure to add the internet permission in the AndroidManifest.xml file for Android.
  /// 2. For iOS, add the internet permission in the Info.plist file.
  // final ConnectionChecker connectionChecker = ConnectionChecker();

  @override
  void initState() {
    super.initState();
  }

  final routes = {
    Routes.Splash: (context) => const Splash(),
    Routes.Login: (context) => const Login(),
  };

  Widget mainBuilder(_, __) {
    return OverlaySupport(
      child: StoreProvider<AppState>(
        store: widget.store,
        child: StoreConnector<AppState, String?>(
          builder: (context, String? selectedLocale) {
            return MaterialApp(
              navigatorKey: NavigationService.instance.navigationKey,
              initialRoute: Routes.Splash,
              onGenerateRoute: (settings) => routeCalled(settings),
              locale: Locale(selectedLocale ?? "en"),
              localizationsDelegates: const [
                AppLocalizations.delegate,
                ...GlobalMaterialLocalizations.delegates,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: const [Locale('en'), Locale("it")],

              /// Add Other language Locale her to use in app
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                useMaterial3: true,
              ),
            );
          },
          converter: (state) => state.state.selectedLocale,
        ),
      ),
    );
  }

  Route<dynamic>? routeCalled(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => routes[settings.name]!(context),
      settings: settings,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: mainBuilder,
      designSize: const Size(360, 690),

      /// Add your xd design size here
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
