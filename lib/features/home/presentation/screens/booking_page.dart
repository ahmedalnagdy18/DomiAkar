import 'package:domi_aqar/core/colors/app_colors.dart';
import 'package:domi_aqar/core/common/main_appbar_widget.dart';
import 'package:domi_aqar/core/fonts/app_text.dart';
import 'package:flutter/material.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  String selectedTab = 'Upcoming';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayTrue100,
      appBar: CustomAppBar(title: 'My Booking'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 2),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.grayNeutral200,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buttonTap(
                    buttonText: 'Upcoming',
                    isSelected: selectedTab == 'Upcoming',
                    onPressed: () {
                      setState(() {
                        selectedTab = 'Upcoming';
                      });
                    },
                  ),
                  buttonTap(
                    buttonText: 'Completed',
                    isSelected: selectedTab == 'Completed',
                    onPressed: () {
                      setState(() {
                        selectedTab = 'Completed';
                      });
                    },
                  ),
                  buttonTap(
                    buttonText: 'Cancelled',
                    isSelected: selectedTab == 'Cancelled',
                    onPressed: () {
                      setState(() {
                        selectedTab = 'Cancelled';
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: Image.asset(
                          'assets/images/ops.png',
                          scale: 3,
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'You have no upcoming booking',
                        style: AppTexts.smallHeading,
                      ),
                      SizedBox(height: 12),
                      Text(
                        'are you looking fo a completed or cancelled booking ?',
                        style: AppTexts.smallBody
                            .copyWith(color: AppColors.grayNeutral400),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget buttonTap({
  required String buttonText,
  required bool isSelected,
  required void Function()? onPressed,
}) {
  return TextButton(
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      backgroundColor: WidgetStatePropertyAll(
        isSelected ? AppColors.primary600 : Colors.transparent,
      ),
    ),
    onPressed: onPressed,
    child: Text(
      buttonText,
      style: AppTexts.regularBody.copyWith(
        color: isSelected ? AppColors.white : AppColors.grayNeutral400,
      ),
    ),
  );
}
