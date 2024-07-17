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
class HentikanLiveScreen extends StatefulWidget {
  HentikanLiveScreen({Key? key}) : super(key: key);

  @override
  _HentikanLiveScreenState createState() => _HentikanLiveScreenState();
}

class _HentikanLiveScreenState extends State<HentikanLiveScreen> {
  Completer<GoogleMapController> googleMapController = Completer();
  LatLng? _currentLocation;

  @override
  void initState() {
    super.initState();
    // Set initial location or load from a service
    _currentLocation = LatLng(37.43296265331129, -122.08832357078792);
  }

  void _updateLocation(LatLng? newLocation) {
    setState(() {
      _currentLocation = newLocation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _buildLocationStack(context),
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 20.h,
                vertical: 32.v,
              ),
              child: Column(
                children: [
                  _buildAddLocationColumn(context),
                  SizedBox(height: 26.v),
                  _buildUserInfoRow(context),
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
  Widget _buildLocationStack(BuildContext context) {
    return SizedBox(
      height: 380.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomAppBar(
            title: Row(
              children: [
                SizedBox(
                  height: 48.v,
                  width: 58.h,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () {
                            onTapView(context);
                          },
                          child: Container(
                            height: 48.v,
                            width: 58.h,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgArrow1,
                        height: 2.v,
                        width: 32.h,
                        margin: EdgeInsets.fromLTRB(13.h, 24.v, 13.h, 22.v),
                      ),
                    ],
                  ),
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
                      target: _currentLocation ?? LatLng(37.43296265331129, -122.08832357078792),
                      zoom: 14.4746,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      googleMapController.complete(controller);
                    },
                    zoomControlsEnabled: false,
                    zoomGesturesEnabled: false,
                    myLocationButtonEnabled: false,
                    myLocationEnabled: false,
                    markers: _currentLocation != null ? {
                      Marker(
                        markerId: MarkerId('current_location'),
                        position: _currentLocation!,
                      ),
                    } : {},
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
  Widget _buildAddLocationColumn(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 10.h),
      child: Column(
        children: [
          CustomOutlinedButton(
            text: "tambahkan lokasi saya",
            onPressed: () {
              onTapTambahkan(context);
            },
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
  Widget _buildUserInfoRow(BuildContext context) {
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
          )
        ],
      ),
    );
  }

  /// Displays a dialog with the [HentikanLiveOneDialog] content.
  void onTapView(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: HentikanLiveOneDialog(),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.zero,
            )).then((value) {
      if (value == true) {
        _updateLocation(null); // Remove location when "Yes" is clicked
      }
    });
  }

  /// Navigates to the addLocationScreen when the action is triggered.
  void onTapTambahkan(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.addLocationScreen);
  }

  /// Navigates to the addLocationScreen when the action is triggered.
  void onTapAktifkanlive(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.addLocationScreen);
  }

  /// Displays a dialog with the [HentikanLiveOneDialog] content.
  void onTapHentikanlive(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: HentikanLiveOneDialog(),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.zero,
            )).then((value) {
      if (value == true) {
        _updateLocation(null); // Remove location when "Yes" is clicked
      }
    });
  }
}
