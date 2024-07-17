import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../presentation/login_screen/login_screen.dart'; // Sesuaikan dengan file tempat LoginScreen Anda berada

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Setelah 3 detik, navigasi ke halaman LoginScreen
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    });

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 22.h,
            vertical: 72.v,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 80.v),
              CustomImageView(
                imagePath: ImageConstant.imgPaperMapBro3,
                height: 296.v,
                width: double.maxFinite,
                margin: EdgeInsets.only(right: 10.h),
              ),
              SizedBox(height: 22.v),
              Text(
                "Solusi lacak lokasi secara Real-time",
                style: CustomTextStyles.titleSmallWhiteA700,
              ),
              Spacer(),
              Text(
                "Tracelt",
                style: theme.textTheme.headlineSmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}