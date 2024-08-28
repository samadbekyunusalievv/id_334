import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/premium_screen.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isNotificationOn = false;
  bool isPremium = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadPremiumStatus();
  }

  Future<void> _loadPremiumStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isPremium = prefs.getBool('isPremium') ?? false;
    });
  }

  Future<void> _togglePremiumStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isPremium = !isPremium;
      prefs.setBool('isPremium', isPremium);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFD6B0),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            _buildSettingCard(),
            SizedBox(height: 20.h),
            _buildPolicyCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Color(0xFFEEC59F),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildNotificationToggle(),
          if (!isPremium) SizedBox(height: 8.h),
          if (!isPremium) _buildSettingsButton('Remove Ads', context),
        ],
      ),
    );
  }

  Widget _buildPolicyCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      height: 170.h,
      decoration: BoxDecoration(
        color: Color(0xFFEEC59F),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildSettingsButton('Terms of Use', context, () {
            _togglePremiumStatus();
          }),
          _buildSettingsButton('Privacy Policy', context, null),
        ],
      ),
    );
  }

  Widget _buildNotificationToggle() {
    return SizedBox(
      height: 61.h,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF4F2804),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          padding: EdgeInsets.only(left: 20.w, right: 15.w),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Notifications',
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                  color: Colors.white,
                  height: 20 / 20,
                ),
              ),
            ),
            Switch(
              value: isNotificationOn,
              onChanged: (bool value) {
                setState(() {
                  isNotificationOn = value;
                });
              },
              activeColor: Colors.white,
              activeTrackColor: const Color(0xFF4CAF50),
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsButton(String text, BuildContext context,
      [VoidCallback? onPressed]) {
    return SizedBox(
      height: 61.h,
      child: ElevatedButton(
        onPressed: onPressed ??
            () {
              if (text == 'Remove Ads') {
                Navigator.of(context)
                    .push(
                  MaterialPageRoute(builder: (context) => PremiumScreen()),
                )
                    .then((_) {
                  _loadPremiumStatus();
                });
              }
            },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF4F2804),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          padding: EdgeInsets.only(left: 20.w),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w500,
              fontSize: 20.sp,
              color: Colors.white,
              height: 20 / 20,
            ),
          ),
        ),
      ),
    );
  }
}
