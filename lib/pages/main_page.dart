import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../main_page_content.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle headingStyle = TextStyle(
      fontFamily: 'SF Pro Display',
      fontWeight: FontWeight.w600,
      fontSize: 28.sp,
      height: 28 / 28,
      color: const Color(0xFF000000),
    );

    final TextStyle subheadingStyle = TextStyle(
      fontFamily: 'SF Pro Display',
      fontWeight: FontWeight.w600,
      fontSize: 18.sp,
      height: 21.6 / 18,
      color: const Color(0xFF000000),
    );

    final TextStyle bodyTextStyle = TextStyle(
      fontFamily: 'SF Pro Display',
      fontWeight: FontWeight.w400,
      fontSize: 18.sp,
      height: 21.6 / 18,
      color: const Color(0xFF000000),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFFFD6B0),
      body: Padding(
        padding: EdgeInsets.only(
          right: 16.w,
          left: 16.w,
          top: 7.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Text('How Do Art Auctions Really Work?', style: headingStyle),
              SizedBox(height: 20.h),
              Image.asset(
                'assets/image1.png',
              ),
              SizedBox(height: 20.h),
              Text(howDoArtAuctionsWorkText, style: bodyTextStyle),
              SizedBox(height: 30.h),
              Text('What is an Auction?', style: headingStyle),
              SizedBox(height: 20.h),
              Text(whatIsAuctionText, style: bodyTextStyle),
              SizedBox(height: 30.h),
              Text('History of Auctions', style: headingStyle),
              SizedBox(height: 20.h),
              Text(historyOfAuctionsText, style: bodyTextStyle),
              SizedBox(height: 30.h),
              Text('Types of Auction', style: headingStyle),
              SizedBox(height: 20.h),
              Text(typesOfAuctionText, style: bodyTextStyle),
              SizedBox(height: 30.h),
              Text('English Auction', style: subheadingStyle),
              SizedBox(height: 20.h),
              Text(englishAuctionText, style: bodyTextStyle),
              SizedBox(height: 30.h),
              Text('Dutch Auction', style: subheadingStyle),
              SizedBox(height: 20.h),
              Text(dutchAuctionText, style: bodyTextStyle),
              SizedBox(height: 30.h),
              Text('Second-price Sealed-bid Auction', style: subheadingStyle),
              SizedBox(height: 20.h),
              Text(secondPriceAuctionText, style: bodyTextStyle),
              SizedBox(height: 30.h),
              Text('How do Art Auctions Work?', style: headingStyle),
              SizedBox(height: 20.h),
              Text(howDoArtAuctionsWorkProcessText, style: bodyTextStyle),
              SizedBox(height: 20.h),
              Text('A Short Preview is Given about the Auction',
                  style: subheadingStyle),
              SizedBox(height: 20.h),
              Image.asset(
                'assets/image2.png',
              ),
              SizedBox(height: 20.h),
              Text(shortPreviewText, style: bodyTextStyle),
              SizedBox(height: 20.h),
              Text('Buyers are Registered', style: subheadingStyle),
              SizedBox(height: 20.h),
              Text(buyersRegisteredText, style: bodyTextStyle),
              SizedBox(height: 20.h),
              Text('Beginning of the Auction', style: subheadingStyle),
              SizedBox(height: 20.h),
              Text(auctionStartText, style: bodyTextStyle),
              SizedBox(height: 20.h),
              Text('End of Auction', style: subheadingStyle),
              SizedBox(height: 20.h),
              Text(auctionEndText, style: bodyTextStyle),
            ],
          ),
        ),
      ),
    );
  }
}
