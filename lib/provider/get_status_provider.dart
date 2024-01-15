import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

 String WHATSAPP_PATH =
    "/storage/emulated/0/Android/media/com.whatsapp/WhatsApp/Media/.Statuses/";
class GetStatusProvider extends ChangeNotifier {
  List<FileSystemEntity> _getImages = [];
  List<FileSystemEntity> _getVideos = [];

  bool _isWhatsappAvailable = false;

  List<FileSystemEntity> get getImages => _getImages;
  List<FileSystemEntity> get getVideos => _getVideos;

  bool get isWhatsappAvailable => _isWhatsappAvailable;

  void getStatus(String ext) async {
    Map<Permission, PermissionStatus> result = await [
      Permission.storage,
      Permission.manageExternalStorage,
    ].request();

    //if permission is granted only then show home screen else permission error screen is already shown
    if (result[Permission.storage] == PermissionStatus.granted &&
        result[Permission.manageExternalStorage] == PermissionStatus.granted) {}
    final status = await Permission.storage.request();
    final statusDirectory = await getExternalStorageDirectory();
    if (status.isDenied) {
      Permission.storage.request();
      log("Permission denied");
      return;
    }


    if (status.isGranted) {
      final directory = Directory(WHATSAPP_PATH);
      log(directory.path);
      if (directory.existsSync()) {
        var items = await Directory(WHATSAPP_PATH).list().toList();
        print("items $items");
        if (ext == ".mp4") {
          _getVideos =
              items.where((element) => element.path.endsWith(".mp4")).toList();
          notifyListeners();
        } else {
          _getImages = items
              .where((element) =>
          element.path.endsWith(".jpg") ||
              element.path.endsWith(".png"))
              .toList();
          notifyListeners();
        }

        _isWhatsappAvailable = true;
        notifyListeners();

        log(items.toString());
      } else {
        log("No whatsapp found");
        _isWhatsappAvailable = false;
        notifyListeners();
      }
    }
  }
}
