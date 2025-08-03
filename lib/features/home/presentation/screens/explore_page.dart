import 'package:domi_aqar/core/colors/app_colors.dart';
import 'package:domi_aqar/features/home/presentation/screens/timeline_page.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;
  @override
  void initState() {
    tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grayTrue100,
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
              indicatorWeight: 1,
              indicatorAnimation: TabIndicatorAnimation.elastic,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.symmetric(
                horizontal: 12,
              ),
              labelPadding: EdgeInsets.zero,
              controller: tabController,
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              unselectedLabelColor: AppColors.grayNeutral400,
              labelColor: AppColors.primary600,
              indicatorColor: AppColors.primary600,
              labelStyle: TextStyle(fontSize: 14),
              tabs: const [
                Tab(text: 'Companies'),
                Tab(text: 'Public'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [
                  TimelinePage(),
                  TimelinePage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
