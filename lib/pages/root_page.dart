import 'package:fixed_bottom_tab/routes.dart';
import 'package:fixed_bottom_tab/tab_navigator.dart';
import 'package:fixed_bottom_tab/tab_type.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  const RootPage({
    super.key,
  });

  @override
  RootPageState createState() => RootPageState();
}

class RootPageState extends State<RootPage> {
  TabType currentTabType = TabType.home;

  void selectTab(TabType selectTab) {
    setState(() {
      currentTabType = selectTab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildTabItem(
            currentTabType,
            TabType.home,
          ),
          _buildTabItem(
            currentTabType,
            TabType.taskList,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: TabType.values
            .map(
              (e) => BottomNavigationBarItem(
                icon: Icon(e.toIcon),
                label: e.toText,
              ),
            )
            .toList(),
        onTap: (index) {
          if (index == currentTabType.index) {
            tabNavigatorKeys[currentTabType]!.currentState!.popUntil
                .call((route) => route.isFirst);
          } else {
            selectTab(TabType.values[index]);
          }
        },
        currentIndex: currentTabType.index,
      ),
    );
  }

  Widget _buildTabItem(
    TabType currentTabType,
    TabType tabItem,
  ) {
    return Offstage(
      offstage: currentTabType != tabItem,
      child: TabNavigator(
        navigationKey: tabNavigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }
}
