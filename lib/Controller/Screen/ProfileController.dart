import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import '../../Core/Class/statusRequest.dart';
import '../../Core/Function/handleData.dart';
import '../../Core/Services/services.dart';
import '../../Data/Remote/profile.dart';
import 'package:flutter/material.dart';

class ProfileController extends GetxController {
  int ac = 0, ca = 0;
  double allRating = 0, countRating = 0;
  Map data = {};
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  ProfileData historyOrderData = ProfileData(Get.find());
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var res = await historyOrderData
        .postdata(myServices.sharedPreferences.getString("id")!);
    print(res);
    statusRequest = handleData(res);
    if (statusRequest == StatusRequest.success) {
      if (res['status'] == "success") {
        ac = int.parse(res['accept']['accept']);
        ca = int.parse(res['cancel']['cancel']);
        if(res['all_rating']['all_rating']!=null)
        allRating = double.parse(res['all_rating']['all_rating']);
        countRating = double.parse(res['count_rating']['count_rating']);
        data.addAll(res["data"]);
      } else
        statusRequest = StatusRequest.fallure;
    }
    update();
  }

  ImageCamer() async {
    final PickedFile? file = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 90);
    update();
  }

  ImageGallery([isSvg = false]) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions:
            isSvg ? ["svg", "SVG"] : ["png", "PNG", "jpg", "jpeg", "gif"]);
    print("**************");
    print(result!.files.single.path);
  }

  @override
  void onInit() {
    getData();

    super.onInit();
  }
}
