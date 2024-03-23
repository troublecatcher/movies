import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:movies/main.dart';

@RoutePage()
class SupprotPageScreen extends StatelessWidget {
  const SupprotPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        previousPageTitle: 'Settings',
      ),
      child: SafeArea(
        bottom: false,
        child: support != null && support != ''
            ? InAppWebView(
                initialUrlRequest: URLRequest(
                  url: WebUri(support!),
                ),
              )
            : const Center(
                child: Text('Failed to load support'),
              ),
      ),
    );
  }
}
