import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:statusdowloader/utility/app_colors.dart';
import 'package:statusdowloader/utility/app_fonts.dart';
import 'package:statusdowloader/utility/app_sizer.dart';
import 'package:statusdowloader/utility/app_strings.dart';
import 'package:statusdowloader/widgets/common_back_button.dart';

import '../../widgets/common_appbar.dart';
import 'layouts/image/image.dart';
import 'layouts/video/video.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List<Widget> pages = const [ImageHomePage(), VideoHomePage()];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this)..addListener(() {
      setState(() {
        print("indicator ");
      });
    });

    super.initState();
  }

  int _selectedIndex = 0;

  void _handleTabSelection(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
             Column(
              children: [
                CommonAppBar(str: AppString.strStatus.tr,isTrailIcon: true),

              ],
            ),
            hBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColor.colorWhiteAccent,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: TabBar(
                    dividerColor: AppColor.colorWhiteAccent,
                    indicator: BoxDecoration(
                        color: AppColor.colorGreen,
                        borderRadius: BorderRadius.circular(12)),
                    controller: _tabController,
                    onTap: _handleTabSelection,
                    tabs: [
                      Center(
                          child: _buildTab(
                              AppString.strImages.tr,
                              _selectedIndex == 0
                                  ? AppColor.whiteColor
                                  : AppColor.colorGrey)),
                      Center(
                          child: _buildTab(
                              AppString.strVideos.tr,
                              _selectedIndex == 1
                                  ? AppColor.whiteColor
                                  : AppColor.colorGrey)),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  pages[0],
                  pages[1],

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String text, Color color) {
    return SizedBox(
      height: 38,
      child: Tab(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            text,
            style: TS.fontStyle.sfFont16(color, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent(Color color) {
    return Container(
      color: color,
    );
  }
}
