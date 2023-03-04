import 'package:architect_hub/ressources/color_manager.dart';
import 'package:architect_hub/ressources/components/bottom_navigation_bar.dart';
import 'package:architect_hub/ressources/styles_manager.dart';
import 'package:flutter/material.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
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
            ListTile(
              leading: const Icon(Icons.swap_horizontal_circle_sharp),
              title: const Text('إلى حساب مقدم الخدمة'),
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
            ListTile(
              leading: const Icon(Icons.star_rate_rounded),
              title: const Text('تقييماتي كعميل'),
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
              onTap: () {},
            ),
            const Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(
        currentIndex: 2,
      ),
    );
  }
}
