import 'package:architect_hub/ressources/color_manager.dart';
import 'package:architect_hub/ressources/styles_manager.dart';
import 'package:architect_hub/ressources/values_manager.dart';
import 'package:architect_hub/viewmodel/filter_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterBox extends StatelessWidget {
  const FilterBox({super.key});

  @override
  Widget build(BuildContext context) {
    final FilterViewModel filterViewModel =
        Provider.of<FilterViewModel>(context);
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
              Text(
                'Filter',
                style: getBoldStyle(
                  color: ColorManager.black,
                  fontSize: AppSize.s16,
                ),
              ),
              Opacity(
                opacity: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.close),
                ),
              ),
            ],
          ),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 25,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        'Rating',
                        style: getBoldStyle(
                          color: ColorManager.black,
                          fontSize: AppSize.s18,
                        ),
                      ),
                    ),
                    Slider(
                      min: 0,
                      max: 5.0,
                      divisions: 50,
                      value: filterViewModel.minRating,
                      label: filterViewModel.minRating.toStringAsPrecision(2),
                      onChanged: (value) => filterViewModel.updateRating(value),
                    ),
                    SizedBox(
                      height: 80,
                      width: 100,
                      child: TextField(
                        controller: filterViewModel.ratingTextController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          helperText: 'Min rating',
                          prefixIcon: Icon(
                            Icons.star,
                          ),
                        ),
                      ),
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        'Type',
                        style: getBoldStyle(
                          color: ColorManager.black,
                          fontSize: AppSize.s18,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 10,
                      children: List.generate(
                        filterViewModel.availableTypes.length,
                        (index) => GestureDetector(
                          onTap: () => filterViewModel.updateSelectedTypes(
                              filterViewModel.availableTypes[index]),
                          child: Chip(
                            backgroundColor: (filterViewModel.selectedTypes
                                    .contains(
                                        filterViewModel.availableTypes[index]))
                                ? Colors.black
                                : null,
                            elevation: (filterViewModel.selectedTypes.contains(
                                    filterViewModel.availableTypes[index]))
                                ? 9
                                : null,
                            label: Text(filterViewModel.availableTypes[index]),
                            labelStyle: (filterViewModel.selectedTypes.contains(
                                    filterViewModel.availableTypes[index]))
                                ? getMediumStyle(
                                    color: Colors.white,
                                    fontSize: AppSize.s14,
                                  )
                                : null,
                          ),
                        ),
                      ),
                      // children: [
                      //   Chip(
                      //     // selected chip style
                      //     backgroundColor: Colors.black,
                      //     shadowColor: Colors.black,
                      //     elevation: 9,
                      //     label: const Text('Villas'),
                      //     // selected chip label style
                      //     labelStyle: getMediumStyle(
                      //       color: Colors.white,
                      //       fontSize: AppSize.s14,
                      //     ),
                      //   ),
                      //   const Chip(
                      //     label: Text('Apartment'),
                      //   ),
                      //   const Chip(
                      //     label: Text('Office'),
                      //   ),
                      //   const Chip(
                      //     label: Text('Medical'),
                      //   ),
                      //   const Chip(
                      //     label: Text('Shop'),
                      //   ),
                      // ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        'Price',
                        style: getBoldStyle(
                          color: ColorManager.black,
                          fontSize: AppSize.s18,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextField(
                            cursorColor: Colors.black,
                            controller: filterViewModel.priceTextController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              hintText: '256.4',
                              prefixIcon: const Icon(
                                Icons.attach_money_rounded,
                                color: Colors.black,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: SwitchListTile(
                            // activeColor: Colors.black,
                            title: const FittedBox(
                              child: Text(
                                'Including materials',
                              ),
                            ),
                            value: filterViewModel.isIncludeMaterials,
                            onChanged: (value) =>
                                filterViewModel.updateIncludeMaterials(value),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        'Location',
                        style: getBoldStyle(
                          color: ColorManager.black,
                          fontSize: AppSize.s18,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => filterViewModel.clearAllFilters(),
                  child: Text(
                    'Clear all',
                    style: getBoldStyle(
                      fontSize: 16,
                      color: ColorManager.black,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => filterViewModel.showResult(),
                  child: const Text(
                    'Show',
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
