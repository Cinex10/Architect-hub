import 'package:architect_hub/ressources/components/bottom_navigation_bar.dart';
import 'package:architect_hub/ressources/components/inbox_item.dart';
import 'package:architect_hub/ressources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
            elevation: 3,
            flexibleSpace: Container(
              margin: EdgeInsetsDirectional.symmetric(
                  vertical: 20, horizontal: (1.sw > 550) ? 0.27.sw : 20.w),
              padding: const EdgeInsetsDirectional.only(
                start: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'أحمد معتز',
                        style: getBoldStyle(
                          fontSize: 20,
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        label: const Text('إنشاء طلب مباشر'),
                        icon: const Icon(Icons.call),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) => InboxItem(
                    title: 'صالح',
                    middleText: 'تص تجريبي',
                    thirdLineText: '2022 Jan 19',
                    isDirectionReversed: (index % 5).isEven,
                  ),
                ),
              ),
              // const TextField(),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavBar(
          currentIndex: 2,
        ),
      ),
    );
  }
}
