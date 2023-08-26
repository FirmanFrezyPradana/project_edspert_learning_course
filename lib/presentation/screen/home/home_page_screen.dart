import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:project_edspert_learning_course/data/datasource/banner_resource_datasource.dart';
import 'package:project_edspert_learning_course/data/repository/banner_response_impl.dart';
import 'package:project_edspert_learning_course/domain/entity/banners_respon_entity.dart';
import 'package:project_edspert_learning_course/domain/usecase/get_baner_usecase.dart';
import 'package:project_edspert_learning_course/presentation/screen/home/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, //menghilangkan tombol kembali
        backgroundColor: Color(0xFF3A7FD5),
      ),
      body: SizedBox(
        height: 150,
        child: GetBuilder<HomeController>(
            init: homeController,
            initState: (state) => homeController.getBanners(),
            builder: (hCon) {
              //hcon mewakilkan homecontroller
              final bannerList = hCon.banner;

              return bannerList.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: bannerList.length,
                      //separetor bilder digunakan untuk memisahkan jarak antar image
                      itemBuilder: (context, index) {
                        final banner = bannerList[index];

                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image.network(
                            banner.eventImage, //gambar dari event image
                            height: 146,
                          ),
                        );
                      },
                    );
            }),
      ),
    );
  }
}
