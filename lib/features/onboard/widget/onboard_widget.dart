import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardWidget extends StatelessWidget {
  final String image;
  const OnBoardWidget({
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 350.h,
          child: Image.asset(
            image,
            fit: BoxFit.fitHeight,
          ),
        ),
      ],
    );
  }
}
