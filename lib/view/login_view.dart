import 'package:architect_hub/ressources/components/bottom_navigation_bar.dart';
import 'package:architect_hub/ressources/routes_manager.dart';
import 'package:architect_hub/ressources/styles_manager.dart';
import 'package:architect_hub/viewmodel/user_viewmodel.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: 1.sw,
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(
                flex: 3,
              ),
              Text(
                'أدخل بيانات العضوية',
                style: getBoldStyle(fontSize: 22),
              ),
              Text(
                'برجاء ملئ كافة بيانات النموذج التالي بعناية',
                style: getRegularStyle(fontSize: 15),
              ),
              const Spacer(
                flex: 2,
              ),
              Row(
                children: const [
                  Expanded(
                    flex: 10,
                    child: WidgetWithFixedLabel(
                      child: TextField(),
                      label: 'الإسم الأول',
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    flex: 10,
                    child: WidgetWithFixedLabel(
                      child: TextField(),
                      label: 'إسم العائلة',
                    ),
                  ),
                ],
              ),
              const Spacer(
                flex: 2,
              ),
              const WidgetWithFixedLabel(
                child: TextField(),
                label: 'البريد الإلكتروني',
              ),
              const Spacer(
                flex: 2,
              ),
              Consumer<UserViewModel>(builder: (context, viewModel, _) {
                return WidgetWithFixedLabel(
                  label: 'رقم الجوال',
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: '000 000 000 000',
                        suffixIcon: SizedBox(
                          width: 70.w,
                          height: 50,
                          child: Center(
                            child: GestureDetector(
                              onTap: () async {
                                showCountryPicker(
                                  context: context,
                                  showPhoneCode: true,
                                  countryListTheme: CountryListThemeData(
                                    flagSize: 25,
                                    backgroundColor: Colors.white,
                                    textStyle: const TextStyle(
                                        fontSize: 16, color: Colors.blueGrey),
                                    bottomSheetHeight:
                                        500, // Optional. Country list modal height
                                    //Optional. Sets the border radius for the bottomsheet.
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                    ),
                                    //Optional. Styles the search field.
                                    inputDecoration: InputDecoration(
                                      labelText: 'اكتب اسم الدولة',
                                      hintText: 'ابحث',
                                      prefixIcon: const Icon(Icons.search),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: const Color(0xFF8C98A8)
                                              .withOpacity(0.2),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onSelect: Provider.of<UserViewModel>(context,
                                          listen: false)
                                      .changeCountry,
                                );
                              },
                              child: Text(
                                '${viewModel.country.flagEmoji} +${viewModel.country.phoneCode}',
                                style: getRegularStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        helperText: 'سيتم إرسال كود التحقق على رقم جوالك'),
                  ),
                );
              }),
              const Spacer(
                flex: 2,
              ),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                  ),
                  const Text(
                    'موافق على الشروط و سياسة الإستخدام',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              const Spacer(
                flex: 1,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Provider.of<UserViewModel>(context, listen: false).login();
                    Navigator.pushNamed(context, Routes.homeRoute);
                  },
                  child: const Text(
                    'تسجيل الدخول',
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        bottomNavigationBar: const BottomNavBar(
          currentRoute: Routes.loginRoute,
        ),
      ),
    );
  }
}

class WidgetWithFixedLabel extends StatelessWidget {
  const WidgetWithFixedLabel({
    super.key,
    required this.child,
    required this.label,
    this.isRequired = true,
    this.isVertical = true,
  });
  final Widget child;
  final String label;
  final bool isRequired;
  final bool isVertical;
  @override
  Widget build(BuildContext context) {
    return (isVertical)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: label,
                  style: getSemiBoldStyle(fontSize: 14),
                  children: [
                    if (isRequired)
                      TextSpan(
                        text: ' *',
                        style: getSemiBoldStyle(
                          fontSize: 14,
                          color: Colors.red,
                        ),
                      ),
                  ],
                ),
              ),
              child,
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: RichText(
                  text: TextSpan(
                    text: label,
                    style: getSemiBoldStyle(fontSize: 14),
                    children: [
                      if (isRequired)
                        TextSpan(
                          text: ' *',
                          style: getSemiBoldStyle(
                            fontSize: 14,
                            color: Colors.red,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 7,
                child: child,
              ),
            ],
          );
  }
}
