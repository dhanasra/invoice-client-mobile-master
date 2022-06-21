import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:im/app/app.dart';
import 'package:im/app/app_routes.dart';
import 'package:im/view_models/splash_view_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  late SplashViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = SplashViewModel(App());
    viewModel.splashLoad.sink.add("loading");
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      body: StreamBuilder(
          stream: viewModel.splashLoad.stream,
          builder: (BuildContext context,AsyncSnapshot shot){

            if(shot.data=="finish"){
              App().setNavigation(context, AppRoutes.APP_HOME);
            }

            return Stack(
              children: [
                body(),
                 const Positioned(
                    bottom: 15,
                    left: 0,
                    right: 0,
                    child: ColorShader(
                      child: Label(
                        label: "SPIDERLINGZ",
                        color: primaryColor,
                        fontSize: 12,
                      ),
                    )
                )
              ],
            );
          }),
    );
  }

  Widget body(){
    return Box(
      expanded: true,
      alignment: center,
      bgColor: white,
      child:RotationAnimation(
            child: Box(
              width: 80,
              height: 80,
              child: Image.asset("assets/images/logo.png"),
            ),
            duration: 8,
            controller: (control)=>control.forward(),
            animation: (anim){}
        )
      );
  }
}

