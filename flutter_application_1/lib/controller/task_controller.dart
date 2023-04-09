import 'package:get/get.dart';

class TaskController extends GetxController {
  var flutterToplamModul = 25.obs;
  var flutterTamamlananModul = -2.obs;
  var unityToplamModul = 52.obs;
  var unityTamamlananModul = -4.obs;
  var girisimcilikToplamModul = 22.obs;
  var girisimcilikTamamlananModul = 0.obs;
  var ingilizceToplamModul = 8.obs;
  var ingilizceTamamlananModul = 0.obs;
  RxDouble flutterYuzde = 0.0.obs;
  RxDouble unityYuzde = 0.0.obs;
  RxDouble girisimcilikYuzde = 0.0.obs;
  RxDouble ingilizceYuzde = 0.0.obs;
  var allTasks = [].obs;
}
