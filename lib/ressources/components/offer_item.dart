import 'package:architect_hub/model/offre_model.dart';
import 'package:architect_hub/ressources/components/custom_vertical_divider.dart';
import 'package:architect_hub/ressources/components/vertical_label.dart';
import 'package:architect_hub/ressources/extensions/datetime_extension.dart';
import 'package:architect_hub/ressources/styles_manager.dart';
import 'package:flutter/material.dart';

class OfferItem extends StatelessWidget {
  const OfferItem({
    super.key,
    required this.offre,
  });

  final OffreModel offre;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      // height: 160,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 22,
                backgroundColor: Colors.redAccent,
                backgroundImage: AssetImage('assets/images/1.jpg'),
              ),
              const Spacer(),
              Expanded(
                flex: 15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      offre.user.username,
                      style: getBoldStyle(fontSize: 18),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        VerticalLabel(
                          label: 'مدة العمل',
                          text: '${offre.durationInDays} يوم',
                        ),
                        const CustomVerticalDivider(),
                        VerticalLabel(
                          label: 'تاريخ بدء العمل',
                          text: offre.startDate.yMd,
                        ),
                        const CustomVerticalDivider(),
                        VerticalLabel(
                          label: 'السعر المطلوب',
                          text: offre.price.toStringAsFixed(2),
                          thirdText: (offre.isIncludeServices)
                              ? 'شامل الخدمات'
                              : 'إشراف فقط',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
                child: Text(
                  'عرض العقد',
                  style: getMediumStyle(fontSize: 16),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
                child: Text(
                  'المحادثة',
                  style: getMediumStyle(fontSize: 16),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
                child: Text(
                  'إختيار مقدم الخدمة',
                  style: getMediumStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
