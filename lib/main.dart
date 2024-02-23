import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'provider/post_provider.dart';
import 'screens/post_screen.dart';

void main() {
  runApp(MultiProvider(providers: [ChangeNotifierProvider(create: (_) => PostProvider())], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 2280),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: (context, widget) {
            return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                child:
                    MediaQuery(data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)), child: widget!));
          },
          theme: ThemeData(
              fontFamily: 'Montserrat',
              useMaterial3: false,
              appBarTheme:
                  const AppBarTheme(backgroundColor: Colors.transparent, surfaceTintColor: Colors.transparent, elevation: 0)),
          home: child,
        );
      },
      child: const PostScreen(),
    );
  }
}
