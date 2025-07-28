import 'package:domi_aqar/core/common/app_buttons.dart';
import 'package:domi_aqar/core/common/inkweel_widget.dart';
import 'package:domi_aqar/core/extentions/app_extentions.dart';
import 'package:domi_aqar/core/fonts/app_text.dart';
import 'package:domi_aqar/core/routes/navigation_helper.dart';
import 'package:domi_aqar/core/shared_prefrances/shared_prefrances.dart';
import 'package:domi_aqar/features/onboarding/widgets/dots_widget.dart';
import 'package:domi_aqar/features/onboarding/widgets/onboarding_widget.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      final newPage = _pageController.page?.round() ?? 0;
      if (newPage != _currentPage) {
        setState(() {
          _opacity = 0.0; // fade out
        });

        Future.delayed(const Duration(milliseconds: 150), () {
          setState(() {
            _currentPage = newPage;
            _opacity = 1.0; // fade in
          });
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: _currentPage == 2
                    ? Text('')
                    : InkwellWidget(
                        onTap: () async {
                          NavigationHelper.goToRegisterPage(context);
                          await SharedPrefrance.instanc
                              .setOnboardingShown(true);
                        },
                        child: Text('Skip')),
              ),
              SizedBox(height: 20),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  itemCount: onboardingTitle.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: appHight(context, 0.35),
                          width: appWidth(context, 0.6),
                          child: Image.asset(onboardingImage[index]),
                        ),
                        const SizedBox(height: 20),
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: index == _currentPage ? _opacity : 0.0,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Text(
                                  onboardingTitle[index],
                                  style: AppTexts.meduimHeading,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Text(
                                  onboardingSubtitle[index],
                                  style: AppTexts.smallBody,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              DotsWidget(
                dotsCount: onboardingTitle.length,
                position: _currentPage,
              ),
              SizedBox(height: 30),
              MainAppButton(
                onPressed: () async {
                  if (_currentPage == 2) {
                    NavigationHelper.goToRegisterPage(context);
                    await SharedPrefrance.instanc.setOnboardingShown(true);
                  } else {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.decelerate);
                  }
                },
                text: _currentPage == 2 ? 'Get Start' : 'Next',
              )
            ],
          ),
        ),
      ),
    );
  }
}
