import 'package:architect_hub/model/request_model.dart';
import 'package:architect_hub/ressources/extensions/datetime_extension.dart';
import 'package:architect_hub/ressources/extensions/request_type_extension.dart';
import 'package:architect_hub/ressources/routes_manager.dart';
import 'package:architect_hub/ressources/styles_manager.dart';
import 'package:flutter/material.dart';

class RequestItem extends StatelessWidget {
  const RequestItem({super.key, required this.request});

  final RequestModel request;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 0,
      ),
      // height: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('رقم الطلب ${request.id}'),
              Row(
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(request.state.requestTypeToString),
                ],
              ),
            ],
          ),
          Text(
            request.title,
            style: getBoldStyle(fontSize: 18),
          ),
          Text(
            request.date.yMd,
            style: getMediumStyle(fontSize: 13, color: Colors.black38),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('العروض المستلمة ${request.numberOfOffers}'),
              StackedImages(
                images: request.usersProfilePicture,
                shownImages: 3,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(
              context,
              Routes.offersRoute,
              arguments: 1,
            ),
            child: const Text('مشاهدة العروض'),
          ),
          const SizedBox(
            height: 5,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: const BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
            child: Text(
              'تفاصيل الطلب',
              style: getMediumStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class StackedImages extends StatelessWidget {
  const StackedImages({super.key, required this.images, this.shownImages = 3});
  final List<String> images;
  final int shownImages;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(
        (images.length <= shownImages) ? images.length : shownImages,
        (index) => Transform.translate(
          offset: Offset(index * 20, 0),
          child: circleProfilePic(images[index]),
        ),
      )..add(
          Transform.translate(
            offset: Offset(shownImages * 20, 0),
            child: circleCount(images.length),
          ),
        ),
    );
  }

  Container circleProfilePic(String image) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          )),
    );
  }

  Widget circleCount(int length) {
    int count = length - 3;
    if (count > 0) {
      return Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
        ),
        child: Center(
          child: FittedBox(
            child: Text(
              '+$count',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    }
    return const SizedBox();
  }
}
