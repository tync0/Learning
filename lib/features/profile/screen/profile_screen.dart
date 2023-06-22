import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/course_card.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Düğmeye tıklandığında gerçekleştirilecek işlemler
        },
        backgroundColor: Colors.greenAccent,
        child: const Icon(Icons.edit),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 200.w,
                    height: 200.w,
                    decoration: const BoxDecoration(
                        color: Colors.greenAccent,
                        shape: BoxShape
                            .circle // Yuvarlak şekli için BoxShape.circle kullanılıyor
                        ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    "Child's Name",
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "Age 7",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Overall Progress",
                        style: TextStyle(fontSize: 17.sp),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        width: 320.w,
                        height: 13.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[300],
                        ),
                        child: const LinearProgressIndicator(
                          backgroundColor: Colors.transparent,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.greenAccent),
                          value:
                              0.4, // İlerleme yüzdesi burada belirtilir (0.0 - 1.0 aralığında)
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const CourseCard(),
                  SizedBox(
                    height: 10.h,
                  ),
                  const CourseCard()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
