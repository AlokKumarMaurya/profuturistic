import 'package:get/get.dart';

class VideoLectureController extends GetxController {
  List<Map<String,String>> modulesList = List.generate(20, (index) =>
  {"title":"Module ${index + 1}","image":"https://picsum.photos/100/100"});
}
