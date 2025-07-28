import 'package:domi_aqar/core/colors/app_colors.dart';
import 'package:domi_aqar/core/common/main_appbar_widget.dart';
import 'package:domi_aqar/features/home/presentation/widgets/item_body_widget.dart';
import 'package:flutter/material.dart';

class SeeMorePage extends StatelessWidget {
  const SeeMorePage({super.key, required this.appbarTitle});
  final String appbarTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayTrue100,
      appBar: CustomAppBar(title: appbarTitle),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.only(top: 22, bottom: 50),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ItemBodyWidget();
                },
                separatorBuilder: (context, index) => SizedBox(height: 12),
                itemCount: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
