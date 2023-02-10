import 'package:architect_hub/ressources/components/announce_item.dart';
import 'package:architect_hub/ressources/styles_manager.dart';
import 'package:architect_hub/ressources/values_manager.dart';
import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

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
        body: Builder(builder: (context) {
          return Container();
          // return ListView.separated(
          //   separatorBuilder: (context, index) => const SizedBox(
          //     height: 20,
          //   ),
          //   physics: const BouncingScrollPhysics(),
          //   padding: const EdgeInsets.only(top: 20),
          //   itemCount: 10,
          //   itemBuilder: (context, index) => const AnnounceItem(
          //     isFavor: true,
          //     itemCount: 10,
          //   ),
          // );
        }),
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: const TextStyle(
            color: Colors.black,
          ),
          selectedItemColor: Colors.black,
          currentIndex: 1,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Log in',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Wishlist',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Explore',
            ),
          ],
        ),
      ),
    );
  }
}
