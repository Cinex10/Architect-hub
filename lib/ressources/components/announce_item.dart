import 'package:architect_hub/ressources/color_manager.dart';
import 'package:architect_hub/ressources/styles_manager.dart';
import 'package:architect_hub/ressources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AnnounceItem extends StatefulWidget {
  const AnnounceItem({
    Key? key,
    required this.isFavor,
    required this.itemCount,
  }) : super(key: key);

  final bool isFavor;

  final int itemCount;

  @override
  State<AnnounceItem> createState() => _AnnounceItemState();
}

class _AnnounceItemState extends State<AnnounceItem> {
  double scrollPosition = 0.0;
  late bool isFavor;

  @override
  void initState() {
    super.initState();
    isFavor = widget.isFavor;
  }

  bool isEdgeEnd() => scrollPosition == widget.itemCount;
  bool isEdgeStart() => scrollPosition == 0;

  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 0,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: widget.itemCount,
                    itemBuilder: (context, index) => Container(
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/${(index % 2) + 1}.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: AppPadding.p12,
                  left: AppPadding.p12,
                  child: LikeButton(
                    size: 25,
                    circleColor: const CircleColor(
                      start: ColorManager.white,
                      end: ColorManager.red,
                    ),
                    bubblesColor: const BubblesColor(
                      dotPrimaryColor: ColorManager.white,
                      dotSecondaryColor: ColorManager.red,
                    ),
                    likeBuilder: (isLiked) {
                      return Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked
                            ? ColorManager.red
                            : ColorManager.white.withOpacity(0.65),
                        size: 25,
                      );
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Visibility(
                          visible: true,
                          child: IconButton(
                            onPressed: () {
                              _pageController.previousPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_sharp,
                              size: AppSize.s20,
                              color: ColorManager.white,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: true,
                          child: IconButton(
                            onPressed: () {
                              _pageController.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            },
                            icon: const Icon(
                              Icons.arrow_forward_ios_sharp,
                              size: AppSize.s20,
                              color: ColorManager.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: AppPadding.p6,
                    ),
                    child: SmoothPageIndicator(
                      effect: ScrollingDotsEffect(
                        // spacing: 8.0,
                        // radius: 4.0,
                        dotWidth: AppSize.s8,
                        dotHeight: AppSize.s8,
                        maxVisibleDots: 5,
                        // strokeWidth: 1.5,
                        dotColor: ColorManager.white.withOpacity(0.5),
                        activeDotColor: ColorManager.white,
                      ),
                      controller: _pageController,
                      count: widget.itemCount,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 10,
              left: 10,
              top: 3,
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.redAccent,
                  child: Text(
                    'A',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  'data',
                  style: getBoldStyle(
                    color: ColorManager.black,
                    fontSize: AppSize.s16,
                  ),
                ),
                const Spacer(
                  flex: 10,
                ),
                const Icon(
                  Icons.star,
                  size: 18,
                  color: Colors.black,
                ),
                Text(
                  ' 2.5',
                  style: getRegularStyle(
                    color: ColorManager.black,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
