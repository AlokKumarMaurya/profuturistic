class AppConstants {
  static const String appName = "Pro-futuristic";

  //shared Preferences key
  static const String saveLoginKey = "LOGIN";
  static const String saveLoginData = "LOGIN_DATA";

//png assets
  static const String appLogoImage = "assets/logo.png";
  static const String googleImage = "assets/google.png";

  static const baseUrl =
      "https://falconsoftwaresolutions.in/profuturistic/api/";

  //https://falconsoftwaresolutions.in/profuturistic/api/authentication/registration

  //auth
  static const signUp = "${baseUrl}authentication/registration";
  static const login = "${baseUrl}authentication/login";

//courses
//   static const popularCourse = "${baseUrl}student_api/courses_get";
  static const popularCourse = "${baseUrl}student_api/batch_courses_all";
  static const allPopularCourse = "${baseUrl}student_api/batch_courses_all";
  // static const allPopularCourse = "${baseUrl}student_api/course_all";
  static const courseTabList = "${baseUrl}student_api/batch_courses";
  static const allTabCourse = "${baseUrl}student_api/batch_courses_all";
  static const getCourseById = "${baseUrl}student_api/get_batch_courses/";
  static const getPopularCourseDetailById =
      "${baseUrl}student_api/get_courses_details/";
  static const getEnrolledCourse = "${baseUrl}student_api/enrolled_course/";
  // static const getEnrolledCourseDetail = "${baseUrl}student_api/get_syllabus/";
  static const getEnrolledCourseDetail = "${baseUrl}student/getSyllabusByBatchId/";
  static const getNotification = "${baseUrl}student/getNotification/";
  static const getAssignment = "${baseUrl}student/getAssignmentByBatchId/";
  static const getCourseVideo = "${baseUrl}student/getCourseLectureByBatchId/";

  static var markAllAsRead="${baseUrl}student/getMarkAsAllReadNotificationByStudentId/";

  static var getBanner="${baseUrl}student/getBanners";

  static var sendPaymentSuccessResponse="${baseUrl}student/purchaseBatch";

  static var getSyllabus="${baseUrl}student/getMyBatchSyllabusByStudentId/";

  static var getZoomData="${baseUrl}student/live-class/";//ad201/67
}
