import 'package:dio/dio.dart';
import 'package:project_edspert_learning_course/data/model/banerModel.dart';

class BannerRemoteDataSource {
  final Dio client;
  const BannerRemoteDataSource({required this.client});
  Future<BannerResponseModel> getBanners() async {
    try {
      const url = 'https://edspert.widyaedu.com/event/list?limit=5';
      final result = await client.get(
        url,
        options: Options(
          headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
        ),
      );
      final bannerData = BannerResponseModel.fromJson(result.data);
      return bannerData;
    } catch (error, stacktrace) {
      print(stacktrace);
      return BannerResponseModel();
    }
  }
}
