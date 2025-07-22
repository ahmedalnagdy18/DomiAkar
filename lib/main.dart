import 'package:domi_aqar/core/common/app_asset_image.dart';
import 'package:domi_aqar/core/shared_prefrances/shared_prefrances.dart';
import 'package:domi_aqar/features/authentication/presentation/screens/email_activation_page.dart';
import 'package:domi_aqar/features/authentication/presentation/screens/login_page.dart';
import 'package:domi_aqar/features/authentication/presentation/screens/select_role_page.dart';
import 'package:domi_aqar/features/home/presentation/screens/main_page.dart';
import 'package:domi_aqar/features/onboarding/screens/onboarding_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'firebase_options.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await SharedPrefrance.instanc.initialization();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PrecacheWrapper(child: LandingPage()),
    );
  }
}

class PrecacheWrapper extends StatefulWidget {
  final Widget child;
  const PrecacheWrapper({required this.child, super.key});

  @override
  State<PrecacheWrapper> createState() => _PrecacheWrapperState();
}

class _PrecacheWrapperState extends State<PrecacheWrapper> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(AssetImage(AppAssetImage.logo), context);
    precacheImage(AssetImage(AppAssetImage.andriodSplash), context);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool _loading = true;
  Widget _screen = const OnboardingPage();

  @override
  void initState() {
    super.initState();

    // Listen to auth state changes
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        setState(() {
          _screen = const OnboardingPage();
          _loading = false;
        });
      } else {
        _checkUserStatus(user);
      }
    });
  }

  Future<void> _checkUserStatus(User user) async {
    await user.reload();
    final refreshedUser = FirebaseAuth.instance.currentUser;

    if (refreshedUser != null && refreshedUser.emailVerified) {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(refreshedUser.uid)
          .get();

      final role = userDoc.data()?['role'];

      setState(() {
        if (role == null || role.toString().isEmpty) {
          _screen = SelectRolePage();
        } else {
          _screen = const MainPage();
        }
        _loading = false;
      });
    } else {
      setState(() {
        _screen = const EmailActivationPage(isForgetPassword: false);
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool hasSeenOnboarding = SharedPrefrance.instanc.isOnboardingShown();
    if (_loading) {
      return const Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: CircularProgressIndicator.adaptive()),
      );
    }
    return hasSeenOnboarding == true ? LoginPage() : _screen;
  }
}
