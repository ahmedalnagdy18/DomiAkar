import 'package:domi_aqar/core/colors/app_colors.dart';
import 'package:domi_aqar/core/common/inkweel_widget.dart';
import 'package:domi_aqar/core/fonts/app_text.dart';
import 'package:domi_aqar/core/routes/navigation_helper.dart';
import 'package:domi_aqar/features/home/presentation/widgets/item_body_widget.dart';
import 'package:flutter/material.dart';

class RecommendedWidget extends StatelessWidget {
  const RecommendedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recommended",
                style: AppTexts.smallHeading,
              ),
              InkwellWidget(
                onTap: () => NavigationHelper.goToSeeMorePage(
                    context: context, appbarTitle: 'Recommended'),
                child: Text(
                  "See all",
                  style:
                      AppTexts.smallBody.copyWith(color: AppColors.primary700),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 170,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 22),
            separatorBuilder: (context, index) => SizedBox(width: 16),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) {
              return Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    height: 165,
                    width: 225,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Image.asset(
                      'assets/images/house_model.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      'New dametta',
                      style: AppTexts.meduimBody.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class NearbyWidget extends StatelessWidget {
  const NearbyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Nearby",
                  style: AppTexts.smallHeading,
                ),
                InkwellWidget(
                  onTap: () => NavigationHelper.goToSeeMorePage(
                      context: context, appbarTitle: 'Nearby'),
                  child: Text(
                    "See all",
                    style: AppTexts.smallBody
                        .copyWith(color: AppColors.primary700),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              itemCount: 6,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 50,
                childAspectRatio: 1,
                mainAxisExtent: 200,
              ),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            clipBehavior: Clip.antiAlias,
                            height: 62,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Image.asset(
                              'assets/images/house_model.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    'Villa',
                                    style: AppTexts.meduimBody,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: AppColors.grayNeutral400,
                                      size: 16,
                                    ),
                                    Expanded(
                                      child: Text('Damietta, new Damietta',
                                          overflow: TextOverflow.ellipsis,
                                          style:
                                              AppTexts.verySmallBody.copyWith(
                                            color: AppColors.grayNeutral400,
                                          )),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4),
                                Expanded(
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    '\$320/month',
                                    style: AppTexts.verySmallBody,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 4),
                    Divider(color: AppColors.grayNeutral200),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class TopLocationWidget extends StatelessWidget {
  const TopLocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top Locations",
                style: AppTexts.smallHeading,
              ),
              Text(
                "See all",
                style: AppTexts.smallBody.copyWith(color: AppColors.primary700),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 50,
          child: ListView.separated(
            padding: const EdgeInsets.only(left: 22),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 12),
            itemCount: 6,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(6),
                height: 45,
                decoration: BoxDecoration(
                  color: AppColors.primary50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.grayNeutral300),
                ),
                child: Row(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset('assets/images/house_model.png'),
                    ),
                    SizedBox(width: 12),
                    Text('Elmahgob')
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class PopularWidget extends StatelessWidget {
  const PopularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular for you",
                style: AppTexts.smallHeading,
              ),
              InkwellWidget(
                onTap: () => NavigationHelper.goToSeeMorePage(
                    context: context, appbarTitle: 'Popular'),
                child: Text(
                  "See all",
                  style:
                      AppTexts.smallBody.copyWith(color: AppColors.primary700),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ItemBodyWidget();
            },
            separatorBuilder: (context, index) => SizedBox(height: 12),
            itemCount: 4,
          ),
        ),
      ],
    );
  }
}
