import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class HentikanLiveOneDialog extends StatelessWidget {
  const HentikanLiveOneDialog({Key? key})
      : super(
          key: key,
        );

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
                radius: BorderRadius.circular(
                  10.h,
                ),
              ),
              SizedBox(height: 8.v),
              Text(
                "Yakin, hentikan live location ?",
                style: theme.textTheme.bodyMedium,
              ),
              SizedBox(height: 34.v),
              SizedBox(
                width: double.maxFinite,
                child: Divider(),
              ),
              SizedBox(height: 14.v),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, AppRoutes.hentikanLiveScreen);
                },
                child: Text(
                  "Ya, Hentikan",
                  style: CustomTextStyles.labelLargeSecondaryContainer,
                ),
              ),
              SizedBox(height: 20.v),
              SizedBox(
                width: double.maxFinite,
                child: Divider(),
              ),
              SizedBox(height: 14.v),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
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
    );
  }
}
