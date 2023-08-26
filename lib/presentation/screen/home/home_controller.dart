//diguunakan untuk tempat logic dari program home , tempat tujuan state manajemen

import 'package:get/get.dart';
import 'package:project_edspert_learning_course/domain/entity/banners_respon_entity.dart';
import 'package:project_edspert_learning_course/domain/usecase/get_baner_usecase.dart';

class HomeController extends GetxController {
  final GetBannerUsecase bannerUsecase;

  // List<BannerDataEntity> banner = [];
//ketika didalam sstartefull terdapar set state untuk me listen  merebuild komponen
//sedangkan pada saat ini belum ada

// pada getX terdapat
  RxList<BannerDataEntity> banner = <BannerDataEntity>[].obs;
  Rx<List<BannerDataEntity>> banner2 = Rx([]);
  // rx list digunakan untuk listen karena pada state manageement perlu membungkus sama state management masing2
  // nantinya get material app akan mekihat ke anak2 nya, oelh karena itu
  // list baner danlist banner 2 bisa di listen sehingga nantinya dapat dirender pada apliakasi

  HomeController({required this.bannerUsecase});

  void getBanners() async {
    final result = await bannerUsecase.call();
    banner.value = result.data;
    banner2(result.data);
    update();
    // update sama seperti setstate dia akan mengupdate value dari variable rx
  }
}
