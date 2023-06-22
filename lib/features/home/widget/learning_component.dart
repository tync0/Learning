import 'package:auto_route/auto_route.dart';
import 'package:colours/colours.dart';
import 'package:d_chart/d_chart.dart';
import 'package:education/utils/constanst.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LearningComponent extends StatefulWidget {
  final int index;
  const LearningComponent({super.key, required this.index});

  @override
  State<LearningComponent> createState() => _LearningComponentState();
}

class _LearningComponentState extends State<LearningComponent> {
  List<Map<String, dynamic>> subject = [
    {
      'title': 'Reading',
      'svg': 'assets/reading.svg',
      'subtitle': 'You completed 72%',
      'color': Colors.blue,
    },
    {
      'title': 'Listening',
      'svg': 'assets/listening.svg',
      'subtitle': 'You completed 59%',
      'color': Colours.mediumBlue,
    },
    {
      'title': 'Speaking',
      'svg': 'assets/speaking.svg',
      'subtitle': 'You completed 32%',
      'color': Colours.redAccent,
    },
    {
      'title': 'Grammar',
      'svg': 'assets/grammar.svg',
      'subtitle': 'You completed 53%',
      'color': Colours.gold,
    }
  ];
  List<double> numbers = [72, 59, 32, 53];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (subject[widget.index]['title']) {
          case 'Reading':
            context.router.pushNamed('/reading');
            break;
          case 'Listening':
            context.router.pushNamed('/listening');
            break;
          default:
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 10.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 25.h, left: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                subject[widget.index]['svg'].toString(),
                width: 50.w,
                height: 50.h,
              ),
              SizedBox(height: 10.h),
              Text(
                subject[widget.index]['title'].toString(),
                style: Utils.titleTextStyle.copyWith(fontSize: 20.sp),
              ),
              Text(
                subject[widget.index]['subtitle'].toString(),
                style: Utils.subtitleTextStyle.copyWith(fontSize: 14.sp),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                width: 125.w,
                height: 10.h,
                child: DChartSingleBar(
                  radius: BorderRadius.circular(64.r),
                  forgroundColor: subject[widget.index]['color'],
                  value: numbers[widget.index],
                  max: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
