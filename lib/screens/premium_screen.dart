import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PremiumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFD6B0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Premium',
          style: TextStyle(
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w600,
            fontSize: 22.sp,
            height: 22 / 22,
            color: const Color(0xFF000000),
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                width: 36.w,
                height: 36.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF4F2804),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.close,
                    size: 24.r,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.h),
            Image.asset(
              'assets/premium.png',
              width: 520.47.w,
              height: 341.h,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20.h),
            Text(
              'Premium',
              style: TextStyle(
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w600,
                fontSize: 50.sp,
                height: 1.0,
                color: const Color(0xFF000000),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            Text(
              'Ads free for \$0.49',
              style: TextStyle(
                fontFamily: 'SF Compact Display',
                fontWeight: FontWeight.w400,
                fontSize: 22.sp,
                height: 1.2,
                color: const Color(0xFF000000),
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            SizedBox(
              width: 343.w,
              height: 56.h,
              child: ElevatedButton(
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setBool('isPremium', true);

                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4F2804),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(
                  'Get the purchase',
                  style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp,
                    height: 23.87 / 20,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 31.h),
            TextButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setBool('isPremium', true);

                Navigator.of(context).pop();
              },
              child: Text(
                'Restore',
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                  height: 23.87 / 20,
                  color: const Color(0xFF000000),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
