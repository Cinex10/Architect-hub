import 'package:architect_hub/ressources/components/bottom_navigation_bar.dart';
import 'package:architect_hub/ressources/components/image_carousel.dart';
import 'package:architect_hub/ressources/extensions/datetime_extension.dart';
import 'package:architect_hub/ressources/routes_manager.dart';
import 'package:architect_hub/ressources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(240),
            child: AppBar(
              elevation: 0,
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
                          onPressed: () =>
                              Navigator.pushNamed(context, Routes.chatRoute),
                          label: const Text('تواصل معي'),
                          icon: const Icon(Icons.call),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star_rate_rounded),
                        const SizedBox(
                          width: 10,
                        ),
                        RichText(
                          text: TextSpan(
                              text: '(27 مراجعة)',
                              style: getRegularStyle(
                                fontSize: 17,
                                color: Colors.black38,
                              ),
                              children: [
                                TextSpan(
                                    text: ' 4.7',
                                    style: getBoldStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                    )),
                                const TextSpan(
                                  text: '/5 ',
                                )
                              ]),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_on),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'مدينة القاهرة',
                          style: getBoldStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.insert_invitation_rounded),
                        const SizedBox(
                          width: 10,
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'عضو منذ ',
                              style: getRegularStyle(
                                fontSize: 17,
                                color: Colors.black38,
                              ),
                              children: [
                                TextSpan(
                                  text: 'أكتوبر 2022',
                                  style: getBoldStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
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
                    text: "معرض الأعمال",
                  ),
                  Tab(
                    text: "مراجعات",
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ResponsiveGridList(
                horizontalGridSpacing: 10,
                verticalGridSpacing: 20,
                horizontalGridMargin: 10,
                verticalGridMargin: 20,
                minItemWidth: 100,
                minItemsPerRow: 5,
                maxItemsPerRow: 10,
                listViewBuilderOptions: ListViewBuilderOptions(
                  physics: const NeverScrollableScrollPhysics(),
                ),
                children: List.generate(
                  20,
                  (index) => GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => ImagesCarousel(
                          initialIndex: index,
                          images: const [
                            'assets/images/1.jpg',
                            'assets/images/2.jpg',
                            'assets/images/1.jpg',
                            'assets/images/2.jpg'
                          ],
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.asset(
                          'assets/images/1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.symmetric(horizontal: 1.sw > 900 ? 0.2.sw : 10),
                padding: const EdgeInsets.all(10.0),
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: 3,
                  itemBuilder: (context, index) => RatingBox(
                    comment:
                        'عندما وصلنا لأول مرة ، أرتنا روزي الشقة. تركوا لنا زجاجة نبيذ وبعض زيت الزيتون. أقمنا لمدة 3 أسابيع في يناير. ترك لنا جارد وروزي ما يكفي من المناشف والملاءات ومنتجات التنظيف ووسائل الراحة الأخرى طوال فترة إقامتنا. الشقة بالضبط كما هو موضح في الصور. الأثاث مريح للغاية. يوجد تلفزيون ذكي في غرفة المعيشة ، حتى تتمكن من مشاهدة خدمات البث. كانت Quarteira مثالية بالنسبة لنا. تقع المطاعم ومحلات البقالة والحانات على مسافة قريبة من الشقة. Quarteira (على عكس Vilamoura) لديها مطاعم مفتوحة في يناير. مشينا إلى فيلامورا لنجد أن 90 بالمائة من المطاعم والمتاجر مغلقة. لقد أحببنا هذه الشقة. لقد غادرنا اليوم ، ونتطلع بالفعل لحجز إقامة أطول العام المقبل. لا تتردد في التواصل معنا لطرح أي أسئلة.',
                    date: DateTime.now(),
                    profilePic: 'assets/images/1.jpg',
                    rating: 3.4,
                    username: 'أحمد معتز',
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: const BottomNavBar(
            currentRoute: Routes.profileRoute,
          ),
        ),
      ),
    );
  }
}

class RatingBox extends StatelessWidget {
  const RatingBox({
    super.key,
    required this.username,
    required this.profilePic,
    required this.date,
    required this.rating,
    required this.comment,
  });
  final String username;
  final String profilePic;
  final DateTime date;
  final double rating;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(color: Colors.black87),
      ),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(profilePic),
              radius: 20,
            ),
            title: Text(username),
            subtitle: Text(date.yMd),
            trailing: FittedBox(
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    size: 18,
                    color: Colors.black,
                  ),
                  Text(
                    ' ${rating.toStringAsFixed(1)}',
                    style: getBoldStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          ReadMoreText(
            comment,
            trimLines: 2,
            colorClickableText: Colors.pink,
            trimMode: TrimMode.Line,
            style: getRegularStyle(fontSize: 15),
            trimCollapsedText: 'اقرأ المزيد',
            trimExpandedText: 'اقرأ أقل',
            moreStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            lessStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
