import 'package:architect_hub/ressources/components/bottom_navigation_bar.dart';
import 'package:architect_hub/ressources/components/filter_box.dart';
import 'package:architect_hub/ressources/components/portfolio_single_tab.dart';
import 'package:architect_hub/ressources/constant.dart';
import 'package:architect_hub/ressources/routes_manager.dart';
import 'package:architect_hub/viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewModel _homeViewModel = HomeViewModel();
  @override
  void initState() {
    super.initState();
    _homeViewModel.getPortfolios();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: AppConstants.availableTypes.length,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(120),
            child: AppBar(
              automaticallyImplyLeading: false,
              elevation: 4,
              shadowColor: Colors.black38,
              flexibleSpace: GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  Routes.searchRoute,
                ),
                child: Container(
                  margin: EdgeInsetsDirectional.symmetric(
                      vertical: 20, horizontal: (1.sw > 550) ? 0.27.sw : 20.w),
                  padding: const EdgeInsetsDirectional.only(
                    start: 20,
                  ),
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
                      const Expanded(
                        flex: 14,
                        child: Text(
                          'إسم المصمم',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      // const Spacer(
                      //   flex: 10,
                      // ),
                      Material(
                        color: Colors.white,
                        shape: const CircleBorder(),
                        child: InkWell(
                          radius: 40,
                          borderRadius: BorderRadius.circular(20),
                          onTap: () => (1.sw > 900)
                              ? showDialog(
                                  context: context,
                                  builder: (context) => Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 1.sw > 900 ? 0.2.sw : 10,
                                      vertical: 100.h,
                                    ),
                                    child: Material(
                                      borderRadius: BorderRadius.circular(15),
                                      child: const FilterBox(),
                                    ),
                                  ),
                                )
                              : showModalBottomSheet(
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
                      ),
                    ],
                  ),
                ),
              ),
              backgroundColor: Colors.white,
              bottom: TabBar(
                  isScrollable: true,
                  labelColor: Colors.black,
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  padding: const EdgeInsets.only(top: 30),
                  indicatorColor: Colors.black,
                  tabs: List.generate(
                    AppConstants.availableTypes.length,
                    (index) => Tab(text: AppConstants.availableTypes[index]),
                  )),
            ),
          ),
          body: ChangeNotifierProvider<HomeViewModel>(
            create: (_) => _homeViewModel,
            child: Consumer<HomeViewModel>(builder: (context, value, _) {
              return TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  PortfolioSingleTab(
                    status: value.status,
                    portfolios: value.villasPortfolios,
                    onRefresh: () => value.getPortfolios(),
                  ),
                  PortfolioSingleTab(
                    status: value.status,
                    portfolios: value.appartmentPortfolios,
                    onRefresh: () => value.getPortfolios(),
                  ),
                  PortfolioSingleTab(
                    status: value.status,
                    portfolios: value.officePortfolios,
                    onRefresh: () => value.getPortfolios(),
                  ),
                  PortfolioSingleTab(
                    status: value.status,
                    portfolios: value.shopPortfolios,
                    onRefresh: () => value.getPortfolios(),
                  ),
                  PortfolioSingleTab(
                    status: value.status,
                    portfolios: value.medicalPortfolios,
                    onRefresh: () => value.getPortfolios(),
                  ),
                ],
              );
            }),
          ),
          bottomNavigationBar: const BottomNavBar(
            currentRoute: Routes.homeRoute,
          ),
        ),
      ),
    );
  }
}
