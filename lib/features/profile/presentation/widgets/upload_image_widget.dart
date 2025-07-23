import 'package:domi_aqar/core/colors/app_colors.dart';
import 'package:domi_aqar/features/authentication/domain/entity/model/user_data_model.dart';
import 'package:flutter/material.dart';

class UploadImageWidget extends StatefulWidget {
  const UploadImageWidget({super.key, this.ontap, required this.userData});
  final Function()? ontap;
  final UserDataModel userData;

  @override
  State<UploadImageWidget> createState() => _UploadImageWidgetState();
}

class _UploadImageWidgetState extends State<UploadImageWidget> {
  String? image;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          InkWell(
            onTap: widget.ontap,
            child: Container(
              clipBehavior: Clip.antiAlias,
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.gray100,
              ),
              child: widget.userData.image.isNotEmpty
                  ? Image.network(widget.userData.image)
                  : Icon(
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
