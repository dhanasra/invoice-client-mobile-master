import 'package:components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im/app/app.dart';
import 'package:im/app/app_routes.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  List<List<String>> items = [
    ["launch1.gif","Know how you're doing","See your profit and expenses at a glance"],
    ["launch2.gif","Send receipts on the go","We'll save the details for you"],
    ["launch3.gif","Get paid anywhere","Send and track custom invoices"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Box(
        bgColor: white,
        child: Column(
          children: [
            Expanded(child: CarouselContainer(
              items: items.map((e){
                return sliderCard(e);
              }).toList(),
              controller: PageController(),
              indicatorIsVisible: true,
              containerHeight: 550,
            ),),
            body()
          ],
        )
      ),
    );
  }

  Widget sliderCard(List<String> item){
    return Box(
      child: Column(
        mainAxisAlignment: mainCenter,
        children: [
          Box(asset: item[0],height: 400,width: 400,),
          Label(
            label: item[1],
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          const SizedBox(height: 10,),
          Label(
            label: item[2],
            fontSize: btnText,
          ),
        ],
      ),
    );
  }

  Widget body(){
    return Box(
      margin: const [15,15,0,30],
      child: Column(
        mainAxisAlignment: mainEnd,
        children: [
          PrimaryButton(
            expanded: true,
            height: btnHeight2,
            label: "Launch",
            onPressed: ()=>App().setNavigation(context, AppRoutes.APP_PHONE_NUMBER),
          ),
          const SizedBox(height: 30,),
          const ColorShader(
            child: Label(
              label: "SPIDERLINGZ",
              color: primaryColor,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
