import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:statusdowloader/provider/get_status_provider.dart';
import 'package:statusdowloader/provider/theme.dart';
import 'package:statusdowloader/screens/exit_page.dart';
import 'package:statusdowloader/screens/select_status_saver/select_status_saver.dart';
import 'package:provider/provider.dart';
import 'package:statusdowloader/utility/language/localization_service.dart';

import 'controller/app_controller.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  var s= sharedPreferences.getStringList('notification_history');
  print("shared pref $s");
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
        translations: LocalizationService(),
        locale: Locale('en','US'),
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
