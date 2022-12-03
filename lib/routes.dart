import 'package:fixed_bottom_tab/pages/pages.dart';
import 'package:fixed_bottom_tab/tab_type.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final Map<TabType, GlobalKey<NavigatorState>> tabNavigatorKeys = {
  TabType.home: GlobalKey<NavigatorState>(),
  TabType.taskList: GlobalKey<NavigatorState>(),
};

const rootRoute = '/';
const homeRoute = '/home';
const accountDetailRoute = '/account/detail';
const settingRoute = '/setting';
const taskListRoute = '/task/list';
const taskDetailRoute = '/task/detail';

Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  homeRoute: (BuildContext context) => const HomePage(),
  accountDetailRoute: (BuildContext context) => const AccountDetailPage(),
  settingRoute: (BuildContext context) => const SettingPage(),
  taskListRoute: (BuildContext context) => const TaskListPage(),
  taskDetailRoute: (BuildContext context) => const TaskDetailPage(),
};

List<String> showOutsideTabRouts = [
  settingRoute,
];

Future<T?> pushNamed<T extends Object?>(
  BuildContext context,
  String routeName, {
  Object? arguments,
}) {
  if (showOutsideTabRouts.contains(routeName)) {
    return rootNavigatorKey.currentState!.pushNamed(
      routeName,
      arguments: arguments,
    );
  } else {
    return Navigator.of(context).pushNamed(
      routeName,
      arguments: arguments,
    );
  }
}
