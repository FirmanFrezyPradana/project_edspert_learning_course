import 'package:project_edspert_learning_course/domain/entity/course_response_entity.dart';
import 'package:project_edspert_learning_course/domain/repository/course_repository.dart';

class GetCourseUseCase {
  final CourseRepository repository;

  const GetCourseUseCase({required this.repository});
  Future<CourseResponseEntity> call(String majorName) async =>
      await repository.getCourses(majorName);
}
