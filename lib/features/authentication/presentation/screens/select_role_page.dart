import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domi_aqar/core/colors/app_colors.dart';
import 'package:domi_aqar/core/common/app_buttons.dart';
import 'package:domi_aqar/core/common/open_gallary_widget.dart';
import 'package:domi_aqar/core/common/textfield.dart';
import 'package:domi_aqar/core/extentions/app_extentions.dart';
import 'package:domi_aqar/core/fonts/app_text.dart';
import 'package:domi_aqar/core/routes/navigation_helper.dart';
import 'package:domi_aqar/core/shared_prefrances/shared_prefrances.dart';
import 'package:domi_aqar/features/authentication/presentation/cubits/upload_cubit/upload_cubit.dart';
import 'package:domi_aqar/injection_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SelectRolePage extends StatelessWidget {
  const SelectRolePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UploadCubit(uploadUsecase: sl()),
      child: const _SelectRolePage(),
    );
  }
}

class _SelectRolePage extends StatefulWidget {
  const _SelectRolePage();

  @override
  State<_SelectRolePage> createState() => _SelectRolePageState();
}

class _SelectRolePageState extends State<_SelectRolePage> {
  final TextEditingController _companyNameController = TextEditingController();
  String _selectedRole = 'person';
  String? userName;

  @override
  void initState() {
    super.initState();
    userName = SharedPrefrance.instanc.getUserName('userName');
  }

  @override
  void dispose() {
    _companyNameController.dispose();
    super.dispose();
  }

  File? selectedImage;
  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemp = File(image.path);
    setState(() => selectedImage = imageTemp);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadCubit, UploadState>(
      listener: (context, state) {
        // if (state is SuccessUpload) {
        //   NavigationHelper.goToMainPage(context);
        // }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: Text('Complete Profile', style: AppTexts.appbar),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 0.25,
            shadowColor: Colors.black,
            surfaceTintColor: Colors.white,
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 22),
                    Text('Complete your profile ',
                        style: AppTexts.smallHeading),
                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return OpenGallaryWidget(
                                  enableVideo: false,
                                  photosTap: () {
                                    pickImage();
                                    Navigator.pop(context);
                                  },
                                );
                              });
                        },
                        child: Stack(
                          alignment: selectedImage != null
                              ? Alignment.topRight
                              : Alignment.bottomRight,
                          children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.gray100,
                              ),
                              child: selectedImage != null
                                  ? Image.file(
                                      File(selectedImage?.path ?? ''),
                                      fit: BoxFit.cover,
                                    )
                                  : Icon(
                                      Icons.person_2_outlined,
                                      size: 30,
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
                                child: selectedImage != null
                                    ? InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectedImage = null;
                                          });
                                        },
                                        child: Icon(
                                          Icons.close,
                                          size: 18,
                                          color: Colors.white,
                                        ),
                                      )
                                    : Icon(
                                        Icons.add,
                                        size: 18,
                                        color: Colors.white,
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Align(
                        alignment: Alignment.center,
                        child: Text(userName ?? 'User',
                            style: AppTexts.regularBody)),
                    SizedBox(height: 33),
                    Text('Role', style: AppTexts.smallHeading),
                    SizedBox(height: 22),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildRoleOption('person', Icons.person, 'Person'),
                        _buildRoleOption('company', Icons.apartment, 'Company'),
                      ],
                    ),
                    if (_selectedRole == 'company') ...[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 33),
                          Text('Company name', style: AppTexts.smallHeading),
                          SizedBox(height: 14),
                          TextFieldWidget(
                            controller: _companyNameController,
                            hintText: 'Company name*',
                          ),
                        ],
                      ),
                    ],
                    SizedBox(height: 50),
                    MainAppButton(
                      onPressed: () async {
                        final user = FirebaseAuth.instance.currentUser;

                        if (user == null) {
                          showErrorToastMessage(message: 'User not found');
                          return;
                        }

                        String role = _selectedRole;
                        String? companyName;
                        String? imageUrl;

                        if (role == 'company') {
                          if (_companyNameController.text.trim().isEmpty) {
                            showErrorToastMessage(
                                message: 'You must write company name');
                            return;
                          } else {
                            companyName = _companyNameController.text.trim();
                          }
                        }

                        try {
                          if (selectedImage != null) {
                            // ✅ Upload image using ImageKit
                            await context
                                .read<UploadCubit>()
                                .uploadImage(selectedImage!);

                            final uploadState =
                                context.read<UploadCubit>().state;

                            if (uploadState is SuccessUpload) {
                              imageUrl = uploadState.imageUrl;
                            } else if (uploadState is ErrorUpload) {
                              showErrorToastMessage(
                                  message: uploadState.message);
                              return;
                            }
                          }

                          final userDoc = FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid);

                          final dataToUpdate = {
                            'role': role,
                            'updatedAt': FieldValue.serverTimestamp(),
                            if (companyName != null) 'companyName': companyName,
                            if (imageUrl != null) 'image': imageUrl,
                          };

                          await userDoc.update(dataToUpdate);

                          if (!context.mounted) return;
                          NavigationHelper.goToMainPage(context);
                        } catch (e) {
                          showErrorToastMessage(
                              message: 'Failed to update user profile');
                          print('Error updating user: $e');
                        }
                      },
                      text: state is LoadingUpload ? 'Loading...' : 'Continue',
                    ),
                    SizedBox(height: 22),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildRoleOption(String value, IconData icon, String label) {
    final bool isSelected = _selectedRole == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedRole = value;
        });
      },
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? AppColors.primary600 : AppColors.gray300,
                width: isSelected ? 3 : 1,
              ),
              color: AppColors.gray100,
            ),
            child: Icon(icon,
                size: 28,
                color: isSelected ? AppColors.primary600 : Colors.black54),
          ),
          const SizedBox(height: 8),
          Text(label,
              style: AppTexts.verySmallBody.copyWith(
                  color:
                      isSelected ? AppColors.primary600 : AppColors.gray600)),
        ],
      ),
    );
  }
}
