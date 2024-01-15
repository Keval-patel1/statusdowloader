import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:statusdowloader/provider/get_status_provider.dart';
import 'package:statusdowloader/provider/theme.dart';
import 'package:statusdowloader/screens/select_status_saver/select_status_saver.dart';
import 'package:provider/provider.dart';

import 'controller/app_controller.dart';

void main() {
  runApp(const MyApp());
}
MyTheme currentTheme = MyTheme();

AppController appController = Get.put(AppController());
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GetStatusProvider()),
        ChangeNotifierProvider(create: (_) => MyTheme()),
      ],
      child:   GetMaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:  ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,),
        useMaterial3: true,
      ),
      home: SelectStatusSaver(),
    ));
  }
}
