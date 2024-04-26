import 'package:flutter/material.dart';

import 'package:quranapp/widget/utils_widget.dart';

import '../pages/allsura_pages.dart';
import '../pages/home_pages.dart';
import '../pages/sura_pages.dart';
import '../pages/tasbih_pages.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({Key? key}) : super(key: key);
  static const String routeName = "/bottom";
  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  int _page = 2;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;
  List<Widget> pageMain = [

    SuraPage(),
    TasbiaPage(),
    HomePage(),

    SimpleExampleApp()];
  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        currentIndex: _page,
        onTap: updatePage,
        elevation: 0,
        selectedItemColor: GlobalVarriable.selectedNavBarColor,
        unselectedItemColor: GlobalVarriable.unSelectedNavBarColor,
        // backgroundColor: GlobalVarriable.backGroundColor,
        iconSize: 28,
        items: [




          BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                // width: bottomBarWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: _page == 0
                      ? GlobalVarriable.selectedNavBarColor
                      : null,

                  //     border: Border(
                  //         top: BorderSide(
                  //   color: _page == 0
                  //       ? GlobalVarriable.selectedNavBarColor
                  //       : GlobalVarriable.backGroundColor,
                  //   width: bottomBarBorderWidth,
                  // ))
                ),
                child: Icon(
                  Icons.alarm,
                  color: _page == 0
                      ? Colors.white
                      : GlobalVarriable.backGroundColor,
                ),
              ),
              label: "Oibia"),
          BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                // width: bottomBarWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: _page == 1
                      ? GlobalVarriable.selectedNavBarColor
                      : null,

                  //     border: Border(
                  //         top: BorderSide(
                  //   color: _page == 0
                  //       ? GlobalVarriable.selectedNavBarColor
                  //       : GlobalVarriable.backGroundColor,
                  //   width: bottomBarBorderWidth,
                  // ))
                ),
                child: Icon(
                  Icons.timer,
                  color: _page == 1
                      ? Colors.white
                      : GlobalVarriable.backGroundColor,
                ),
              ),
              label: "Tasbih"),
          BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                // width: bottomBarWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: _page == 2
                      ? GlobalVarriable.selectedNavBarColor
                      : null,

                  //     border: Border(
                  //         top: BorderSide(
                  //   color: _page == 0
                  //       ? GlobalVarriable.selectedNavBarColor
                  //       : GlobalVarriable.backGroundColor,
                  //   width: bottomBarBorderWidth,
                  // ))
                ),
                child: Icon(
                  Icons.home,
                  color: _page == 2
                      ? Colors.white
                      : GlobalVarriable.backGroundColor,
                ),
              ),
              label: "Home"),




          BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                // width: bottomBarWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: _page == 3
                      ? GlobalVarriable.selectedNavBarColor
                      : null,

                  //     border: Border(
                  //         top: BorderSide(
                  //   color: _page == 0
                  //       ? GlobalVarriable.selectedNavBarColor
                  //       : GlobalVarriable.backGroundColor,
                  //   width: bottomBarBorderWidth,
                  // ))
                ),
                child: Icon(
                  Icons.menu,
                  color: _page == 3
                      ? Colors.white
                      : GlobalVarriable.backGroundColor,
                ),
              ),
              label: "Menu"),


        ],
      ),
      body: pageMain[_page],
    );
  }
}
