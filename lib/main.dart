import 'package:architect_hub/view/home_view.dart';
import 'package:architect_hub/ressources/theme_manager.dart';
import 'package:architect_hub/viewmodel/filter_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<FilterViewModel>(
          create: (_) => FilterViewModel(),
        ),
      ],
      child: MaterialApp(
        theme: getApplicationTheme(),
        debugShowCheckedModeBanner: false,
        home: const Directionality(
          textDirection: TextDirection.rtl,
          child: HomeView(),
        ),
      ),
    ),
  );
}
