import 'package:project_edspert_learning_course/domain/entity/banners_respon_entity.dart';
import 'package:project_edspert_learning_course/domain/repository/banner_repository.dart';

class GetBannerUsecase {
  final BannerRepository repository;
  const GetBannerUsecase({required this.repository});
  Future<BannerResponseEntity> call() async => await repository.getBanners();
}
