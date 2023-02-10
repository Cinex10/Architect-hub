import 'package:architect_hub/ressources/values_manager.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
            leading: const SizedBox(),
            elevation: 0,
            flexibleSpace: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              padding: const EdgeInsets.only(
                right: 20,
              ),
              height: 50,
              width: 600,
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
                            hintText: 'إسم المصمم',
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
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding:
              const EdgeInsetsDirectional.symmetric(horizontal: AppPadding.p20),
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
      ),
    );
  }
}
