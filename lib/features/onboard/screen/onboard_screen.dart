import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:education/utils/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/onboard_button.dart';
import '../widget/onboard_widget.dart';

@RoutePage()
class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  final ValueNotifier _pageIndex = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 100.h),
            SizedBox(
              height: 430.h,
              width: size.width,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                onPageChanged: (value) {
                  _pageIndex.value = value;
                },
                controller: _pageController,
                itemCount: 3,
                itemBuilder: (context, index) {
                  String image = 'assets/onboard${index + 1}.jpg';
                  return OnBoardWidget(image: image);
                },
              ),
            ),
            SizedBox(height: 50.h),
            SizedBox(
              width: 270.w,
              height: 50.h,
              child: ValueListenableBuilder(
                valueListenable: _pageIndex,
                builder: (context, value, child) {
                  return OnboardButton(
                    text: value == 2 ? 'Get Started' : 'Next',
                    fun: () {
                      if (value != 2) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      } else {
                        SharedPref().showOnBoard();
                        context.router.replaceNamed('/login');
                      }
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
