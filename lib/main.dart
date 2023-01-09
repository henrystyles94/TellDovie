import 'package:camera/camera.dart';
import 'package:dovie/constants/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
