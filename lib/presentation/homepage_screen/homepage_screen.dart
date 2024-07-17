import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_outlined_button.dart';
import '../hentikan_live_one_dialog/hentikan_live_one_dialog.dart';

// ignore_for_file: must_be_immutable
class HomepageScreen extends StatelessWidget {
  HomepageScreen({Key? key})
      : super(
          key: key,
        );

  Completer<GoogleMapController> googleMapController = Completer();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Column(
          children: [
            _buildMapSection(context),
            SizedBox(height: 32.v),
            _buildLocationButtons(context),
            SizedBox(height: 4.v),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 48.v,
      leadingWidth: 45.h,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: "TraceIt App - Lacak Lokasi Mu",
      ),
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildMapSection(BuildContext context) {
    return SizedBox(
      height: 330.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 330.v,
            width: double.maxFinite,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  37.43296265331129,
                  -122.08832357078792,
                ),
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
              padding: EdgeInsets.only(
                left: 128.h,
                bottom: 94.v,
              ),
              child: Text(
                "Lokasi Anda",
                style: theme.textTheme.labelSmall,
              ),
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildLocationButtons(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 32.h),
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
            margin: EdgeInsets.only(right: 2.h),
            buttonStyle: CustomButtonStyles.outlinePrimaryTL10,
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

  /// Navigates to the addLocationScreen when the action is triggered.
  onTapTambahkan(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.addLocationScreen);
  }

  /// Navigates to the addLocationScreen when the action is triggered.
  onTapAktifkanlive(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.addLocationScreen);
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
}
