import 'package:auto_route/auto_route.dart';
import 'package:colours/colours.dart';
import 'package:d_chart/d_chart.dart';
import 'package:education/utils/constanst.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../widget/learning_component.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.lightSkyBlue,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 280.h,
              padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 35.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(64.r),
                  bottomLeft: Radius.circular(64.r),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 50.w,
                            height: 50.h,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(64.r),
                              child: Image.asset(
                                'assets/pp.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text('Hello', style: Utils.titleTextStyle),
                        ],
                      ),
                      SvgPicture.asset(
                        'assets/4dot.svg',
                        width: 22.w,
                        height: 22.h,
                      )
                    ],
                  ),
                  SizedBox(height: 25.h),
                  Container(
                    width: (MediaQuery.of(context).size.width - 10).w,
                    height: 140.h,
                    decoration: BoxDecoration(
                      color: Colours.peachPuff,
                      borderRadius: BorderRadius.circular(32.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 150.w,
                          height: 150.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Stack(
                            children: [
                              DChartPie(
                                data: const [
                                  {'domain': 'Salam', 'measure': 25},
                                  {'domain': 'Sagol', 'measure': 75},
                                ],
                                fillColor: (pieData, index) {
                                  switch (index) {
                                    case 0:
                                      return Colors.grey[100];
                                    case 1:
                                      return Colors.blue;
                                    default:
                                      return Colors.amber;
                                  }
                                },
                                donutWidth: 12,
                                labelColor: Colors.white,
                              ),
                              Positioned(
                                top: 57.h,
                                left: 55.w,
                                child: Text(
                                  '75%',
                                  style: Utils.titleTextStyle,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40.h, right: 25.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Good Results',
                                style: Utils.titleTextStyle.copyWith(
                                    color: Colours.mediumBlue, fontSize: 22.sp),
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                'Your English\nhas improved',
                                style: Utils.subtitleTextStyle
                                    .copyWith(fontSize: 16.sp),
                                textAlign: TextAlign.start,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.w, top: 15.h, bottom: 5.h),
              child: Text('Your Lesson', style: Utils.subtitleTextStyle),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 350.h,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) => SizedBox(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: LearningComponent(
                        index: index,
                      ),
                    ),
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
