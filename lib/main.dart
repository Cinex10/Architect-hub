import 'package:architect_hub/model/portfolio_model.dart';
import 'package:architect_hub/model/user_model.dart';
import 'package:architect_hub/ressources/routes_manager.dart';
import 'package:architect_hub/view/home_view.dart';
import 'package:architect_hub/ressources/theme_manager.dart';
import 'package:architect_hub/viewmodel/favorite_viewmodel.dart';
import 'package:architect_hub/viewmodel/filter_viewmodel.dart';
import 'package:architect_hub/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter<PortifolioModel>(PortifolioModelAdapter());
  Hive.registerAdapter<UserModel>(UserModelAdapter());
  await Hive.initFlutter();

  await Hive.openBox<PortifolioModel>('favorites');
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
      ],
      child: MaterialApp(
        onGenerateRoute: RouteGenerator.getRoute,
        theme: getApplicationTheme(),
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return Directionality(
              textDirection: TextDirection.rtl, child: child!);
        },
        home: const HomeView(),
      ),
    ),
  );
}
