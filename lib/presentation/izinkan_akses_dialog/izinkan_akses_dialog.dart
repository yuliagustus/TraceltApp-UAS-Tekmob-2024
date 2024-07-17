import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class IzinkanAksesDialog extends StatelessWidget {
  const IzinkanAksesDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 16.v),
          decoration: AppDecoration.fillWhiteA.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 12.v),
              CustomImageView(
                imagePath: ImageConstant.imgLinkedin,
                height: 30.v,
                width: 20.h,
                radius: BorderRadius.circular(10.h),
              ),
              SizedBox(height: 8.v),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "izinkan ",
                      style: theme.textTheme.bodyMedium,
                    ),
                    TextSpan(
                      text: "google_maps_live \n",
                      style: theme.textTheme.titleSmall,
                    ),
                    TextSpan(
                      text: "mengakses lokasi perangkat ini?",
                      style: theme.textTheme.bodyMedium,
                    )
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.v),
              SizedBox(
                width: double.maxFinite,
                child: Divider(),
              ),
              SizedBox(height: 14.v),
              GestureDetector(
                onTap: () {
                  // Navigate to homepage if permission is allowed
                  Navigator.of(context)
                      .pushReplacementNamed('/homepage_screen');
                },
                child: Text(
                  "izinkan hanya saat menggunakan aplikasi",
                  style: CustomTextStyles.labelLargeSecondaryContainer,
                ),
              ),
              SizedBox(height: 20.v),
              SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      child: Divider(),
                    ),
                    SizedBox(height: 14.v),
                    GestureDetector(
                      onTap: () {
                        // Stay on the login page if permission is denied
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: Text(
                        "Tidak",
                        style: CustomTextStyles.labelLargeSecondaryContainer,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}