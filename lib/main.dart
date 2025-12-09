import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit/core/helper/custom_bloc_observer.dart';
import 'package:fruit/core/helper/on_generate_rout.dart';
import 'package:fruit/core/services/get_it_service.dart';
import 'package:fruit/core/services/shared_prefrences.dart';
import 'package:fruit/core/utils/app_text_styles.dart';
import 'package:fruit/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // create it to help in debugging at Bloc Obsever and get data when state change
  // expamle in signup state when state change it will print the state data
  Bloc.observer = CustomBlocObserver();
  await EasyLocalization.ensureInitialized();
  await SharedPrefrencesService.initialize();
  setupGetit();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('ar')],
        path: 'assets/lang',
        fallbackLocale: Locale(
          'ar',
        ),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          fontFamily: 'Cairo',
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            color: Colors.white,
            titleTextStyle: AppTextStyles.bold19.copyWith(
              color: Colors.black,
              fontFamily: 'Cairo',
            ),
          ),
          useMaterial3: true,
        ),
        onGenerateRoute: OnGenerateRout.onGenerateRoute,
        initialRoute: OnGenerateRout.splashRoutName,
      ),
    );
  }
}
