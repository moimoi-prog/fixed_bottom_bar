import 'package:fixed_bottom_tab/routes.dart';
import 'package:flutter/material.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('タスク一覧'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(index.toString()),
              onTap: () {
                pushNamed(context, taskDetailRoute);
              },
            ),
          );
        },
      ),
    );
  }
}
