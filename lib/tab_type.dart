import 'package:fixed_bottom_tab/routes.dart';
import 'package:flutter/material.dart';

enum TabType {
  home,
  taskList,
}

extension TabTypeExtension on TabType {
  String get toText {
    switch (this) {
      case TabType.home:
        return 'ホーム';
      case TabType.taskList:
        return 'タスク';
    }
  }

  String get toRouteName {
    switch (this) {
      case TabType.home:
        return homeRoute;
      case TabType.taskList:
        return taskListRoute;
    }
  }

  IconData get toIcon {
    switch (this) {
      case TabType.home:
        return Icons.home_outlined;
      case TabType.taskList:
        return Icons.task_outlined;
    }
  }
}
