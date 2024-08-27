import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:id_334/art_price_data.dart';
import 'package:id_334/widgets/correct_answer_dialog.dart';
import 'package:id_334/widgets/wrong_answer_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArtPricePage extends StatefulWidget {
  final Function(int)? onLevelChange;

  ArtPricePage({this.onLevelChange});

  @override
  _ArtPricePageState createState() => _ArtPricePageState();
}

class _ArtPricePageState extends State<ArtPricePage> {
  int currentLevel = 0;
  bool isGameStarted = false;
  bool isGameFinished = false;
  TextEditingController _controller = TextEditingController();
  bool isNextButtonEnabled = false;
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _loadSavedLevel();
    _controller.addListener(_updateNextButtonState);
  }

  void _loadSavedLevel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      currentLevel = prefs.getInt('currentLevel') ?? 0;
      isGameStarted = false;
      isGameFinished = false;
    });
  }

  void _saveLevel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('currentLevel', currentLevel);
    prefs.setBool('isGameStarted', isGameStarted);
    prefs.setBool('isGameFinished', isGameFinished);
  }

  void _startGame() {
    setState(() {
      isGameStarted = true;
      isGameFinished = false;
      _saveLevel();
      widget.onLevelChange?.call(currentLevel + 1);
    });
  }

  void _restartGame() {
    setState(() {
      currentLevel = 0;
      isGameFinished = false;
      isGameStarted = true;
      _controller.clear();
      _saveLevel();
      widget.onLevelChange?.call(currentLevel + 1);
    });
  }

  void _checkPrice() {
    _focusNode.unfocus();

    double guessedPrice = double.tryParse(_controller.text) ?? 0.0;
    double actualPrice = artPriceLevels[currentLevel].price;

    if ((guessedPrice - actualPrice).abs() <= 1.0) {
      _showCorrectAnswerDialog();
    } else {
      _showWrongAnswerDialog();
    }
  }

  void _updateNextButtonState() {
    setState(() {
      isNextButtonEnabled = _controller.text.isNotEmpty;
    });
  }

  void _showCorrectAnswerDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return CorrectAnswerDialog(level: artPriceLevels[currentLevel]);
      },
    );

    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pop();
      if (currentLevel < artPriceLevels.length - 1) {
        setState(() {
          currentLevel++;
          _saveLevel();
          widget.onLevelChange?.call(currentLevel + 1);
          _controller.clear();
          _updateNextButtonState();
        });
      } else {
        setState(() {
          isGameFinished = true;
          isGameStarted = false;
          _saveLevel();
          widget.onLevelChange?.call(32);
        });
      }
    });
  }

  void _showWrongAnswerDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return WrongAnswerDialog(
          level: artPriceLevels[currentLevel],
          onTryAgain: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.removeListener(_updateNextButtonState);
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFD6B0),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.only(
          right: 16.w,
          left: 16.w,
          bottom: 13.h,
        ),
        child: isGameFinished
            ? _buildEndView()
            : (isGameStarted ? _buildGameView() : _buildStartView()),
      ),
    );
  }

  Widget _buildStartView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Guess the cost of those paintings',
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w500,
              fontSize: 35.sp,
              height: 35 / 35,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30.h),
          SizedBox(
            width: double.infinity,
            height: 56.h,
            child: ElevatedButton(
              onPressed: _startGame,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4F2804),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                'Start',
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                  height: 23.87 / 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEndView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'All levels\ncompleted!',
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w500,
              fontSize: 35.sp,
              height: 35 / 35,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30.h),
          SizedBox(
            width: double.infinity,
            height: 56.h,
            child: ElevatedButton(
              onPressed: _restartGame,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4F2804),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                'Try Again',
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                  height: 23.87 / 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGameView() {
    return LayoutBuilder(
      builder: (context, constraints) {
        double cardHeight = (constraints.maxHeight * 0.72).clamp(445.r, 465.r);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.r,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      color: const Color(0xFFEEC59F),
                      child: SizedBox(
                        height: cardHeight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20.r),
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                child: Image.asset(
                                  artPriceLevels[currentLevel].image,
                                  width: 225.r,
                                  height: 310.r,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 20.r),
                            Center(
                              child: Text(
                                artPriceLevels[currentLevel].title,
                                style: TextStyle(
                                    fontSize: 22.r,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2.h),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 10.r),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  artPriceLevels[currentLevel].artist,
                                  style: TextStyle(
                                      fontSize: 18.r,
                                      fontWeight: FontWeight.w400,
                                      height: 1.h),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.w),
                                  child: Text(
                                    '|',
                                    style: TextStyle(
                                      fontSize: 18.r,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Text(
                                  artPriceLevels[currentLevel].date,
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
                    SizedBox(height: 20.r),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                    fontSize: 17.sp,
                    height: 1.h,
                    color: const Color(0xFF000000),
                  ),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 18.h, horizontal: 16.w),
                    hintText: '\$ Price in millions',
                    hintStyle: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w400,
                      fontSize: 17.sp,
                      height: 1.h,
                      color: const Color(0xFF000000).withOpacity(0.3),
                    ),
                    filled: true,
                    fillColor: const Color(0xFFFFFFFF).withOpacity(0.1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: const BorderSide(
                        color: Color(0xFF4F2804),
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: const BorderSide(
                        color: Color(0xFF4F2804),
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: const BorderSide(
                        color: Color(0xFF4F2804),
                        width: 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.r),
                SizedBox(
                  width: double.infinity,
                  height: 56.r,
                  child: ElevatedButton(
                    onPressed: isNextButtonEnabled ? _checkPrice : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4F2804)
                          .withOpacity(isNextButtonEnabled ? 1 : 0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w600,
                        fontSize: 20.r,
                        height: 1.h,
                        color: Colors.white
                            .withOpacity(isNextButtonEnabled ? 1 : 0.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
