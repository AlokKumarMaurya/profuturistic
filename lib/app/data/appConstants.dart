class AppConstants{
  static const String appName="Pro-futuristic";

  //shared Preferences key
static const String saveLoginKey="LOGIN";


//png assets
static const String appLogoImage="assets/logo.png";
static const String googleImage="assets/google.png";

  static const baseUrl =
      "https://falconsoftwaresolutions.in/profuturistic/api/";

  //https://falconsoftwaresolutions.in/profuturistic/api/authentication/registration

  //auth
  static const signUp = "${baseUrl}authentication/registration";
  static const login = "${baseUrl}authentication/login";

//courses
static const popularCourse="${baseUrl}student_api/courses_get";
static const allPopularCourse="${baseUrl}student_api/course_all";
static const courseTabList="${baseUrl}student_api/batch_courses";
static const allTabCourse="${baseUrl}student_api/batch_courses_all";
static const getCourseById="${baseUrl}student_api/get_batch_courses/";


}