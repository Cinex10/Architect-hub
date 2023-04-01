import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImagesCarousel extends StatefulWidget {
  ImagesCarousel({
    super.key,
    required this.images,
    required this.initialIndex,
  });

  final List<String> images;
  final int initialIndex;

  @override
  State<ImagesCarousel> createState() => _ImagesCarouselState();
}

class _ImagesCarouselState extends State<ImagesCarousel> {
  late final PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 1.sw > 900 ? 0.2.sw : 10,
        vertical: 200.h,
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: PageView(
                controller: _pageController,
                physics: const BouncingScrollPhysics(),
                children: List.generate(
                  widget.images.length,
                  (index) => Image.asset(
                    widget.images[index],
                  ),
                ),
              ),
            ),
          ),
          SmoothPageIndicator(
            effect: ScrollingDotsEffect(
              // spacing: 8.0,
              // radius: 4.0,
              dotWidth: 8,
              dotHeight: 8,
              maxVisibleDots: 5,
              // strokeWidth: 1.5,
              dotColor: Colors.white.withOpacity(0.5),
              activeDotColor: Colors.white,
            ),
            controller: _pageController,
            count: widget.images.length,
          ),
        ],
      ),
    );
  }
}
