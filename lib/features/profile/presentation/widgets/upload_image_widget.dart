import 'package:domi_aqar/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class UploadImageWidget extends StatelessWidget {
  const UploadImageWidget({super.key, this.ontap});
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          InkWell(
            onTap: ontap,
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.gray100,
              ),
              child: Icon(
                Icons.person_2_outlined,
                size: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary600,
              ),
              child: Icon(
                Icons.camera_enhance,
                size: 14,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
