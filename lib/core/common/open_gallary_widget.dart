import 'package:domi_aqar/core/fonts/app_text.dart';
import 'package:flutter/material.dart';

class OpenGallaryWidget extends StatelessWidget {
  const OpenGallaryWidget({
    super.key,
    required this.photosTap,
    this.videosTap,
    required this.enableVideo,
  });
  final Function()? photosTap;
  final Function()? videosTap;
  final bool enableVideo;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Colors.white,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
            top: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Upload',
                    style: AppTexts.regularBody,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      size: 24,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              const Divider(),
              SizedBox(height: 16),
              InkWell(
                onTap: photosTap,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.photo,
                      size: 24,
                    ),
                    SizedBox(width: 14),
                    Text(
                      'photos',
                      style: AppTexts.regularBody,
                    )
                  ],
                ),
              ),
              SizedBox(height: 25),
              enableVideo == true
                  ? InkWell(
                      onTap: videosTap,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.camera_alt_outlined,
                            size: 24,
                          ),
                          SizedBox(width: 14),
                          Text(
                            'videos',
                            style: AppTexts.regularBody,
                          )
                        ],
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
