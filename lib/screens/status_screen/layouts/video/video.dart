import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:statusdowloader/provider/get_status_provider.dart';
import 'package:statusdowloader/screens/status_screen/layouts/video/video_view.dart';
import 'package:statusdowloader/utility/app_colors.dart';
import 'package:statusdowloader/utility/app_fonts.dart';
import 'package:statusdowloader/utility/app_sizer.dart';
import 'package:statusdowloader/utility/app_strings.dart';
import 'package:statusdowloader/utility/get_thumbnails.dart';
import 'package:statusdowloader/widgets/common_back_button.dart';

class VideoHomePage extends StatefulWidget {
  const VideoHomePage({Key? key}) : super(key: key);

  @override
  State<VideoHomePage> createState() => _VideoHomePageState();
}

class _VideoHomePageState extends State<VideoHomePage> {
  bool _isFetched = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Consumer<GetStatusProvider>(builder: (context, file, child) {
        if (_isFetched == false) {
          file.getStatus(".mp4");
          Future.delayed(const Duration(microseconds: 1), () {
            _isFetched = true;
          });
        }
        return file.isWhatsappAvailable == false
            ? const Center(
                child: Text("Whatsapp not available"),
              )
            : file.getVideos.isEmpty
                ? const Center(
                    child: Text("No Video available"),
                  )
                : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                          padding: const EdgeInsets.all(20),
                          child: GridView(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8),
                            children: List.generate(file.getVideos.length, (index) {
                              final data = file.getVideos[index];
                              return FutureBuilder<String>(
                                  future: getThumbnail(data.path),
                                  builder: (context, snapshot) {
                                    return snapshot.hasData
                                        ? GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                CupertinoPageRoute(
                                                    builder: (_) => VideoView(
                                                          videoPath: data.path,
                                                        )),
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image:
                                                        FileImage(File(snapshot.data!)),
                                                    fit: BoxFit.cover,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10)),
                                            ),
                                          )
                                        : const Center(
                                            child: CircularProgressIndicator(color: AppColor.colorGreen,strokeWidth: 2),
                                          );
                                  });
                            }),
                          ),
                        ),
                    ),
                  ],
                );
      })),
    );
  }
}
