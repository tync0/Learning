import 'package:auto_route/auto_route.dart';
import 'package:education/utils/constanst.dart';
import 'package:education/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../sign_up/widget/auth_button.dart';
import '../../sign_up/widget/auth_field.dart';
import '../widget/user_model.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final List<User> userList = const [
    User(email: 'user1@example.com', password: 'password1'),
    User(email: 'user2@example.com', password: 'password2'),
  ];

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

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
                  AuthField(
                    fieldTitle: "Email",
                    controller: email,
                  ),
                  SizedBox(height: 10.h),
                  AuthField(
                    fieldTitle: "Password",
                    isPasswordField: true,
                    controller: password,
                  ),
                  SizedBox(height: 10.h),
                  AuthButton(
                    title: "Login",
                    onTap: () {
                      if (email.text.isEmpty || password.text.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Error'),
                              content: const Text('Please fill in all fields.'),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        bool isLoggedIn = false;
                        for (User user in userList) {
                          if (user.email == email.text &&
                              user.password == password.text) {
                            isLoggedIn = true;
                            break;
                          }
                        }
                        if (isLoggedIn) {
                          SharedPref().showLogin();
                          context.router.replaceNamed('/bottomnavbar');
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Error'),
                                content:
                                    const Text('Invalid email or password.'),
                                actions: [
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      }
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
