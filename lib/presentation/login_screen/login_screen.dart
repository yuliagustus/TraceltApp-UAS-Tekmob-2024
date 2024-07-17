import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 26.h, vertical: 36.v),
          child: SizedBox(
            height: SizeUtils.height,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgPaperMapBro3,
                    height: 296.v,
                  ),
                  SizedBox(height: 16.v),
                  _buildEmailPasswordSection(),
                  SizedBox(height: 20.v),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        // Tambahkan aksi untuk lupa kata sandi di sini
                        print('Lupa kata sandi?');
                      },
                      child: Text(
                        "Lupa kata sandi?",
                        style: theme.textTheme.labelLarge,
                      ),
                    ),
                  ),
                  Spacer(),
                  CustomElevatedButton(
                    text: "Masuk",
                    onPressed: () {
                      signInWithEmailAndPassword(context);
                    },
                  ),
                  SizedBox(height: 26.v),
                  GestureDetector(
                    onTap: () {
                      onTapTxtBelumpunyaakun(context);
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Belum punya akun? ",
                            style: theme.textTheme.labelLarge,
                          ),
                          TextSpan(
                            text: "Daftar Akun",
                            style: CustomTextStyles.labelLargePrimary,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 18.v),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEmailPasswordSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
          style: theme.textTheme.labelLarge,
        ),
        SizedBox(height: 8.v),
        CustomTextFormField(
          controller: emailController,
          hintText: "Masukkan Email",
          textInputType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Masukkan Email';
            }
            return null;
          },
        ),
        SizedBox(height: 8.v),
        Text(
          "Kata Sandi",
          style: theme.textTheme.labelLarge,
        ),
        SizedBox(height: 8.v),
        CustomTextFormField(
          controller: passwordController,
          hintText: "Masukkan Kata Sandi",
          textInputType: TextInputType.visiblePassword,
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Masukkan Kata Sandi';
            }
            return null;
          },
        ),
      ],
    );
  }

  /// Function to sign in with email and password
  Future<void> signInWithEmailAndPassword(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text,
        );
        // Navigasi ke halaman utama setelah login berhasil
        Navigator.pushNamed(context, AppRoutes.homepageScreen);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          _showErrorDialog(context, 'User Not Found',
              'Tidak ada pengguna dengan email tersebut.');
        } else if (e.code == 'wrong-password') {
          _showErrorDialog(
              context, 'Kata Sandi Salah', 'Kata sandi yang dimasukkan salah.');
        } else {
          _showErrorDialog(context, 'Error', 'Terjadi kesalahan saat login.');
        }
      } catch (e) {
        print('Error: $e');
        _showErrorDialog(context, 'Error', 'Terjadi kesalahan saat login.');
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

  /// Navigasi ke halaman pendaftaran akun baru
  void onTapTxtBelumpunyaakun(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.registerScreen);
  }
}