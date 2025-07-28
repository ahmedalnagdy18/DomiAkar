import 'package:domi_aqar/core/colors/app_colors.dart';
import 'package:domi_aqar/core/fonts/app_text.dart';
import 'package:flutter/material.dart';

class ItemBodyWidget extends StatelessWidget {
  const ItemBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              width: 80,
              height: 62,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
              ),
              child: Image.asset('assets/images/house_model.png'),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    overflow: TextOverflow.ellipsis,
                    'Takatea Homestay',
                    style: AppTexts.meduimBody,
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
                            style: AppTexts.verySmallBody.copyWith(
                              color: AppColors.grayNeutral400,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    '\$320/month',
                    style: AppTexts.verySmallBody,
                  )
                ],
              ),
            ),
            Icon(Icons.favorite_border_outlined)
          ],
        ),
        SizedBox(height: 4),
        Divider(color: AppColors.grayNeutral200),
      ],
    );
  }
}
