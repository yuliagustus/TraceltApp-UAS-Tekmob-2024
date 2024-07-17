import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tracelt_app/presentation/login_screen/login_screen.dart';
import 'core/app_export.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Inisialisasi Firebase
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  ThemeHelper().changeTheme('primary');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme,
          title: 'tracelt_app',
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey:
              globalMessengerKey, // Menambahkan global key untuk ScaffoldMessenger
          initialRoute: AppRoutes.initialRoute,
          routes: {
            ...AppRoutes.routes,
            '/login': (context) =>
                LoginScreen(), // Contoh penambahan rute untuk halaman login
          },
        );
      },
    );
  }
}