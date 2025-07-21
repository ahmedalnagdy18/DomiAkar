import 'package:domi_aqar/core/common/app_asset_image.dart';
import 'package:domi_aqar/features/onboarding/screens/onboarding_page.dart';
import 'package:domi_aqar/firebase_options.dart';
import 'package:domi_aqar/injection_container.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const PrecacheWrapper(child: OnboardingPage()));
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
