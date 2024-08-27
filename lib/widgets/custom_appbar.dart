import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? levelIndicator;

  const CustomAppBar({
    super.key,
    required this.title,
    this.levelIndicator,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xFFFFD6B0),
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w600,
          fontSize: 22.sp,
          height: 22 / 22,
          color: Colors.black,
        ),
      ),
      actions: [
        if (levelIndicator != null)
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Center(
              child: Text(
                levelIndicator!,
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                  height: 22 / 18,
                  color: Colors.black,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
      ],
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
