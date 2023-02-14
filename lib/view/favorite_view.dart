import 'package:architect_hub/data/network/response/status.dart';
import 'package:architect_hub/ressources/components/bottom_navigation_bar.dart';
import 'package:architect_hub/ressources/components/portfolio_item.dart';
import 'package:architect_hub/ressources/styles_manager.dart';
import 'package:architect_hub/ressources/values_manager.dart';
import 'package:architect_hub/viewmodel/favorite_viewmodel.dart';
import 'package:architect_hub/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  final FavoriteViewModel _favoriteViewModel = FavoriteViewModel();

  @override
  void initState() {
    super.initState();
    _favoriteViewModel.getAllFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Padding(
              padding: const EdgeInsets.only(top: AppPadding.p20),
              child: Text(
                'Favorits',
                style: getBoldStyle(
                  color: Colors.black,
                  fontSize: AppSize.s25,
                ),
              ),
            ),
          ),
        ),
        body: ChangeNotifierProvider<FavoriteViewModel>(
          create: (_) => _favoriteViewModel,
          child: Consumer<FavoriteViewModel>(
            builder: (context, value, _) {
              if (value.favorites.isEmpty) {
                return const Center(
                  child: Text('لا توجد عناصر مفضلة'),
                );
              }
              return ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(top: 20),
                itemCount: value.favorites.length,
                itemBuilder: (context, index) {
                  return PortfolioItem(
                    portifolioModel:
                        value.favorites[value.favorites.keys.toList()[index]]!,
                  );
                },
              );
            },
          ),
        ),
        bottomNavigationBar: const BottomNavBar(
          currentIndex: 1,
        ),
      ),
    );
  }
}
