import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final TextEditingController emailInputController = TextEditingController();
  final TextEditingController newPasswordInputController =
      TextEditingController();
  final TextEditingController confirmPasswordInputController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Form(
            key: _formKey,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 26.h, vertical: 28.v),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgPaperMapBro3,
                    height: 296.v,
                    width: double.maxFinite,
                  ),
                  SizedBox(height: 20.v),
                  _buildEmailSection(context),
                  SizedBox(height: 22.v),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        // Aksi untuk lupa kata sandi
                        print('Lupa kata sandi?');
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Lupa kata sandi?",
                              style: theme.textTheme.labelLarge,
                            ),
                            TextSpan(
                              text: " ",
                            ),
                            TextSpan(
                              text: "Klik disini",
                              style: CustomTextStyles.labelLargePrimary,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(height: 38.v),
                  _buildRegisterButton(context),
                  SizedBox(height: 26.v),
                  GestureDetector(
                    onTap: () {
                      onTapTxtSudahpunyaakun(context);
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Sudah punya akun? ",
                            style: theme.textTheme.labelLarge,
                          ),
                          TextSpan(
                            text: "Masuk",
                            style: CustomTextStyles.labelLargePrimary,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 4.v),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEmailInput(BuildContext context) {
    return CustomTextFormField(
      controller: emailInputController,
      hintText: "Masukkan email anda",
      textInputType: TextInputType.emailAddress,
      contentPadding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 14.v),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Masukkan Email';
        }
        return null;
      },
    );
  }

  /// Section Widget
  Widget _buildNewPasswordInput(BuildContext context) {
    return CustomTextFormField(
      controller: newPasswordInputController,
      hintText: "Kata sandi baru",
      textInputType: TextInputType.visiblePassword,
      suffix: Container(
        margin: EdgeInsets.fromLTRB(30.h, 16.v, 18.h, 14.v),
        child: CustomImageView(
          imagePath: ImageConstant.imgEye,
          height: 14.adaptSize,
          width: 14.adaptSize,
        ),
      ),
      suffixConstraints: BoxConstraints(
        maxHeight: 46.v,
      ),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Masukkan Kata Sandi';
        }
        return null;
      },
    );
  }

  /// Section Widget
  Widget _buildConfirmPasswordInput(BuildContext context) {
    return CustomTextFormField(
      controller: confirmPasswordInputController,
      hintText: "Konfirmasi Kata Sandi",
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      suffix: Container(
        margin: EdgeInsets.fromLTRB(30.h, 16.v, 18.h, 14.v),
        child: CustomImageView(
          imagePath: ImageConstant.imgEye,
          height: 14.adaptSize,
          width: 14.adaptSize,
        ),
      ),
      suffixConstraints: BoxConstraints(
        maxHeight: 46.v,
      ),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Masukkan Konfirmasi Kata Sandi';
        } else if (value != newPasswordInputController.text) {
          return 'Kata Sandi tidak cocok';
        }
        return null;
      },
    );
  }

  /// Section Widget
  Widget _buildEmailSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 4.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email",
            style: theme.textTheme.labelLarge,
          ),
          SizedBox(height: 8.v),
          _buildEmailInput(context),
          SizedBox(height: 8.v),
          Text(
            "Kata Sandi",
            style: theme.textTheme.labelLarge,
          ),
          SizedBox(height: 8.v),
          _buildNewPasswordInput(context),
          SizedBox(height: 8.v),
          Text(
            "Konfirmasi Kata Sandi",
            style: theme.textTheme.labelLarge,
          ),
          SizedBox(height: 8.v),
          _buildConfirmPasswordInput(context),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildRegisterButton(BuildContext context) {
    return CustomElevatedButton(
      text: "Daftar",
      margin: EdgeInsets.symmetric(horizontal: 6.h),
      onPressed: () {
        registerWithEmailAndPassword(context);
      },
    );
  }

  /// Fungsi untuk mendaftarkan pengguna menggunakan email dan password
  Future<void> registerWithEmailAndPassword(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailInputController.text.trim(),
          password: newPasswordInputController.text,
        );
        // Jika berhasil mendaftar, navigasikan ke halaman login
        Navigator.pushNamed(context, AppRoutes.loginScreen);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          _showErrorDialog(context, 'Kata Sandi Lemah',
              'Masukkan kata sandi yang lebih kuat.');
        } else if (e.code == 'email-already-in-use') {
          _showErrorDialog(
              context, 'Email Sudah Digunakan', 'Email ini sudah terdaftar.');
        } else {
          _showErrorDialog(
              context, 'Error', 'Terjadi kesalahan saat mendaftar.');
        }
      } catch (e) {
        print('Error: $e');
        _showErrorDialog(context, 'Error', 'Terjadi kesalahan saat mendaftar.');
      }
    }
  }

  /// Menampilkan dialog kesalahan
  void _showErrorDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  /// Navigasi ke halaman login
  void onTapTxtSudahpunyaakun(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginScreen);
  }
}