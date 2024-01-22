import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:notification_reader/NotificationData.dart';
import 'package:notification_reader/notification_reader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:receive_whatsapp_chat/receive_whatsapp_chat.dart';
import 'package:statusdowloader/models/notificationhistory.dart';
import 'package:statusdowloader/utility/app_colors.dart';
import 'package:statusdowloader/utility/app_fonts.dart';
import 'package:statusdowloader/utility/app_sizer.dart';
import 'package:statusdowloader/utility/app_strings.dart';
import 'package:statusdowloader/widgets/common_back_button.dart';

import '../../widgets/common_appbar.dart';
import '../status_screen/layouts/image/image.dart';
import '../status_screen/layouts/video/video.dart';

class RecoverScreen extends StatefulWidget {
  const RecoverScreen({super.key});

  @override
  _RecoverScreenState createState() => _RecoverScreenState();
}

class _RecoverScreenState extends ReceiveWhatsappChat<RecoverScreen>
    with SingleTickerProviderStateMixin{
  TabController? _tabController;
  List<Widget> pages = const [ImageHomePage(), VideoHomePage()];
  List<NotificationData> titleList = [];
  @override
  void initState() {
    // NotificationHistory.
    _tabController = TabController(length: 2, vsync: this)..addListener(() {
      setState(() {
        print("indicator ");
      });
    });
    // getdata();
    // initPlatformState();
    // enableReceivingChatWithMedia();
    super.initState();
  }
  var res;
  Future<void> initPlatformState() async {
    final permission = await Permission.notification.request();

    print(permission);
    if (permission.isGranted) {
      await NotificationReader.openNotificationReaderSettings;
      NotificationData res = await NotificationReader.onNotificationRecieve();
      if (res.body != null) {
           res = await NotificationReader.onNotificationRecieve();
          print("res ${res.data['android.textLines']}");
          print("Helllo");
          if(res.packageName=="com.whatsapp") {
            if (titleList.contains(res)) {
              setState(() {
                titleList.add(res);
              });

            }
          }

      }
    }
  }


  int _selectedIndex = 0;


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
                    // onTap: _handleTabSelection,
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
                  Column(
                    children: [
                      ListView.builder(
                  itemCount: titleList.length,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                          return Text(titleList[index].packageName.toString());
                      }),
                    ],
                  ),
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

  @override
  void receiveChatContent(ChatContent chatContent) {
    // TODO: implement receiveChatContent
    print("chat content $chatContent");
  }
}
