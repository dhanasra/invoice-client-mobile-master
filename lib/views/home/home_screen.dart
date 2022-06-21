import 'package:components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im/app/app.dart';
import 'package:im/view_models/home_view_model.dart';
import 'package:im/views/home/dashboard_screen.dart';
import 'package:im/views/home/items_screen.dart';
import 'package:im/views/home/more_screen.dart';
import 'package:im/views/home/parties_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        App().closeApp();
        return true;
      },
      child: Scaffold(
        body: buildView(),
      ),
    );
  }

  Widget buildView(){

    final List<Widget> _children =[
      const DashboardScreen(),
      const PartiesScreen(),
      const ItemsScreen(),
      const MoreScreen()
    ];

    return Scaffold(
      body: _children[HomeViewModel.currentIndex], //
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: onTabTapped,
        elevation: 16,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.PRIMARY_COLOR,
        unselectedItemColor: AppColors.WHITE_3,
        iconSize: 22,
        selectedLabelStyle: const TextStyle(
            fontSize: AppDimen.TEXT_SMALLEST,
            fontFamily: AppFont.FONT,
            fontWeight: FontWeight.w500
        ),
        unselectedLabelStyle: const TextStyle(
            fontSize: AppDimen.TEXT_SMALLEST,
            fontFamily: AppFont.FONT,
            fontWeight: FontWeight.w500
        ),
        currentIndex: HomeViewModel.currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Parties',
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cube_box),
              label: 'Items'
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.ellipsis),
              label: 'More'
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      HomeViewModel.currentIndex = index;
    });
  }
}
