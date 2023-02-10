import 'package:architect_hub/ressources/components/announce_item.dart';
import 'package:architect_hub/ressources/components/filter_box.dart';
import 'package:architect_hub/view/search_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 9,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(120),
            child: AppBar(
              elevation: 4,
              shadowColor: Colors.black38,
              flexibleSpace: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                padding: const EdgeInsets.only(
                  right: 20,
                ),
                height: 50,
                width: 600,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.black12,
                  ),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 0.1,
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchView(),
                          ),
                        );
                      },
                      child: const Text(
                        'إسم المصمم',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 10,
                    ),
                    Material(
                      color: Colors.white,
                      shape: const CircleBorder(),
                      child: InkWell(
                        radius: 40,
                        borderRadius: BorderRadius.circular(20),
                        onTap: () => showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(10),
                            ),
                          ),
                          backgroundColor: Colors.white,
                          builder: (context) => Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: const FilterBox(),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Icon(Icons.filter_alt_outlined),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              backgroundColor: Colors.white,
              bottom: const TabBar(
                isScrollable: true,
                labelColor: Colors.black,
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                padding: EdgeInsets.only(top: 30),
                indicatorColor: Colors.black,
                tabs: [
                  Tab(text: "Tab 1"),
                  Tab(text: "Tab 2"),
                  Tab(text: "Tab 3"),
                  Tab(text: "Tab 4"),
                  Tab(text: "Tab 5"),
                  Tab(text: "Tab 6"),
                  Tab(text: "Tab 7"),
                  Tab(text: "Tab 8"),
                  Tab(text: "Tab 9"),
                ],
              ),
            ),
          ),
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(top: 20),
                itemCount: 10,
                itemBuilder: (context, index) => AnnounceItem(
                  isFavor: index.isEven,
                  itemCount: 10,
                ),
              ),
              const Center(
                child: Text("Tab 2 content"),
              ),
              const Center(
                child: Text("Tab 3 content"),
              ),
              const Center(
                child: Text("Tab 3 content"),
              ),
              const Center(
                child: Text("Tab 3 content"),
              ),
              const Center(
                child: Text("Tab 3 content"),
              ),
              const Center(
                child: Text("Tab 3 content"),
              ),
              const Center(
                child: Text("Tab 3 content"),
              ),
              const Center(
                child: Text("Tab 3 content"),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: 2,
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
      ),
    );
  }
}