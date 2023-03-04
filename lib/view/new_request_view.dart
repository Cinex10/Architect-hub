import 'package:architect_hub/ressources/components/bottom_navigation_bar.dart';
import 'package:architect_hub/ressources/constant.dart';
import 'package:architect_hub/ressources/styles_manager.dart';
import 'package:architect_hub/ressources/validation_manager.dart';
import 'package:architect_hub/view/login_view.dart';
import 'package:architect_hub/viewmodel/new_request_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class NewRequestView extends StatefulWidget {
  const NewRequestView({super.key});

  @override
  State<NewRequestView> createState() => _NewRequestViewState();
}

class _NewRequestViewState extends State<NewRequestView> {
  final NewRequestViewModel _newRequestViewModel = NewRequestViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          elevation: 3,
          title: Text(
            'إنشاء طلب جديد',
            style: getBoldStyle(
              fontSize: 20,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 10.w,
          ),
          child: Form(
            key: _newRequestViewModel.formKey,
            child: ChangeNotifierProvider<NewRequestViewModel>(
              create: (_) => _newRequestViewModel,
              child: Consumer<NewRequestViewModel>(
                builder: (context, viewmodle, _) {
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        WidgetWithFixedLabel(
                          label: 'تفاصيل الطلب',
                          child: TextFormField(
                              maxLines: 7,
                              validator: ValidationManager
                                  .requestDescriptionValidator),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        WidgetWithFixedLabel(
                          label: 'مرفقات',
                          isVertical: false,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.image),
                            label: const Text('ارفق صور'),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        WidgetWithFixedLabel(
                          label: 'نوع الوحدة',
                          isVertical: false,
                          child: DropdownButtonFormField(
                            validator: ValidationManager.unitTypeValidator,
                            decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.house),
                              suffixIconColor: Colors.black38,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            hint: const Text('اختر نوع الوحدة'),
                            items: List.generate(
                              AppConstants.unitType.length,
                              (index) => DropdownMenuItem(
                                value: AppConstants.unitType[index],
                                child: Text(AppConstants.unitType[index]),
                              ),
                            ),
                            value: _newRequestViewModel.unitType,
                            onChanged: _newRequestViewModel.changeUnitType,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        WidgetWithFixedLabel(
                          label: 'مساحة الوحدة',
                          isVertical: false,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'ادخل مساحة الوحدة',
                              suffixIcon: Icon(Icons.map),
                              suffixIconColor: Colors.black38,
                            ),
                            validator: ValidationManager.surfaceValidator,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        WidgetWithFixedLabel(
                          label: 'الموقع',
                          isVertical: false,
                          child: DropdownButtonFormField(
                            validator: ValidationManager.locationValidator,
                            decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.place),
                              suffixIconColor: Colors.black38,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            hint: const Text('اختر الموقع'),
                            items: List.generate(
                              AppConstants.unitType.length,
                              (index) => DropdownMenuItem(
                                value: AppConstants.unitType[index],
                                child: Text(AppConstants.unitType[index]),
                              ),
                            ),
                            value: _newRequestViewModel.location,
                            onChanged: _newRequestViewModel.changeLocation,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        WidgetWithFixedLabel(
                          label: 'السعر المتوقع',
                          isVertical: false,
                          isRequired: false,
                          child: TextFormField(
                            validator: ValidationManager.priceValidator,
                            decoration: const InputDecoration(
                              hintText: 'ادخل السعر',
                              suffixIcon: Icon(Icons.monetization_on),
                              suffixIconColor: Colors.black38,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        WidgetWithFixedLabel(
                          label: 'شامل الخدمات',
                          isVertical: false,
                          isRequired: false,
                          child: Align(
                            alignment: AlignmentDirectional.centerStart,
                            child: Checkbox(
                              value: true,
                              onChanged: (_) {},
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        WidgetWithFixedLabel(
                          label: 'تاريخ التسليم',
                          isVertical: false,
                          isRequired: false,
                          child: TextFormField(
                            validator: ValidationManager.dateValidator,
                            decoration: const InputDecoration(
                              hintText: 'اختر التاريخ',
                              suffixIcon: Icon(Icons.date_range),
                              suffixIconColor: Colors.black38,
                            ),
                            readOnly: true,
                            controller: _newRequestViewModel.dateinput,
                            onTap: () => _newRequestViewModel.pickDate(context),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text('حفظ'),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text('تأكيد'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavBar(
          currentIndex: 2,
        ),
      ),
    );
  }
}
