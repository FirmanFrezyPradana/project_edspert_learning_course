import 'package:project_edspert_learning_course/data/datasource/banner_resource_datasource.dart';
import 'package:project_edspert_learning_course/data/model/banerModel.dart';
import 'package:project_edspert_learning_course/domain/entity/banners_respon_entity.dart';
import 'package:project_edspert_learning_course/domain/repository/banner_repository.dart';

class BannerRepositoryImpl implements BannerRepository {
  final BannerRemoteDataSource remoteDataSource;
  const BannerRepositoryImpl({required this.remoteDataSource});
  @override
  Future<BannerResponseEntity> getBanners() async {
    // TODO: implement getBanners
    final bannerModel = await remoteDataSource.getBanners();
    final data = BannerResponseEntity(
      message: bannerModel.message ?? '',
      status: bannerModel.status ?? -1,
      data: List<BannerDataModel>.from(bannerModel.data ?? [])
          .map(
            (e) => BannerDataEntity(
              eventId: e.eventId ?? '',
              eventTitle: e.eventTitle ?? '',
              eventDescription: e.eventDescription ?? '',
              eventImage: e.eventImage ?? '',
              eventUrl: e.eventUrl ?? '',
            ),
          )
          .toList(),
    );
    return data;
  }
}
