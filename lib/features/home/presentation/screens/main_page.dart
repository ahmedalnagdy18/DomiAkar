import 'package:domi_aqar/features/home/presentation/screens/home_page.dart';
import 'package:domi_aqar/features/profile/presentation/screens/my_profile_page.dart';
import 'package:domi_aqar/features/home/presentation/screens/timeline_page.dart';
import 'package:domi_aqar/features/home/presentation/widgets/bottom_navigationbar_widget.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List name = [];
  int selectedindex = 0;

  @override
  void initState() {
    name.addAll([
      const HomePage(),
      const TimelinePage(),
      const TimelinePage(),
      const TimelinePage(),
      const MyProfilePage(),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: name.elementAt(selectedindex),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBarWidget(
            currentIndex: selectedindex,
            onTap: _onItemTapped,
          ),
        ));
  }

  void _onItemTapped(int value) {
    setState(() {
      selectedindex = value;
    });
  }
}
