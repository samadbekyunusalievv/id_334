import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavbar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle labelStyle = TextStyle(
      fontFamily: 'SF Pro Display',
      fontWeight: FontWeight.w500,
      fontSize: 14.sp,
      height: 16.71 / 14,
      letterSpacing: 2 / 100,
    );

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFEEC59F),
        border: Border(
          top: BorderSide(
            color: Color(0x334F2804),
            width: 0.6,
          ),
        ),
      ),
      padding: EdgeInsets.only(bottom: 10.h),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
              child: Image.asset(
                'assets/icons/main.png',
                width: 24.w,
                height: 24.h,
                color: selectedIndex == 0
                    ? const Color(0xFF4F2804)
                    : const Color(0xFF7C634B),
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
              child: Image.asset(
                'assets/icons/artprice.png',
                width: 24.w,
                height: 24.h,
                color: selectedIndex == 1
                    ? const Color(0xFF4F2804)
                    : const Color(0xFF7C634B),
              ),
            ),
            label: 'Art Price',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
              child: Image.asset(
                'assets/icons/settings.png',
                width: 24.w,
                height: 24.h,
                color: selectedIndex == 2
                    ? const Color(0xFF4F2804)
                    : const Color(0xFF7C634B),
              ),
            ),
            label: 'Settings',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: const Color(0xFF4F2804),
        unselectedItemColor: const Color(0xFF7C634B),
        selectedLabelStyle: labelStyle.copyWith(color: const Color(0xFF4F2804)),
        unselectedLabelStyle:
            labelStyle.copyWith(color: const Color(0xFF7C634B)),
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
    );
  }
}
