import 'package:fake_store/routes/app_router.dart';
import 'package:fake_store/themes/theme.dart';
import 'package:flutter/material.dart';

import 'di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: createLightTheme(),
      themeMode: ThemeMode.light,
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }
}
