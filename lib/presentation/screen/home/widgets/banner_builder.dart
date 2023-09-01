import 'package:flutter/material.dart';
import 'package:project_edspert_learning_course/domain/entity/banners_respon_entity.dart';

class BannerBuilder extends StatelessWidget {
  final List<BannerDataEntity> bannerList;
  const BannerBuilder({required this.bannerList, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: bannerList.length,
      //separetor bilder digunakan untuk memisahkan jarak antar image
      itemBuilder: (context, index) {
        final banner = bannerList[index];
        return Padding(
          padding: EdgeInsets.only(right: 10),
          child: Image.network(
            banner.eventImage, //gambar dari event image
            height: 146,
          ),
        );
      },
    );
  }
}
