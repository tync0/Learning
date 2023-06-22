import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ReadingScreen extends StatefulWidget {
  const ReadingScreen({Key? key}) : super(key: key);

  @override
  _ReadingScreenState createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Widget> _buildPages() {
    return [
      _buildPage(
        "The Lion and the Mouse",
        "Once upon a time, there lived a lion in a forest. One day, the lion was sleeping when a mouse came by and accidentally woke him up.",
        Colors.orange,
        0.3,
      ),
      _buildPage(
        "The Tortoise and the Hare",
        "In a race between a tortoise and a hare, the hare was confident that he would win. He decided to take a nap during the race as he thought the tortoise was too slow.",
        Colors.green,
        0.6,
      ),
      _buildPage(
        "The Ant and the Grasshopper",
        "During summer, the ant was busy working hard, gathering food and preparing for the winter. The grasshopper, on the other hand, was enjoying the sunny days and singing all day long.",
        Colors.blue,
        0.9,
      ),
    ];
  }

  Widget _buildPage(
      String title, String content, Color color, double progress) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 32.h),
          Text(
            title,
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            content,
            style: TextStyle(
              fontSize: 20.sp,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16.h),
          LinearProgressIndicator(
            backgroundColor: Colors.white.withOpacity(0.5),
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            value: progress,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.router.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Reading",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.sp,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: _buildPages(),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomAppBar(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      CupertinoIcons.arrow_left_circle_fill,
                      color: Colors.black,
                      size: 32.sp,
                    ),
                    onPressed: () {
                      if (_currentPage > 0) {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                  SizedBox(width: 16.h),
                  Text(
                    "${_currentPage + 1}/${_buildPages().length}",
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  SizedBox(width: 16.h),
                  IconButton(
                    icon: Icon(
                      CupertinoIcons.arrow_right_circle_fill,
                      color: Colors.black,
                      size: 32.sp,
                    ),
                    onPressed: () {
                      if (_currentPage < _buildPages().length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
