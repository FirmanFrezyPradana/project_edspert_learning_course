import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_edspert_learning_course/data/datasource/banner_resource_datasource.dart';
import 'package:project_edspert_learning_course/data/repository/banner_response_impl.dart';
import 'package:project_edspert_learning_course/domain/entity/banners_respon_entity.dart';
import 'package:project_edspert_learning_course/domain/usecase/get_baner_usecase.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final BannersUseCae = GetBannerUsecase(
      repository: BannerRepositoryImpl(
          remoteDataSource: BannerRemoteDataSource(client: Dio())));
  @override
  BannerResponseEntity? bannerResponse;

  void getBaners() async {
    bannerResponse = await BannersUseCae.call();
    setState(() {});
  }

  void initState() {
    // TODO: implement initState
    getBaners();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, //menghilangkan tombol kembali
        backgroundColor: Color(0xFF3A7FD5),
      ),
      body: SizedBox(
        height: 150,
        child: bannerResponse == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: bannerResponse?.data.length,
                //separetor bilder digunakan untuk memisahkan jarak antar image
                itemBuilder: (context, index) {
                  final banner = bannerResponse?.data[index];
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image.network(
                      banner?.eventImage ?? '', //gambar dari event image
                      height: 146,
                    ),
                  );
                },
              ),
      ),
    );
  }
}
