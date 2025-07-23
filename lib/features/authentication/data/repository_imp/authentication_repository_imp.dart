import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domi_aqar/features/authentication/data/models/api_login_input.dart';
import 'package:domi_aqar/features/authentication/data/models/api_sign_up_input.dart';
import 'package:domi_aqar/features/authentication/domain/entity/login_input.dart';
import 'package:domi_aqar/features/authentication/domain/entity/model/user_data_model.dart';
import 'package:domi_aqar/features/authentication/domain/entity/sign_up_input.dart';
import 'package:domi_aqar/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;

class AuthenticationRepositoryImp implements AuthenticationRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> register(SignUpInput input) async {
    final apiInput = ApiSignUpInput.fromInput(input);

    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: apiInput.email,
        password: apiInput.password,
      );

      final user = credential.user;
      if (user == null) {
        throw FirebaseAuthException(
          code: 'user-null',
          message: 'User is null after registration.',
        );
      }

      await _firestore.collection('users').doc(user.uid).set({
        'username': apiInput.username,
        'email': apiInput.email,
        'phone': apiInput.phone,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException: ${e.code} - ${e.message}");
      rethrow;
    } catch (e, stack) {
      print("❌ Unexpected Error: $e");
      print("🧱 StackTrace: $stack");
      throw Exception('Failed to register user: $e');
    }
  }

  @override
  Future<void> login(LoginInput input) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: ApiLoginInput.fromInput(input).email ?? '',
        password: ApiLoginInput.fromInput(input).passWord ?? '',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // handle
      } else if (e.code == 'wrong-password') {
        // handle
      }
      rethrow;
    }
  }

  @override
  Future<String?> upload(File imageFile) async {
    const String uploadUrl = 'https://upload.imagekit.io/api/v1/files/upload';
    const String privateApiKey = 'private_SFrIO3/IuBX/pFZTYCijAgl1RVY=';

    try {
      final request = http.MultipartRequest('POST', Uri.parse(uploadUrl));

      // Use basic authentication with private API key
      final authHeader =
          'Basic ${base64Encode(utf8.encode('$privateApiKey:'))}';
      request.headers['Authorization'] = authHeader;

      request.fields['fileName'] = imageFile.path.split('/').last;
      request.fields['useUniqueFileName'] = 'true';

      request.files.add(await http.MultipartFile.fromPath(
        'file',
        imageFile.path,
        contentType: MediaType('image', 'jpeg'),
      ));

      final response = await request.send();

      if (response.statusCode == 200) {
        final respStr = await response.stream.bytesToString();
        final data = json.decode(respStr);
        return data['url'];
      } else {
        final error = await response.stream.bytesToString();
        print('❌ Failed to upload: ${response.statusCode}');
        print('💬 Response: $error');
        return null;
      }
    } catch (e) {
      print('Upload Error: $e');
      return null;
    }
  }

  @override
  Future<UserDataModel> userData() async {
    final user = _auth.currentUser;
    if (user == null) throw Exception('No logged in user');

    final doc = await _firestore.collection('users').doc(user.uid).get();
    final data = doc.data();
    if (data == null) throw Exception('User data not found');

    return UserDataModel(
      username: data['username'] ?? '',
      email: data['email'] ?? '',
      phone: data['phone'] ?? '',
      role: data['role'] ?? '',
      companyName: data['companyName'] ?? '',
      image: data['image'] ?? '',
    );
  }
}
