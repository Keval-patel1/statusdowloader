import 'dart:developer';
import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:statusdowloader/utility/app_sizer.dart';
import 'package:video_player/video_player.dart';

import '../../../../utility/app_images.dart';
import '../../../../utility/app_strings.dart';
import '../../../../widgets/common_appbar.dart';
import '../../functions.dart';

class VideoView extends StatefulWidget {
  final String? videoPath;
  const VideoView({Key? key, this.videoPath}) : super(key: key);

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  ///list of buttons
  List<Widget> buttonsList = const [
    Icon(Icons.download),
    Icon(Icons.share),
  ];

  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();

    _chewieController = ChewieController(
        videoPlayerController: VideoPlayerController.file(
          File(widget.videoPath!),
        ),
        autoInitialize: true,
        autoPlay: true,
        looping: true,
        aspectRatio: 5 / 6,
        errorBuilder: ((context, errorMessage) {
          return Center(
            child: Text(errorMessage),
          );
        }));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _chewieController!.pause();
    _chewieController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
             CommonAppBar(str: AppString.strStatus.tr,isTrailIcon: true),

            Expanded(child: Center(child: Container(
                height: MediaQuery.of(context).size.width*1.2,
                child: Chewie(controller: _chewieController!)))),
            hBox(height: 40),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                InkWell(
                    onTap: (){
                      shareWhatsapp(widget.videoPath);
                    },
                    child: Image.asset(AppImages.iconWhatsapp,width: 45,)),InkWell(
                    onTap: ()async{
                      downloadStatus(widget.videoPath,context);
                    },
                    child: Image.asset(AppImages.iconDownload,width: 45,)),InkWell(
                    onTap: ()async{
                      shareStatus(widget.videoPath);
                    },
                    child: Image.asset(AppImages.iconShare,width: 45,)),
              ] ),
        ),
      ),
    );
  }
}
