import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main_screen.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFD6B0),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 76.h),
              Image.asset(
                'assets/onboarding.png',
                width: 288.95.w,
                height: 303.h,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 20.h),
              Text(
                'Quick Art Auction',
                style: GoogleFonts.alegreyaSc(
                  fontWeight: FontWeight.w700,
                  fontSize: 50.sp,
                  height: 55 / 50,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 99.h),
              SizedBox(
                width: double.infinity,
                height: 56.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4F2804),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                  ),
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setBool('isFirstTime', false);

                    _showNotificationDialog(context);
                  },
                  child: Text(
                    'Continue',
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
              SizedBox(height: 25.h),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Privacy Policy',
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w400,
                          fontSize: 17.sp,
                          height: 20.29 / 17,
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Terms of Use',
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w400,
                          fontSize: 17.sp,
                          height: 20.29 / 17,
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showNotificationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
            backgroundColor: Colors.white,
            child: Container(
              padding: EdgeInsets.zero,
              width: 270.w,
              height: 178.h,
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 16.h),
                      Text(
                        "“Quick Art Auction” Would\nLike to Send You Notifications",
                        style: TextStyle(
                          fontSize: 17.r,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          letterSpacing: -0.41,
                          height: 22.h / 17.r,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Notifications can include alerts,\n sounds, and icons. You can customize\n them in Settings.",
                        style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 13.r,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.08,
                          color: Colors.black,
                          height: 16.h / 13.r,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10.r),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 20.w),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainScreen()),
                                );
                              },
                              child: Text(
                                "Don't allow",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 17.r,
                                  height: 22.h / 17.r,
                                ),
                              ),
                            ),
                            SizedBox(width: 54.w),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainScreen()),
                                );
                              },
                              child: Text(
                                "OK",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 17.r,
                                  height: 22.h / 17.r,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 134.h,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 1.h,
                      color: const Color.fromRGBO(0, 0, 0, 0.2),
                    ),
                  ),
                  Positioned(
                    top: 134.h,
                    left: 135.w,
                    bottom: 0,
                    child: Container(
                      width: 1.w,
                      color: const Color.fromRGBO(0, 0, 0, 0.2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
