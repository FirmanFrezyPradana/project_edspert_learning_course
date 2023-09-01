import 'package:project_edspert_learning_course/domain/entity/course_response_entity.dart';

abstract class CourseRepository {
  Future<CourseResponseEntity> getCourses(String majorName);
}
