import 'package:fluttertoast/fluttertoast.dart';

 flutterToast({required String str}){
  Fluttertoast.showToast(
      msg: str,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 1,
      fontSize: 16.0
  );
}