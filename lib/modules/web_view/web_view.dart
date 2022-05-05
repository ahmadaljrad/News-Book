import 'package:flutter/material.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  final String url;
  const WebViewPage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(context: context, title: "More Info"),
        body: WebView(
          initialUrl: url,
        ),
      ),
    );
  }
}
