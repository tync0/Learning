import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 2),
      () async {
        final pref = await SharedPreferences.getInstance();
        bool showOnBoard = pref.getBool('showOnBoard') ?? true;
        bool showLogin = pref.getBool('showLogin') ?? true;
        if (showOnBoard) {
          context.router.replaceNamed('/onboard');
        } else {
          if (showLogin) {
            context.router.replaceNamed('/login');
          } else {
            context.router.replaceNamed('/bottomnavbar');
          }
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 180.h),
              child: Image.asset('assets/splash.jpg'),
            ),
          ],
        ),
      ),
    ));
  }
}
