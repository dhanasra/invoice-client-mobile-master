import '../app/app.dart';

class HomeViewModel {

  static late HomeViewModel _instance;

  factory HomeViewModel(App app) {
    _instance = HomeViewModel._internal();
    return _instance;
  }

  static int currentIndex = 0;

  HomeViewModel._internal() {
    _init();
  }

  void _init(){

  }


}