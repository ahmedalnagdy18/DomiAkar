import 'package:equatable/equatable.dart';

class UserDataModel extends Equatable {
  final String username;
  final String email;
  final String phone;
  final String role;
  final String companyName;
  final String image;

  const UserDataModel({
    required this.username,
    required this.email,
    required this.phone,
    required this.role,
    required this.companyName,
    required this.image,
  });

  @override
  List<Object?> get props => [
        username,
        email,
        phone,
        role,
        companyName,
        image,
      ];
}
