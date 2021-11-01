import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../consts/app_colors.dart';
import '../../../consts/app_defaults.dart';
import '../../../consts/app_images.dart';
import '../../../consts/app_sizes.dart';
import '../../../models/intro.dart';
import '../../themes/text.dart';
import '../02_auth/login.dart';

class IntroScreens extends StatefulWidget {
  const IntroScreens({Key? key}) : super(key: key);

  @override
  _IntroScreensState createState() => _IntroScreensState();
}

class _IntroScreensState extends State<IntroScreens> {
  // Add or remove intro from here
  List<Intro> _allIntros = [
    Intro(
      title: 'Podcast is future',
      imageLocation: AppImages.INTRO_0,
      description:
          'A podcast is an episodic series of spoken word digital audio files that a user can download to a personal device for easy listening.',
    ),
    Intro(
      title: 'Why Podcast App?',
      imageLocation: AppImages.INTRO_1,
      description:
          'The cost to the consumer is low, with many podcasts free to download. Some are underwritten by corporations or sponsored, with the inclusion of commercial advertisements.',
    ),
    Intro(
      title: 'Learn From The best',
      imageLocation: AppImages.INTRO_2,
      description:
          ' In other cases, a podcast could be a business venture supported by some combination of a paid subscription model, advertising or product delivered after sale.',
    ),
  ];

  /// Page Controller
  late PageController _pageController;

  /// Tracks currently active page
  RxInt _currentPage = 0.obs;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _currentPage.close();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(AppSizes.DEFAULT_PADDING),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /* <---- Images And Title ----> */
              Expanded(
                child: PageView.builder(
                    controller: _pageController,
                    itemCount: _allIntros.length,
                    onPageChanged: (value) {
                      _currentPage.value = value;
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              _allIntros[index].imageLocation,
                            ),
                            Text(
                              _allIntros[index].title,
                              style: AppText.h6.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            AppSizes.hGap10,
                            Text(
                              _allIntros[index].description,
                              style: AppText.caption,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    }),
              ),

              /* <---- Intro Dots ----> */
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _allIntros.length,
                    (index) => _IntroDots(
                      active: _currentPage.value == index,
                    ),
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.to(() => LoginScreen());
                      },
                      child: Text('SKIP'),
                    ),
                    InkWell(
                      borderRadius: AppDefaults.defaulBorderRadius,
                      onTap: () {
                        if (_currentPage.value == _allIntros.length - 1) {
                          Get.to(() => LoginScreen());
                        } else {
                          _pageController.animateToPage(
                            _currentPage.value + 1,
                            duration: AppDefaults.defaultDuration,
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.PRIMARY_COLOR,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
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
}

class _IntroDots extends StatelessWidget {
  const _IntroDots({
    Key? key,
    required this.active,
  }) : super(key: key);

  final bool active;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppDefaults.defaultDuration,
      width: 15,
      height: 15,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: active
            ? AppColors.PRIMARY_COLOR
            : AppColors.PRIMARY_COLOR.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
    );
  }
}
