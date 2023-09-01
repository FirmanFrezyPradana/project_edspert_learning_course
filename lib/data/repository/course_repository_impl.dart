import 'package:dio/dio.dart';
import 'package:project_edspert_learning_course/data/datasource/course_resource_datasource.dart';
import 'package:project_edspert_learning_course/data/model/courseModel.dart';
import 'package:project_edspert_learning_course/domain/entity/course_response_entity.dart';
import 'package:project_edspert_learning_course/domain/repository/course_repository.dart';

class CourseRespositoryImpl implements CourseRepository {
  final CourseRemoteDatasource remoteDataResource;
  const CourseRespositoryImpl({required this.remoteDataResource});
  @override
  Future<CourseResponseEntity> getCourses(String majorName) async {
    // TODO: implement getCourses
    final response = await remoteDataResource.getCourses(majorName);
    final data = CourseResponseEntity(
      status: response.status ?? -1,
      message: response.message ?? '',
      data: List<CourseDataModel>.from(response.data ?? [])
          .map(
            (e) => CourseDataEntity(
              courseId: e.courseId ?? '',
              majorName: e.majorName ?? '',
              courseCategory: e.courseCategory ?? '',
              courseName: e.courseName ?? '',
              urlCover: e.urlCover ?? '',
              jumlahMateri: e.jumlahMateri ?? 0,
              jumlahDone: e.jumlahDone ?? 0,
              progress: e.progress ?? 0,
            ),
          )
          .toList(),
    );
    return data;
  }
}
