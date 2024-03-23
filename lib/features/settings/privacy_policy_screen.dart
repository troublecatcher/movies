import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:movies/main.dart';

@RoutePage()
class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        previousPageTitle: 'Settings',
      ),
      child: SafeArea(
        bottom: false,
        child: privacyPolicy != null && privacyPolicy != ''
            ? InAppWebView(
                initialUrlRequest: URLRequest(
                  url: WebUri(privacyPolicy!),
                ),
              )
            : const Center(
                child: Text('Failed to load privacy policy'),
              ),
      ),
    );
  }
}
