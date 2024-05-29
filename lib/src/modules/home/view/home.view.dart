import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../localization/loalization.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async => context.go('/setting'),
          child: Text(t!.setting),
        ),
      ),
    );
  }
}
