import 'package:ecommerce_shopanbd/data/models/home_slider_model.dart';
import 'package:ecommerce_shopanbd/data/services/network_caller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  bool _getSliderInProgress = false;

  HomeSliderModel _homeSliderModel = HomeSliderModel();

  bool get getSliderInProgress => _getSliderInProgress;
  HomeSliderModel get getHomeSliderModel => _homeSliderModel;
  Future<bool> getHomeSlider() async {
    _getSliderInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: '/ListProductSlider');
    _getSliderInProgress = false;
    if (response.isSuccess) {
      _homeSliderModel = HomeSliderModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
