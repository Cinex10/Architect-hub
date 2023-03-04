import 'package:architect_hub/ressources/styles_manager.dart';
import 'package:architect_hub/ressources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(120),
            child: AppBar(
              leading: const SizedBox(),
              elevation: 0,
              flexibleSpace: Container(
                margin: EdgeInsetsDirectional.symmetric(
                    vertical: 20, horizontal: (1.sw > 550) ? 0.27.sw : 20.w),
                padding: const EdgeInsetsDirectional.only(
                  start: 20,
                ),
                // height: 50,
                // width: 600,
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
                    const Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 30,
                      child: GestureDetector(
                          onTap: () {},
                          child: const TextField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintText: 'هاشتاج أو كلمات دلالية',
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          )),
                    ),
                    const Spacer(
                      flex: 10,
                    ),
                    Material(
                      // borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      shape: const CircleBorder(),
                      // clipBehavior: Clip.hardEdge,
                      child: InkWell(
                        radius: 40,
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(AppPadding.p12),
                          child: Icon(Icons.close),
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
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                padding: EdgeInsets.only(top: 30),
                indicatorColor: Colors.black,
                tabs: [
                  Tab(
                    text: 'مستخدمين',
                  ),
                  Tab(
                    text: 'أعمال سابقة',
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: AppPadding.p20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  // textDirection: TextDirection.rtl,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Recent'),
                    Wrap(
                      spacing: 5,
                      direction: Axis.horizontal,
                      children: const [
                        Chip(
                          label: Text('Ahmed'),
                        ),
                        Chip(
                          label: Text('Mohammed'),
                        ),
                        Chip(
                          label: Text('Abdurahmen'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 4,
                        itemBuilder: (context, index) => Directionality(
                          textDirection: TextDirection.ltr,
                          child: ListTile(
                            title: Text('User $index'),
                            leading: const CircleAvatar(
                              radius: 16,
                              child: Text('A'),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: Text(
                  'يرجى إدخال كلمات دلالية للبحث',
                  style: getRegularStyle(color: Colors.black38),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
