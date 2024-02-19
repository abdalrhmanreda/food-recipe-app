import 'package:fast_food/config/themes/themes.dart';
import 'package:fast_food/core/api/dio_helper.dart';
import 'package:fast_food/core/cache/hive_cache.dart';
import 'package:fast_food/core/constant/strings.dart';
import 'package:fast_food/ui/features/authentication/controller/auth_cubit.dart';
import 'package:fast_food/ui/features/bookmark/controllers/bookmark_cubit.dart';
import 'package:fast_food/ui/features/home/controllers/home_cubit.dart';
import 'package:fast_food/ui/features/layout/controller/layout_cubit.dart';
import 'package:fast_food/ui/features/meal_details/controller/meal_cubit.dart';
import 'package:fast_food/ui/features/search/controller/search_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'config/colors/app_colors.dart';
import 'config/routes/router.dart';
import 'config/routes/routes_path.dart';
import 'core/observer/blocObserver.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await Hive.initFlutter();
  await HiveCache.openHive();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  userId = HiveCache.getData(key: 'userId');
  bool? onBoarding = await HiveCache.getData(key: 'onBoarding');
  String startWidget =
      onBoarding != null ? RoutePath.login : RoutePath.onBoarding;

  runApp(FoodRecipeApp(startWidget: startWidget));
}

class FoodRecipeApp extends StatelessWidget {
  const FoodRecipeApp({super.key, required this.startWidget});
  final String startWidget;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => BookmarkCubit()..getBookmark(),
        ),
        BlocProvider(
          create: (context) => MealCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit()..getCategories(),
        ),
        BlocProvider(
          create: (context) => LayoutCubit(),
        ),
        BlocProvider(
          create: (context) => SearchCubit(),
        ),
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return SafeArea(
              child: AnnotatedRegion<SystemUiOverlayStyle>(
                value: const SystemUiOverlayStyle(
                  statusBarColor: Color(AppColors.kWhiteColor),
                  statusBarBrightness: Brightness.light,
                  statusBarIconBrightness: Brightness.dark,
                ),
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  locale: const Locale('en'),
                  initialRoute: RoutePath.onBoarding,
                  theme: Style.lightTheme,
                  darkTheme: Style.darkTheme,
                  themeMode: ThemeMode.light,
                  onGenerateRoute: generateRoute,
                ),
              ),
            );
          }),
    );
  }
}
