import 'package:education/utils/constanst.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const AuthButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: const MaterialStatePropertyAll<double>(0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          Theme.of(context).primaryColor,
        ),
        minimumSize: MaterialStatePropertyAll<Size>(
          Size(361.w, 56.h),
        ),
      ),
      onPressed: onTap,
      child: Text(
        title,
        style: Utils.titleTextStyle.copyWith(color: Colors.white),
      ),
    );
  }
}
