import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:project_edspert_learning_course/data/datasource/banner_resource_datasource.dart';
import 'package:project_edspert_learning_course/data/repository/banner_response_impl.dart';
import 'package:project_edspert_learning_course/domain/entity/banners_respon_entity.dart';
import 'package:project_edspert_learning_course/presentation/screen/home/home_controller.dart';
import 'package:project_edspert_learning_course/presentation/screen/home/widgets/banner_builder.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    print('Get : ${Get.width} infinite :${double.infinity}');
    return Scaffold(
      backgroundColor: Color(0xFFF3F7F8),
      appBar: AppBar(
        automaticallyImplyLeading: false, //menghilangkan tombol kembali
        backgroundColor: Color(0xFFF3F7F8),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hai, Firman',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Selamat Datang',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            Column(
              children: [
                Image(
                  image: AssetImage('assets/image/edo_selfie.png'),
                  height: 40,
                  width: 40,
                ),
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Get.width,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF3A7FD5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 40, left: 10),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'Mau kerjain\nlatihan soal\napa hari ini?',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        'assets/image/semangat.png',
                        width: 230,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Pilih Pelajaran',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Lihat Semua',
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              GetBuilder<HomeController>(
                  init: homeController,
                  initState: (state) => homeController.getCourse('IPA'),
                  builder: (cHome) {
                    return ListView.separated(
                      itemCount: 3,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 8,
                      ),
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final course = cHome.courseList[index];
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          height: 96,
                          padding: EdgeInsets.symmetric(horizontal: 13),
                          width: Get.width,
                          child: Row(
                            children: [
                              Container(
                                height: 53,
                                width: 53,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.amber),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      course.majorName,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${course.jumlahMateri}',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    LinearProgressIndicator(
                                      value: 0.5,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  }),
              const Text(
                'Terbaru',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 150,
                child: GetBuilder<HomeController>(
                    init: homeController,
                    initState: (state) => homeController.getBanners(),
                    builder: (hCon) {
                      //hcon mewakilkan homecontroller
                      final bannerList = hCon.banner;
                      return bannerList.isEmpty
                          ? const Center(child: CircularProgressIndicator())
                          : BannerBuilder(bannerList: bannerList);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
