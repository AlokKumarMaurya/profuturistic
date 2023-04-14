import 'package:get/get.dart';

import '../data/appStorage/sharedPrefrences.dart';
import '../modules/VideoLecture/bindings/video_lecture_binding.dart';
import '../modules/VideoLecture/views/video_lecture_view.dart';
import '../modules/askDoubt/bindings/ask_doubt_binding.dart';
import '../modules/askDoubt/views/ask_doubt_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/auth/views/login_view.dart';
import '../modules/auth/views/sign_up_view.dart';
import '../modules/courses/CourseDetailView/CourseStudyView/bindings/course_study_view_binding.dart';
import '../modules/courses/CourseDetailView/CourseStudyView/views/course_study_view_view.dart';
import '../modules/courses/CourseDetailView/bindings/course_detail_view_binding.dart';
import '../modules/courses/CourseDetailView/views/course_detail_view_view.dart';
import '../modules/courses/bindings/courses_binding.dart';
import '../modules/courses/views/courses_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/popular_course_view_all_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/popularCourseDetail/bindings/popular_course_detail_binding.dart';
import '../modules/popularCourseDetail/views/popular_course_detail_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/purchasedPopularCourse/bindings/purchased_popular_course_binding.dart';
import '../modules/purchasedPopularCourse/views/purchased_popular_course_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static  String INITIAL = AppPreference().getLoginSate()?Routes.HOME:Routes.LOGIN;
  static const login = Routes.LOGIN;
  static const signUp = Routes.SIGNUP;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
        name: _Paths.LOGIN,
        page: () => const LoginView(),
        binding: AuthBinding()),
    GetPage(
        name: _Paths.SIGNUP,
        page: () => const SignUpView(),
        binding: AuthBinding()),
    GetPage(
        name: _Paths.PROFILE,
        page: () => const ProfileView(),
        binding: ProfileBinding()),
    GetPage(
        name: _Paths.ASKDOUBT,
        page: () => const AskDoubtView(),
        binding: AskDoubtBinding()),
    GetPage(
        name: _Paths.NOTIFICATION,
        page: () => const NotificationView(),
        binding: NotificationBinding()),
    GetPage(
      name: _Paths.COURSES,
      page: () => const CoursesView(),
      binding: CoursesBinding(),
      children: [
        GetPage(
          name: _Paths.COURSE_DETAIL_VIEW,
          page: () => const CourseDetailViewView(),
          binding: CourseDetailViewBinding(),
          children: [
            GetPage(
              name: _Paths.COURSE_STUDY_VIEW,
              page: () => const CourseStudyViewView(),
              binding: CourseStudyViewBinding(),
            ),
          ],
        ),
      ],
    ),
    GetPage(
      name: _Paths.VIDEO_LECTURE,
      page: () => const VideoLectureView(),
      binding: VideoLectureBinding(),
    ),
    GetPage(
      name: _Paths.POPULAR_COURSE_DETAIL,
      page: () => const PopularCourseDetailView(),
      binding: PopularCourseDetailBinding(),
    ),
    GetPage(
      name: _Paths.ALL_POPULAR_COURSE,
      page: () => const PopularCourseViewAllView(),
      binding: PopularCourseDetailBinding(),
    ),
    GetPage(
      name: _Paths.PURCHASED_POPULAR_COURSE,
      page: () => const PurchasedPopularCourseView(),
      binding: PurchasedPopularCourseBinding(),
    ),
  ];
}
