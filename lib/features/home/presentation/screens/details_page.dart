import 'package:domi_aqar/core/colors/app_colors.dart';
import 'package:domi_aqar/core/common/app_buttons.dart';
import 'package:domi_aqar/core/common/main_appbar_widget.dart';
import 'package:domi_aqar/core/fonts/app_text.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayTrue100,
      appBar: CustomAppBar(
        title: 'Details',
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 22),
            child: Row(
              children: [
                Icon(Icons.share_outlined),
                SizedBox(width: 16),
                Icon(Icons.favorite_border_outlined),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  width: double.infinity,
                  height: 235,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Image.asset(
                    'assets/images/house_model.png',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 12),
                SizedBox(
                  height: 75,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    separatorBuilder: (context, index) => SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      return Container(
                        clipBehavior: Clip.antiAlias,
                        width: 76,
                        height: 72,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset(
                          'assets/images/house_model.png',
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 22),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('House Title',
                        style: AppTexts.smallHeading.copyWith(fontSize: 18)),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '\$310',
                            style: AppTexts.meduimBody
                                .copyWith(color: AppColors.primary700),
                          ),
                          TextSpan(
                            text: '/month',
                            style: AppTexts.meduimBody
                                .copyWith(color: AppColors.grayNeutral400),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: AppColors.grayNeutral400,
                      size: 20,
                    ),
                    Expanded(
                      child: Text('Damietta, new Damietta',
                          overflow: TextOverflow.ellipsis,
                          style: AppTexts.smallBody.copyWith(
                            color: AppColors.grayNeutral400,
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Text('Property Details', style: AppTexts.smallHeading),
                SizedBox(height: 20),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    _buildDetailItem('Bedrooms', '3', Icons.bed),
                    _buildDetailItem('Bathub', '2', Icons.bathtub),
                    _buildDetailItem('Area', '1,880 sqft', Icons.square_foot),
                    _buildDetailItem('Build', '2020'),
                    _buildDetailItem('Parking', '1 Indoor'),
                    _buildDetailItem('Status', 'For Rent'),
                  ],
                ),
                SizedBox(height: 40),
                Text('Description', style: AppTexts.smallHeading),
                SizedBox(height: 10),
                Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. 1500s, when an unknown printer took when an unknown printer took a type.... Read more',
                  style: AppTexts.smallBody.copyWith(
                    color: AppColors.grayNeutral400,
                  ),
                ),
                SizedBox(height: 30),
                Text('Agent', style: AppTexts.smallHeading),
                SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.error300,
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              overflow: TextOverflow.ellipsis,
                              'Elkema',
                              style: AppTexts.meduimBody),
                          Text(
                            'Real Estate Agent',
                            style: AppTexts.verySmallBody.copyWith(
                              color: AppColors.grayNeutral400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: MainAppButton(
            onPressed: () {},
            text: 'Rent now',
          ),
        ),
      ),
    );
  }
}

Widget _buildDetailItem(String title, String value, [IconData? icon]) {
  return SizedBox(
    width: 100,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (icon != null) ...[
              Icon(icon, size: 16, color: Colors.grey),
              SizedBox(width: 4),
            ],
            Text(title, style: TextStyle(color: Colors.grey)),
          ],
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
