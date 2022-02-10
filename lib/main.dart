import 'package:flutter/material.dart';
import 'package:miru_qita/data/common/common_resource.dart';
import 'package:miru_qita/view/style/dark_theme.dart';
import 'package:miru_qita/view/style/light_theme.dart';
import 'package:miru_qita/view/top_screen.dart';
import 'package:provider/provider.dart';
import 'di/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: globalProviders,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: CommonResource.appBarTitle,
      theme: liteTheme,
      darkTheme: darkTheme,
      home: TopScreen(),
    );
  }
}
