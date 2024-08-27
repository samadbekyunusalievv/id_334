import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:id_334/art_price_data.dart';

class WrongAnswerDialog extends StatelessWidget {
  final ArtPrice level;
  final VoidCallback onTryAgain;

  const WrongAnswerDialog(
      {Key? key, required this.level, required this.onTryAgain})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFEEC59F),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.h,
              ),
              Container(
                width: double.infinity,
                height: 78.h,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Color(0xFF921A00),
                ),
                child: Text(
                  'Wrong answer!',
                  style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                    fontSize: 32.sp,
                    height: 38.4 / 32,
                    color: const Color(0xFFFFFFFF),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 45.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(
                  level.image,
                  width: 269.r,
                  height: 370.r,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                height: 100.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      Text(
                        level.title,
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w600,
                          fontSize: 22.r,
                          height: 1.2.h,
                          color: const Color(0xFF000000),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            level.artist,
                            style: TextStyle(
                              fontSize: 18.r,
                              height: 1.h,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Text(
                              '|',
                              style: TextStyle(
                                fontSize: 18.r,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Text(
                            level.date,
                            style: TextStyle(
                              fontSize: 18.r,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 71.h,
                child: ElevatedButton(
                  onPressed: onTryAgain,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC7976A),
                    shape: const RoundedRectangleBorder(),
                  ),
                  child: Text(
                    'Try again',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      fontSize: 26.sp,
                      height: 1.h,
                      color: const Color(0xFF000000),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
