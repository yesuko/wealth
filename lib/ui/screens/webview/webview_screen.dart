import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController _controller;
  late Map<Uri, Response> client;
  late Uri uri;
  late Response resp;

  @override
  void initState() {
    super.initState();

    uri = Uri.parse('https://www.youtube.com/');
    resp = Response("", 200);
    _controller = WebViewController()
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
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
        uri,
        // method: LoadRequestMethod.post,
        // headers: resp.headers,
        // body: resp.bodyBytes,
      );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    client = ModalRoute.of(context)?.settings.arguments as Map<Uri, Response>;
    uri = client.keys.first;
    resp = client.values.first;

    // _controller.loadRequest(
    //   uri,
    //   method: LoadRequestMethod.post,
    //   headers: resp.headers,
    //   body: resp.bodyBytes,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Web view')),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}
