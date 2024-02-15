import 'package:fast_food/config/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../../config/routes/routes_path.dart';
import '../../../../../core/components/custom_navigatation.dart';
import '../../../../../core/components/custom_smooth_indicator.dart';
import '../../../../../generated/assets.dart';
import 'on_boarding_item.dart';
import 'on_boarding_item_content/on_boarding_item_content.dart';

class OnBoardingScreenBody extends StatefulWidget {
  const OnBoardingScreenBody({super.key});

  @override
  State<OnBoardingScreenBody> createState() => _OnBoardingScreenBodyState();
}

class _OnBoardingScreenBodyState extends State<OnBoardingScreenBody> {
  List<OnBoardingItemContent> getItems(BuildContext context) {
    return [
      OnBoardingItemContent(
        title: AppLocalizations.of(context)!.onBoardingTitleOne,
        description: AppLocalizations.of(context)!.onBoardingDescriptionOne,
        image: Assets.onBoardingMealOne,
      ),
      OnBoardingItemContent(
        title: AppLocalizations.of(context)!.onBoardingTitleTwo,
        description: AppLocalizations.of(context)!.onBoardingDescriptionTwo,
        image: Assets.onBoardingMealTwo,
      ),
      OnBoardingItemContent(
        title: AppLocalizations.of(context)!.onBoardingTitleThree,
        description: AppLocalizations.of(context)!.onBoardingDescriptionThree,
        image: Assets.onBoardingMealThree,
      ),
    ];
  }

// Usage
  PageController pageController = PageController();

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            onPageChanged: _onPageChanged,
            controller: pageController,
            itemCount: getItems(context).length,
            itemBuilder: (context, index) => OnBoardingItem(
              onBoardingItemContent:
                  getItems(context)[index], //getItems(context)[index], ,
              context: context,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomSmoothIndicator(
                  pageController: pageController,
                  count: getItems(context).length),
              FloatingActionButton(
                shape: const CircleBorder(),
                backgroundColor: const Color(AppColors.kPrimaryColor),
                onPressed: () {
                  if (isLast) {
                    CustomNavigation.navigateAndFinishNyNamed(
                        context, RoutePath.login);
                  } else {
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.fastEaseInToSlowEaseOut);
                  }
                },
                child: const Icon(
                  IconlyBroken.arrowRight,
                  color: Color(AppColors.kWhiteColor),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _onPageChanged(index) {
    if (index == getItems(context).length - 1) {
      setState(() {
        isLast = true;
      });
    } else {
      setState(() {
        isLast = false;
      });
    }
  }
}
