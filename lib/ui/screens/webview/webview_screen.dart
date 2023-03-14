import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  const WebViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String htmlString = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTML Screen'),
      ),
      body: WebView(
        initialUrl:
            'data:text/html;base64,${base64Encode(const Utf8Encoder().convert(htmlString))}',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}


















// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// //import 'package:path_provider/path_provider.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// // #docregion platform_imports
// // Import for Android features.
// import 'package:webview_flutter_android/webview_flutter_android.dart';
// // Import for iOS features.
// import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

// class WebViewScreen extends StatefulWidget {
//   const WebViewScreen({super.key});

//   @override
//   State<WebViewScreen> createState() => _WebViewScreenState();
// }

// class _WebViewScreenState extends State<WebViewScreen> {
//   late String uri;
//   late WebViewController controller;

//   @override
//   void initState() {
//     super.initState();
//     // #docregion platform_features
//     late final PlatformWebViewControllerCreationParams params;
//     if (WebViewPlatform.instance is WebKitWebViewPlatform) {
//       params = WebKitWebViewControllerCreationParams(
//         allowsInlineMediaPlayback: true,
//         mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
//       );
//     } else {
//       params = const PlatformWebViewControllerCreationParams();
//     }

//     final WebViewController controller =
//         WebViewController.fromPlatformCreationParams(params);
//     // #enddocregion platform_features

//     controller
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(const Color(0x00000000))
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (int progress) {
//             // Update loading bar.
//           },
//           onPageStarted: (String url) {},
//           onPageFinished: (String url) {},
//           onWebResourceError: (WebResourceError error) {},
//           onNavigationRequest: (NavigationRequest request) {
//             if (request.url.startsWith('https://www.youtube.com/')) {
//               return NavigationDecision.prevent;
//             }
//             return NavigationDecision.navigate;
//           },
//         ),
//       )
//       ..loadRequest(Uri.parse(uri));
//   }

//   @override
//   Widget build(BuildContext context) {
//     uri = ModalRoute.of(context)?.settings.arguments as String;
//     return WebViewWidget(controller: controller);
//   }
// }


// //var controller = WebViewController()
//                     // ..setJavaScriptMode(JavaScriptMode.unrestricted)
//                     // ..setBackgroundColor(const Color(0x00000000))
//                     // ..setNavigationDelegate(
//                     //   NavigationDelegate(
//                     //     onProgress: (int progress) {
//                     //       // Update loading bar.
//                     //     },
//                     //     onPageStarted: (String url) {},
//                     //     onPageFinished: (String url) {},
//                     //     onWebResourceError: (WebResourceError error) {},
//                     //     onNavigationRequest: (NavigationRequest request) {
//                     //       if (request.url.startsWith('https://www.youtube.com/')) {
//                     //         return NavigationDecision.prevent;
//                     //       }
//                     //       return NavigationDecision.navigate;
//                     //     },
//                     //   ),
//                     // )
//                     // ..loadRequest(Uri.parse('https://flutter.dev'));
//                     //                     Navigator.push(
//                     //                       context,
//                     //                       MaterialPageRoute(
//                     //                         builder: (context) => WebViewWidget(
//                     //                           initialUrl:
//                     //                               'data:text/html;base64,${base64Encode(utf8.encode(response))}',
//                     //                         ),
//                     //                       ),
//                     //                     );
//                     //                   }
