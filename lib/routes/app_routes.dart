import 'package:flutter/material.dart';
import '../presentation/add_location_screen/add_location_screen.dart';
import '../presentation/aktifkan_live_one_screen/aktifkan_live_one_screen.dart';
import '../presentation/aktifkan_live_screen/aktifkan_live_screen.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/hentikan_live_screen/hentikan_live_screen.dart';
import '../presentation/homepage_screen/homepage_screen.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/register_screen/register_screen.dart';
import '../presentation/welcome_screen/welcome_screen.dart';

// ignore_for_file: must_be_immutable
class AppRoutes {
  static const String welcomeScreen = '/welcome_screen';

  static const String loginScreen = '/login_screen';

  static const String registerScreen = '/register_screen';

  static const String homepageScreen = '/homepage_screen';

  static const String addLocationScreen = '/add_location_screen';

  static const String aktifkanLiveScreen = '/aktifkan_live_screen';

  static const String hentikanLiveScreen = '/hentikan_live_screen';

  static const String aktifkanLiveOneScreen = '/aktifkan_live_one_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    welcomeScreen: (context) => WelcomeScreen(),
    loginScreen: (context) => LoginScreen(),
    registerScreen: (context) => RegisterScreen(),
    homepageScreen: (context) => HomepageScreen(),
    addLocationScreen: (context) => AddLocationScreen(),
    aktifkanLiveScreen: (context) => AktifkanLiveScreen(),
    hentikanLiveScreen: (context) => HentikanLiveScreen(),
    aktifkanLiveOneScreen: (context) => AktifkanLiveOneScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    initialRoute: (context) => WelcomeScreen(),
  };
}
