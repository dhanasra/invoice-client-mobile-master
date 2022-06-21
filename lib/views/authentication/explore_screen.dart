import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:im/app/app.dart';
import 'package:im/app/app_routes.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Box(
            padding: const [15, 15, 0, 15],
            expanded: true,
            bgColor: white,
            child: buildView()
          )
      )
    );
  }

  Widget buildView(){
    return Column(
        children: [
          Content(
            margin: const [0,0,50,0],
            text: "Your company is all set!",
            color: primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 18,
            fontFamily: GoogleFonts.openSans().fontFamily,
            expanded: true,
            textAlign: start,
          ),
          Content(
            margin: const [0,0,0,10],
            text: "Now, explore and learn how InvoiceMaker improves your productivity!",
            color: textColor1,
            fontWeight: FontWeight.w600,
            fontSize: 12,
            fontFamily: GoogleFonts.openSans().fontFamily,
            expanded: true,
            textAlign: start,
          ),
          const Box(
            asset: 'balloon.gif',
            expanded: true,
            height: 400,
          ),
          PrimaryButton(
            margin: const [0,0,40,20],
            expanded: true,
            type: 1,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: GoogleFonts.openSans().fontFamily,
            height: btnHeight2,
            label: "Explore Invoice Maker",
            onPressed: ()=>App().setNavigation(context, AppRoutes.APP_HOME),
          ),
        ]
    );
  }
}
