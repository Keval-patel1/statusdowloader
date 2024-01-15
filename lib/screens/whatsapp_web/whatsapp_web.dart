import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../utility/app_strings.dart';
import '../../widgets/common_appbar.dart';
class WhatsappWeb extends StatefulWidget {
  const WhatsappWeb({super.key});

  @override
  State<WhatsappWeb> createState() => _WhatsappWebState();
}

class _WhatsappWebState extends State<WhatsappWeb> {
  late final WebViewController controller;
  @override
  void initState() {
    loadWeb();
    super.initState();
  }
  void loadWeb(){
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.whatsapp.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://www.whatsapp.com/'));
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CommonAppBar(str: AppString.strWhatsWeb,isTrailIcon: false),

            Expanded(child: WebViewWidget(controller: controller)),
          ],
        ),
      ),
    );
  }
}
