import 'package:components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im/app/app.dart';
import 'package:im/app/app_routes.dart';
import 'package:im/widgets/view/option.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0), // here the desired height
          child: Column(
            crossAxisAlignment: crossStart,
            children: [
              AppBar(
                toolbarHeight: 100,
                automaticallyImplyLeading: false,
                title: Column(
                  crossAxisAlignment: crossStart,
                  children: [
                    const Label(
                      mainAxisAlignment: mainEnd,
                      isReverse:true,
                      label: "Business Name",
                      color: AppColors.BLACK_2,
                      fontFamily: AppFont.FONT,
                      fontWeight: FontWeight.w600,
                    ),
                    InkWell(
                      child: const Box(
                        margin: [0,0,10,0],
                        borderColor: AppColors.WHITE_3,
                        radius: 4,
                        padding: [8,2,0,0],
                        child: Label(
                            fontSize: 10,
                            color: AppColors.GRAY,
                            label: "business_settings",
                            suffix: Icon(Icons.arrow_drop_down_outlined,color: black,)
                        ),
                      ),
                      onTap: ()=>App().setNavigation(context, AppRoutes.APP_BUSINESS_SETTINGS),
                    )
                  ],
                ),
                shadowColor: AppColors.WHITE,
                elevation: 0,
                actions: const [
                  Box(width: 80,height: 35,asset: "logo.png",radius: 10,margin: [10,10],),
                ],
              ),
            ],
          )
      ),
      body: Container(
        child: body(),
      ),
    );
  }

  Widget body(){
    return ListView(
      children: [
        Option(
          title: "Invoice Maker Subscription Plans",
          icon: Icons.star_purple500_outlined,
          onClick: ()=>App().setNavigation(context, AppRoutes.APP_SUBSCRIPTION_PLAN),
          bgColor: Colors.green.withOpacity(0.2),
          iconColor: Colors.green,
          txtColor: Colors.green,
        ),
        const Label(
          padding: [15],
          fontWeight: FontWeight.w600,
          color: textColor1,
          label: "Settings",mainAxisAlignment: mainStart,),
        Option(title: "invoice_settings",icon: Icons.notes,onClick: ()=>App().setNavigation(context, AppRoutes.APP_INVOICE_SETTINGS),),
        Option(title: "account_settings",icon: Icons.person_outline,onClick: ()=>App().setNavigation(context, AppRoutes.APP_ACCOUNT_SETTINGS),),
        Option(title: "reminder_settings",icon: Icons.notifications_none_rounded,onClick: ()=>App().setNavigation(context, AppRoutes.APP_REMINDER_SETTINGS),),
        Option(title: "Manage Staff",icon: Icons.group,onClick: ()=>App().setNavigation(context, AppRoutes.APP_MANAGE_STAFF),),
        const Label(
          padding: [15],
          fontWeight: FontWeight.w600,
          color: textColor1,
          label: "others",mainAxisAlignment: mainStart,),
        Option(title: "greetings",icon: Icons.card_giftcard,onClick: ()=>App().setNavigation(context, AppRoutes.APP_GREETINGS),),
        Option(title: "business_card",icon: Icons.credit_card,onClick: ()=>App().setNavigation(context, AppRoutes.APP_BUSINESS_CARD),),
        Option(title: "rate_app",icon: Icons.star_border,onClick: ()=>{},),
        Option(title: "about",icon: Icons.info_outline_rounded,onClick: ()=>App().setNavigation(context, AppRoutes.APP_ABOUT),),

      ],
    );
  }
}
