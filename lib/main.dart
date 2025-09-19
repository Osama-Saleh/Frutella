import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruit/core/helper/on_generate_rout.dart';
// import 'package:flutter_localization/flutter_localization.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('ar')],
      path: 'assets/lang',
      fallbackLocale: Locale('ar',),
      child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        useMaterial3: true,
      ),
      onGenerateRoute: OnGenerateRout.onGenerateRoute,
      initialRoute: OnGenerateRout.splashRoutName,
    );
  }
}

