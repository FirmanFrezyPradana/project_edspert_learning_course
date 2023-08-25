import 'package:project_edspert_learning_course/domain/entity/banners_respon_entity.dart';

abstract class BannerRepository {
  Future<BannerResponseEntity> getBanners();
}
