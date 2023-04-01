import 'package:architect_hub/model/portfolio_model.dart';
import 'package:architect_hub/model/request_model.dart';
import 'package:architect_hub/model/user_model.dart';
import 'package:architect_hub/ressources/enums/property_type.dart';
import 'package:architect_hub/ressources/enums/request_types.dart';
import 'package:architect_hub/ressources/routes_manager.dart';
import 'package:architect_hub/ressources/theme_manager.dart';
import 'package:architect_hub/view/home_view.dart';
import 'package:architect_hub/view/login_view.dart';
import 'package:architect_hub/view/offers_view.dart';
import 'package:architect_hub/viewmodel/favorite_viewmodel.dart';
import 'package:architect_hub/viewmodel/filter_viewmodel.dart';
import 'package:architect_hub/viewmodel/home_viewmodel.dart';
import 'package:architect_hub/viewmodel/inbox_viewmodel.dart';
import 'package:architect_hub/viewmodel/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter<PortifolioModel>(PortifolioModelAdapter());
  Hive.registerAdapter<UserModel>(UserModelAdapter());
  Hive.registerAdapter<RequestModel>(RequestModelAdapter());
  Hive.registerAdapter<PropertyType>(PropertyTypeAdapter());
  Hive.registerAdapter<RequestType>(RequestTypeAdapter());
  await Hive.initFlutter();

  // open local db that store favorites and draft requests
  await Hive.openBox<PortifolioModel>('favorites');
  await Hive.openBox<RequestModel>('draft_requests');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeViewModel>(
          create: (_) => HomeViewModel(),
        ),
        ChangeNotifierProvider<FilterViewModel>(
          create: (_) => FilterViewModel(),
        ),
        ChangeNotifierProvider<FavoriteViewModel>(
          create: (_) => FavoriteViewModel(),
        ),
        ChangeNotifierProvider<UserViewModel>(
          create: (_) => UserViewModel(),
        ),
        ChangeNotifierProvider<InboxViewModel>(
          create: (_) => InboxViewModel(),
        ),
      ],
      child: ScreenUtilInit(
        builder: (context, child) {
          return MaterialApp(
            onGenerateRoute: RouteGenerator.getRoute,
            theme: getApplicationTheme(),
            debugShowCheckedModeBanner: false,
            builder: (context, child) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: child!,
              );
            },
            home: child,
          );
        },
        child: const OffersView(idRequest: 1),
      ),
    ),
  );
}
