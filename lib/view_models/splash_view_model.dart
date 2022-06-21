import 'dart:async';

import 'package:im/app/app.dart';

class SplashViewModel{
  static late SplashViewModel _instance;

  factory SplashViewModel(App app) {
    _instance = SplashViewModel._internal();
    return _instance;
  }

  SplashViewModel._internal() {
    _init();
  }

  late StreamController splashLoad;

  void _init(){
    splashLoad = StreamController<String>.broadcast();
    startTimer();
  }

  void startTimer(){
    var time = 3;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if(time==0){
        timer.cancel();
        splashLoad.sink.add("finish");
      }else{
        time--;
      }
    });
  }
}