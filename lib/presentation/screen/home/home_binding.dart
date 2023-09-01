//digunakan unruk injection
//tempat seluruh dependency

// membutuhkan get banner usecase => depedency repository => depemdency datasource => hreff tipe client (DIO)
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:project_edspert_learning_course/data/datasource/banner_resource_datasource.dart';
import 'package:project_edspert_learning_course/data/datasource/course_resource_datasource.dart';
import 'package:project_edspert_learning_course/data/repository/banner_response_impl.dart';
import 'package:project_edspert_learning_course/data/repository/course_repository_impl.dart';
import 'package:project_edspert_learning_course/domain/repository/banner_repository.dart';
import 'package:project_edspert_learning_course/domain/repository/course_repository.dart';
import 'package:project_edspert_learning_course/domain/usecase/get_baner_usecase.dart';
import 'package:project_edspert_learning_course/domain/usecase/get_course_usecase.dart';
import 'package:project_edspert_learning_course/presentation/screen/home/home_controller.dart';

class HomeBidings extends Bindings {
  @override
  void dependencies() {
    // GetBannerUsecase(
    //   repository: BannerRepositoryImpl(
    //     remoteDataSource: BannerRemoteDataSource(client: Dio()),
    //   ),
    // )

    // get bannerusecase akan dipanggil di controller dan cntroller yang memiliki -
    //dependency oleh karena itu home controller dibutuhkan register di binding juga

    Get.lazyPut<HomeController>(
      () => HomeController(
        bannerUsecase: Get.find<GetBannerUsecase>(),
        courseUseCase: Get.find<GetCourseUseCase>(),
      ),
    );
    Get.lazyPut<GetCourseUseCase>(
      () => GetCourseUseCase(repository: Get.find<CourseRepository>()),
    );
    Get.lazyPut<GetBannerUsecase>(
      () => GetBannerUsecase(repository: Get.find<BannerRepository>()),
    );
    Get.lazyPut<BannerRepository>(
      () => BannerRepositoryImpl(
          remoteDataSource: Get.find<BannerRemoteDataSource>()),
    );
    Get.lazyPut<CourseRepository>(
      () => CourseRespositoryImpl(
          remoteDataResource: Get.find<CourseRemoteDatasource>()),
    );
    Get.lazyPut<BannerRemoteDataSource>(
      () => BannerRemoteDataSource(client: Get.find<Dio>()),
    );
    Get.lazyPut<CourseRemoteDatasource>(
      () => CourseRemoteDatasource(client: Get.find<Dio>()),
    );
    Get.lazyPut<Dio>(
      () => Dio(),
    );
    // lazzyput tergantung generate type
  }
}
