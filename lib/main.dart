import 'package:camera/camera.dart';
import 'package:dovie/constants/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/statistics/controller/stats_controlle.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Stripe.publishableKey =
      'pk_test_51KqXCWL12gYZ97fKFULi0zIuYP5S7VI3KjDVwycjtQaiCfu9oo857HJtdsd04OuW5l0t9RUnG2IIYxFF23HtyeAT00RXoNS3wh';
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

final statsController = Get.put(StatController());
@override
void initState() {
  // TODO: implement initState
  statsController.statsController();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your applicatio 

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder:
            (BuildContext context, AsyncSnapshot<SharedPreferences> prefs) {
          var data = prefs.data;
          if (prefs.hasData) {
            final isUserLoggedIn = data!.getString('token');
            return ScreenUtilInit(
                designSize: const Size(390, 844),
                minTextAdapt: true,
                splitScreenMode: true,
                builder: (context, child) {
                  return GetMaterialApp(
                    title: 'Flutter Demo',
                    theme: ThemeData(
                      primarySwatch: Colors.blue,
                    ),
                    getPages: appPageRoutes,
                    initialRoute: isUserLoggedIn == null
                        ? 'welcomePage'
                        : 'bottomNavPage',
                  );
                });
          } else {
            return Container();
          }
        });
  }
}
