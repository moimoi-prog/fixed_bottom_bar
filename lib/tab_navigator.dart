import 'package:fixed_bottom_tab/routes.dart';
import 'package:fixed_bottom_tab/tab_type.dart';
import 'package:flutter/material.dart';

class TabNavigator extends StatelessWidget {
  const TabNavigator({
    Key? key,
    required this.tabItem,
    required this.navigationKey,
  }) : super(key: key);

  final TabType tabItem;
  final GlobalKey<NavigatorState> navigationKey;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigationKey,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          // RootPageの各タブの先頭ページの場合
          return MaterialPageRoute<Widget>(
            builder: (context) {
              return routes[tabItem.toRouteName]!(context);
            },
          );
        } else {
          return MaterialPageRoute<Widget>(
            builder: (context) {
              return routes[settings.name!]!(context);
            },
            settings: RouteSettings(
              arguments: settings.arguments,
            ),
            // fullscreenDialog: true,
          );
        }
      },
    );
  }
}
