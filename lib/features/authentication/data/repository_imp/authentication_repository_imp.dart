import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domi_aqar/features/authentication/data/models/api_login_input.dart';
import 'package:domi_aqar/features/authentication/data/models/api_sign_up_input.dart';
import 'package:domi_aqar/features/authentication/domain/entity/login_input.dart';
import 'package:domi_aqar/features/authentication/domain/entity/sign_up_input.dart';
import 'package:domi_aqar/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
          password: ApiLoginInput.fromInput(input).passWord ?? '');
      return;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
      } else if (e.code == 'wrong-password') {}
      rethrow;
    }
  }
}
