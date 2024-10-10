
import 'package:api_demo/routes/route.dart';
import 'package:flutter/material.dart';

import 'themes/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Api Demo',
      theme: theme,
      routes: routes
    );
  }
}