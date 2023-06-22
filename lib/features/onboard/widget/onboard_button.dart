import 'package:education/utils/constanst.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardButton extends StatelessWidget {
  final String text;
  final void Function() fun;
  const OnboardButton({required this.text, required this.fun, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: const MaterialStatePropertyAll<double>(0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.r),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          Theme.of(context).primaryColor,
        ),
      ),
      onPressed: fun,
      child: Text(
        text,
        style: Utils.titleTextStyle.copyWith(color: Colors.white),
      ),
    );
  }
}


/*
MaterialButton(
      onPressed: fun,
      minWidth: 361.w,
      height: 56.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.r),
      ),
      color: Colours.royalBlue,
      child: Text(
        text,
        style: Utils.titleTextStyle.copyWith(color: Colors.white),
      ),
    )
*/