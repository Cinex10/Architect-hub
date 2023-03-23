import 'package:architect_hub/ressources/components/bottom_navigation_bar.dart';
import 'package:architect_hub/ressources/components/offers_list.dart';
import 'package:architect_hub/ressources/routes_manager.dart';
import 'package:architect_hub/ressources/styles_manager.dart';
import 'package:architect_hub/viewmodel/request_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OffersView extends StatefulWidget {
  const OffersView({
    super.key,
    required this.idRequest,
  });

  final int idRequest;

  @override
  State<OffersView> createState() => _OffersViewState();
}

class _OffersViewState extends State<OffersView> {
  final RequestsViewModel _requestsViewModel = RequestsViewModel();
  @override
  void initState() {
    super.initState();
    _requestsViewModel.getOffers(idRequest: widget.idRequest);
  }

  @override
  Widget build(BuildContext context) {
    print(ModalRoute.of(context)!.settings.arguments);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'العروض',
            style: getBoldStyle(
              fontSize: 20,
            ),
          ),
        ),
        body: ChangeNotifierProvider<RequestsViewModel>(
          create: (_) => _requestsViewModel,
          child: Consumer<RequestsViewModel>(builder: (context, value, _) {
            return OffersList(
              status: _requestsViewModel.status,
              onRefresh: () async {
                await _requestsViewModel.getOffers(idRequest: 1);
              },
              offers: _requestsViewModel.offers,
            );
          }),
        ),
        backgroundColor: Colors.grey[200],
        bottomNavigationBar: const BottomNavBar(
          currentRoute: Routes.offersRoute,
        ),
      ),
    );
  }
}
