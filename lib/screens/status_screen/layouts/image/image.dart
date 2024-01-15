import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statusdowloader/provider/get_status_provider.dart';
import 'package:statusdowloader/utility/app_colors.dart';

import 'image_view.dart';

class ImageHomePage extends StatefulWidget {
  const ImageHomePage({Key? key}) : super(key: key);

  @override
  State<ImageHomePage> createState() => _ImageHomePageState();
}

class _ImageHomePageState extends State<ImageHomePage> {
  bool _isFetched = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Consumer<GetStatusProvider>(builder: (context, file, child) {
            if (_isFetched == false) {
              file.getStatus(".jpg");
              Future.delayed(const Duration(microseconds: 1), () {
                _isFetched = true;
              });
            }
            return file.isWhatsappAvailable == false
                ? const Center(
              child: Text("Whatsapp not available"),
            )
                : file.getImages.isEmpty
                ? const Center(
              child: Text("No image available"),
            )
                : Container(
              padding: const EdgeInsets.all(20),
              child: GridView(
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8),
                children: List.generate(file.getImages.length, (index) {
                  final data = file.getImages[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (_) => ImageView(
                              imagePath: data.path,
                            )),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColor.colorGreen,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(File(data.path))),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  );
                }),
              ),
            );
          })),
    );
  }
}
