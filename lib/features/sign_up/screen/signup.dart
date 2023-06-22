import 'package:auto_route/auto_route.dart';
import 'package:education/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/auth_button.dart';
import '../widget/auth_field.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 40.h, left: 10.w),
                  height: 300.h,
                  width: 100.w,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        context.router.pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Column(
                    children: [
                      const AuthField(fieldTitle: "Name"),
                      SizedBox(height: 10.h),
                      const AuthField(fieldTitle: "Email"),
                      SizedBox(height: 10.h),
                      const AuthField(
                        fieldTitle: "Password",
                        isPasswordField: true,
                      ),
                      SizedBox(height: 10.h),
                      AuthButton(
                        title: "Sign up",
                        onTap: () {
                          SharedPref().showLogin();
                          context.router.replaceNamed('/bottomnavbar');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
