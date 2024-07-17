import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_outlined_button.dart';
import '../hentikan_live_one_dialog/hentikan_live_one_dialog.dart';

// ignore_for_file: must_be_immutable
class AddLocationScreen extends StatelessWidget {
  AddLocationScreen({Key? key})
      : super(
          key: key,
        );

  Completer<GoogleMapController> googleMapController = Completer();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _buildMapSection(context),
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 20.h,
                vertical: 32.v,
              ),
              child: Column(
                children: [
                  _buildActionButtons(context),
                  SizedBox(height: 26.v),
                  _buildLocationInfo(context),
                  SizedBox(height: 4.v)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildMapSection(BuildContext context) {
    return SizedBox(
      height: 380.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomAppBar(
            title: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Container(
                  height: 24.v,
                  width: 242.h,
                  margin: EdgeInsets.only(
                    left: 1.h,
                    top: 13.v,
                    bottom: 11.v,
                  ),
                  child: Stack(
                    children: [
                      AppbarTitle(
                        text: "TraceIt App - Lacak Lokasi Mu",
                      ),
                      AppbarTitle(
                        text: "TraceIt App - Lacak Lokasi Mu",
                      ),
                    ],
                  ),
                )
              ],
            ),
            styleType: Style.bgFill,
          ),
          Container(
            height: 330.v,
            width: double.maxFinite,
            decoration: AppDecoration.fillWhiteA,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 330.v,
                  width: double.maxFinite,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(37.43296265331129, -122.08832357078792),
                      zoom: 14.4746,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      googleMapController.complete(controller);
                    },
                    zoomControlsEnabled: false,
                    zoomGesturesEnabled: false,
                    myLocationButtonEnabled: false,
                    myLocationEnabled: false,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 128.h, bottom: 94.v),
                    child: Text(
                      "Lokasi Anda",
                      style: theme.textTheme.labelSmall,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildActionButtons(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 10.h),
      child: Column(
        children: [
          CustomOutlinedButton(
            text: "tambahkan lokasi saya",
          ),
          SizedBox(height: 16.v),
          CustomOutlinedButton(
            text: "aktifkan live location",
            buttonStyle: CustomButtonStyles.outlinePrimaryTL14,
            onPressed: () {
              onTapAktifkanlive(context);
            },
          ),
          SizedBox(height: 16.v),
          CustomOutlinedButton(
            text: "hentikan live location",
            onPressed: () {
              onTapHentikanlive(context);
            },
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildLocationInfo(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.h),
      padding: EdgeInsets.symmetric(
        horizontal: 8.h,
        vertical: 10.v,
      ),
      decoration: AppDecoration.outlinePrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Yuli",
                  style: CustomTextStyles.titleMediumOnPrimaryContainer,
                ),
                Text(
                  "37.05305",
                  style: theme.textTheme.bodyLarge,
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "-121.99179",
              style: theme.textTheme.bodyLarge,
            ),
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgSolarRouteBold,
            height: 26.adaptSize,
            width: 26.adaptSize,
            margin: EdgeInsets.only(top: 8.v),
            onTap: () {
              onTapImgSolarrouteone(context);
            },
          )
        ],
      ),
    );
  }

  /// Navigates to the homepageScreen when the action is triggered.
  onTapView(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homepageScreen);
  }

  /// Navigates to the aktifkanLiveScreen when the action is triggered.
  onTapAktifkanlive(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.aktifkanLiveScreen);
  }

  /// Displays a dialog with the [HentikanLiveOneDialog] content.
  onTapHentikanlive(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: HentikanLiveOneDialog(),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.zero,
            ));
  }

  /// Navigates to the aktifkanLiveOneScreen when the action is triggered.
  onTapImgSolarrouteone(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.aktifkanLiveOneScreen);
  }
}
