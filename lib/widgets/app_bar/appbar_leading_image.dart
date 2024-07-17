import 'package:flutter/material.dart';
import '../../core/app_export.dart';
// ignore_for_file: must_be_immutable

class AppbarLeadingImage extends StatelessWidget {
  AppbarLeadingImage({Key? key, this.imagePath, this.margin, this.onTap})
      : super(
          key: key,
        );

  String? imagePath;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomImageView(
          imagePath: imagePath!,
          height: 2.v,
          width: 32.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
