import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../hentikan_live_one_dialog/hentikan_live_one_dialog.dart';
import '../izinkan_akses_dialog/izinkan_akses_dialog.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0XFFFFFFFF),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10.v),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      child: Text(
                        "App Navigation",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0XFF000000),
                          fontSize: 20.fSize,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.v),
                    Padding(
                      padding: EdgeInsets.only(left: 20.h),
                      child: Text(
                        "Check your app's UI from the below demo screens of your app.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0XFF888888),
                          fontSize: 16.fSize,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.v),
                    Divider(
                      height: 1.v,
                      thickness: 1.v,
                      color: Color(0XFF000000),
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          context,
                          screenTitle: "welcome screen",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.welcomeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Login",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.loginScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Register",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.registerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Izinkan akses - Dialog",
                          onTapScreenTitle: () =>
                              onTapDialogTitle(context, IzinkanAksesDialog()),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Homepage",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.homepageScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "add location",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.addLocationScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "aktifkan live ",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.aktifkanLiveScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "hentikan live ",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.hentikanLiveScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "hentikan live One - Dialog",
                          onTapScreenTitle: () => onTapDialogTitle(
                              context, HentikanLiveOneDialog()),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "aktifkan live One",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.aktifkanLiveOneScreen),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Common click event for dialog
  void onTapDialogTitle(
    BuildContext context,
    Widget className,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: className,
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.zero,
        );
      },
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle?.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: theme.colorScheme.onSurface,
                      size: 24.h,
                    ),
                  ),
                  Text(
                    screenTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0XFF000000),
                      fontSize: 20.fSize,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 24.h), // Spacer
                ],
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            )
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(
    BuildContext context,
    String routeName,
  ) {
    Navigator.pushNamed(context, routeName);
  }
}
