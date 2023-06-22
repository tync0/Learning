import 'package:auto_route/auto_route.dart';
import 'package:education/utils/constanst.dart';
import 'package:education/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../sign_up/widget/auth_button.dart';
import '../../sign_up/widget/auth_field.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/sign_up.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 300.h,
                  ),
                  const AuthField(fieldTitle: "Email"),
                  SizedBox(height: 10.h),
                  const AuthField(
                    fieldTitle: "Password",
                    isPasswordField: true,
                  ),
                  SizedBox(height: 10.h),
                  AuthButton(
                    title: "Login",
                    onTap: () {
                      SharedPref().showLogin();
                      context.router.replaceNamed('/bottomnavbar');
                    },
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    width: 250.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t you have an account?',
                          style: Utils.subtitleTextStyle
                              .copyWith(fontSize: 14.sp, color: Colors.black),
                        ),
                        TextButton(
                          onPressed: () {
                            context.router.pushNamed('/signup');
                          },
                          child: const Text('Sign up'),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
