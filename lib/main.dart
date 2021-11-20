import 'package:app_airbnb/app/core/utils/dependecy_injection.dart';
import 'package:app_airbnb/app/modules/splash/splash_page.dart';
import 'package:app_airbnb/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  DependecyInjection.load();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //initialRoute: "/",
      getPages: AppPages.pages,
    );
  }
}
