import 'package:architect_hub/ressources/components/bottom_navigation_bar.dart';
import 'package:architect_hub/ressources/components/request_single_tab.dart';
import 'package:architect_hub/ressources/constant.dart';
import 'package:architect_hub/ressources/routes_manager.dart';
import 'package:architect_hub/ressources/styles_manager.dart';
import 'package:architect_hub/viewmodel/request_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RequestView extends StatefulWidget {
  const RequestView({super.key});

  @override
  State<RequestView> createState() => _RequestViewState();
}

class _RequestViewState extends State<RequestView> {
  final RequestsViewModel _requestsViewModel = RequestsViewModel();
  @override
  void initState() {
    super.initState();
    _requestsViewModel.getRequests();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: AppConstants.requestTypes.length,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(120),
            child: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              // title: const Text('طلباتي'),
              flexibleSpace: Container(
                margin: EdgeInsetsDirectional.symmetric(
                    vertical: 20, horizontal: (1.sw > 550) ? 0.27.sw : 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'طلباتي',
                      style: getBoldStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      label: const Text('طلب جديد'),
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
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
                  AppConstants.requestTypes.length,
                  (index) => Tab(text: AppConstants.requestTypes[index]),
                ),
              ),
            ),
          ),
          body: ChangeNotifierProvider<RequestsViewModel>(
            create: (_) => _requestsViewModel,
            child:
                Consumer<RequestsViewModel>(builder: (context, viewModel, _) {
              return TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  RequestSingleTab(
                    status: viewModel.status,
                    onRefresh: () => viewModel.getRequests(),
                    requests: viewModel.allRequests,
                  ),
                  RequestSingleTab(
                    status: viewModel.status,
                    onRefresh: () => viewModel.getRequests(),
                    requests: viewModel.underReviewRequests,
                  ),
                  RequestSingleTab(
                    status: viewModel.status,
                    onRefresh: () => viewModel.getRequests(),
                    requests: viewModel.inExecutionRequests,
                  ),
                  RequestSingleTab(
                    status: viewModel.status,
                    onRefresh: () => viewModel.getRequests(),
                    requests: viewModel.completedRequests,
                  ),
                  RequestSingleTab(
                    status: viewModel.status,
                    onRefresh: () => viewModel.getRequests(),
                    requests: viewModel.draftRequests,
                  ),
                ],
              );
            }),
          ),
          // backgroundColor: Colors.grey[200],
          bottomNavigationBar: const BottomNavBar(
            currentRoute: Routes.requestRoute,
          ),
        ),
      ),
    );
  }
}
