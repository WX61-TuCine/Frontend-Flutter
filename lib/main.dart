import 'package:flutter/material.dart';


import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tu_cine/config/theme/app_theme.dart';

import 'config/router/app_router.dart';

Future<void> main() async {

  await dotenv.load(fileName: ".env");

  runApp(
    const ProviderScope(child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'TuCine',

      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      
      theme: AppTheme().getTheme(),
      //home: const CustomBottomNavigation(),
    );
  }
}
