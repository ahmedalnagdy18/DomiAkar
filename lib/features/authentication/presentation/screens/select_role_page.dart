import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domi_aqar/core/colors/app_colors.dart';
import 'package:domi_aqar/core/common/app_buttons.dart';
import 'package:domi_aqar/core/common/textfield.dart';
import 'package:domi_aqar/core/extentions/app_extentions.dart';
import 'package:domi_aqar/core/fonts/app_text.dart';
import 'package:domi_aqar/core/routes/navigation_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SelectRolePage extends StatefulWidget {
  const SelectRolePage({super.key});

  @override
  State<SelectRolePage> createState() => _SelectRolePageState();
}

class _SelectRolePageState extends State<SelectRolePage> {
  final TextEditingController _companyNameController = TextEditingController();
  String _selectedRole = 'person';
  String? userName;

  @override
  void initState() {
    super.initState();
    fetchUserName();
  }

  Future<void> fetchUserName() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      setState(() {
        userName = doc.data()?['name'] ?? 'User';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                Text('Complete your profile ', style: AppTexts.smallHeading),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
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
                            Icons.add,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Align(
                    alignment: Alignment.center,
                    child:
                        Text(userName ?? 'User', style: AppTexts.regularBody)),
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

                    // Check role
                    String role = _selectedRole;
                    String? companyName;
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
                      final userDoc = FirebaseFirestore.instance
                          .collection('users')
                          .doc(user.uid);

                      final dataToUpdate = {
                        'role': role,
                        'updatedAt': FieldValue.serverTimestamp(),
                        if (companyName != null) 'companyName': companyName,
                        // 'image': imageUrl, // ممكن تضيف ده بعد رفع الصورة
                      };

                      await userDoc.update(dataToUpdate);

                      // Navigator.pushReplacementNamed(context, '/home');
                      if (!context.mounted) return;
                      NavigationHelper.goToMainPage(context);
                    } catch (e) {
                      showErrorToastMessage(
                          message: 'Failed to update user profile');
                      print('Error updating user: $e');
                    }
                  },
                  text: 'Continue',
                ),

                // MainAppButton(
                //   onPressed: () {
                //     if (_selectedRole == 'company') {
                //       if (_companyNameController.text.isEmpty) {
                //         showErrorToastMessage(
                //             message: 'You must write campany name');
                //       } else {
                //         //    print('push with campany name');
                //       }
                //     }
                //     // print('$_selectedRole');
                //   },
                //   text: 'Continue',
                // ),
                SizedBox(height: 22),
              ],
            ),
          ),
        ),
      ),
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
