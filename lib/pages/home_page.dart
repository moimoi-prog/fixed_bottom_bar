import 'package:fixed_bottom_tab/routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                pushNamed(
                  context,
                  accountDetailRoute,
                );
              },
              child: const Text('詳細'),
            ),
            TextButton(
              onPressed: () {
                pushNamed(
                  context,
                  settingRoute,
                );
              },
              child: const Text('設定'),
            ),
          ],
        ),
      ),
    );
  }
}
