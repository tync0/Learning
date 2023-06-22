import 'package:auto_route/auto_route.dart';
import 'package:education/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [VocabularyRoute(), HomeRoute(), ProfileRoute()],
      bottomNavigationBuilder: (context, tabsRouter) {
        return Container(
          margin: EdgeInsets.only(
            bottom: 15.h,
            right: 25.w,
            left: 25.w,
          ),
          width: 150.w,
          height: 80.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32.r),
            child: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) {
                tabsRouter.setActiveIndex(index);
              },
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  activeIcon: icon('book', Colors.black),
                  icon: icon('book', Colors.grey.shade600),
                  label: 'book',
                ),
                BottomNavigationBarItem(
                  activeIcon: icon('home', Colors.black),
                  icon: icon('home', Colors.grey.shade600),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  activeIcon: icon('profile', Colors.black),
                  icon: icon('profile', Colors.grey.shade600),
                  label: 'profile',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget icon(String name, Color color) {
    return SvgPicture.asset(
      'assets/$name.svg',
      colorFilter: ColorFilter.mode(
        color,
        BlendMode.srcIn,
      ),
    );
  }
}
/*

    
    




    
*/