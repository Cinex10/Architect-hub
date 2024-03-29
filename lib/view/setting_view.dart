import 'package:architect_hub/ressources/color_manager.dart';
import 'package:architect_hub/ressources/components/bottom_navigation_bar.dart';
import 'package:architect_hub/ressources/routes_manager.dart';
import 'package:architect_hub/ressources/styles_manager.dart';
import 'package:architect_hub/viewmodel/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        color: Colors.white,
        // margin: EdgeInsets.symmetric(horizontal: 1.sw > 900 ? 0.2.sw : 10),
        child: Column(
          children: [
            const Spacer(),
            ListTile(
              leading: const CircleAvatar(
                radius: 22,
                backgroundColor: Colors.redAccent,
                backgroundImage: AssetImage('assets/images/2.jpg'),
              ),
              title: Text(
                'أحمد معتز',
                style: getBoldStyle(
                  color: ColorManager.black,
                  fontSize: 18,
                ),
              ),
            ),
            const Divider(
              height: 2,
              color: Colors.black45,
              endIndent: 20,
              indent: 20,
            ),
            const Spacer(),
            Consumer<UserViewModel>(builder: (context, viewmodel, _) {
              return ListTile(
                leading: const Icon(Icons.swap_horizontal_circle_sharp),
                title: (viewmodel.isServiceProvider)
                    ? const Text('إلى حساب عميل')
                    : const Text('إلى حساب مقدم الخدمة'),
                trailing: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 17,
                ),
                onTap: () => viewmodel.switchUserMode(),
              );
            }),
            const Spacer(
              flex: 2,
            ),
            ListTile(
              leading: const Icon(Icons.person_2_rounded),
              title: const Text('بياناتي الشخصية'),
              trailing: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 17,
              ),
              onTap: () {},
            ),
            const Divider(
              height: 2,
              color: Colors.black45,
              endIndent: 20,
              indent: 20,
            ),
            ListTile(
              leading: const Icon(Icons.payments),
              title: const Text('الدفع و التحصيل'),
              trailing: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 17,
              ),
              onTap: () {},
            ),
            const Divider(
              height: 2,
              color: Colors.black45,
              endIndent: 20,
              indent: 20,
            ),
            Consumer<UserViewModel>(builder: (context, viewmodel, _) {
              return ListTile(
                leading: const Icon(Icons.star_rate_rounded),
                title: (viewmodel.isServiceProvider)
                    ? const Text('تقييماتي كمقدم خدمة')
                    : const Text('تقييماتي كعميل'),
                trailing: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 17,
                ),
                onTap: () {},
              );
            }),
            const Divider(
              height: 2,
              color: Colors.black45,
              endIndent: 20,
              indent: 20,
            ),
            ListTile(
              leading: const Icon(Icons.contact_support_rounded),
              title: const Text('الدعم الفني'),
              trailing: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 17,
              ),
              onTap: () {},
            ),
            const Spacer(
              flex: 2,
            ),
            ListTile(
              leading: const Icon(Icons.logout_rounded),
              title: const Text('تسجيل الخروج'),
              trailing: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 17,
              ),
              onTap: () {
                Navigator.pushNamed(context, Routes.loginRoute);
                Provider.of<UserViewModel>(context, listen: false).logout();
              },
            ),
            const Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(
        currentRoute: Routes.settingRoute,
      ),
    );
  }
}
