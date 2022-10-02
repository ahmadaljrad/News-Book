import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_book/layout/home/home_page.dart';
import 'package:news_book/layout/login/login_page.dart';
import 'package:news_book/shared/bloc/cubit/app_cubit.dart';
import 'package:news_book/shared/bloc/newsAppCubit/news_app_cubit.dart';
import 'package:news_book/shared/lang/lang_helper.dart';
import 'package:news_book/shared/local%20storage/hive_app.dart';
import 'package:news_book/shared/network/remote/dio_helper.dart';
import 'package:news_book/shared/styles/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'shared/bloc/cubit/app_states.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Hive.initFlutter();
  Hive.registerAdapter(AppSettingsAdapter());
  await Hive.openBox('AppSettings');
  await Hive.openBox('ReactWithPosts');

  DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit(),
        ),
        BlocProvider(
          create: (context) => NewsAppCubit()
            ..getBusinessData()
            ..getSportsData()
            ..getScienceData(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: LangHelper.getLangHelper(LangHelper.title),
              theme: themeLight,
              darkTheme: themeDark,
              themeMode: AppCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: Hive.box('AppSettings').get("uid") == null
                  ? const LoginPage()
                  : const HomePage(),
            );
          }),
    );
  }
}
