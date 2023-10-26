import 'package:flutter/material.dart';

//import 'package:tu_cine/config/router/app_router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:tu_cine/config/theme/app_theme.dart';
import 'package:tu_cine/presentation/widgets/shared/custom_bottom_navigation.dart';
//import 'package:tu_cine/presentation/widgets/shared/custom_bottom_navigation.dart';

Future<void> main() async {

  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TuCine',

      //routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      
      theme: AppTheme().getTheme(),
      home: const CustomBottomNavigation(),
    );
  }
}
