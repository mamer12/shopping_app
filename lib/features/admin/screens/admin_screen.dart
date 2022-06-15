import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/features/admin/screens/posts_screen.dart';

import '../../../constatns/global_var.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  double bottomBarwidth = 42;
  double bottomBarBorderwidth = 5;

  List<Widget> pages = [
    const PostsScreen(),
    const Center(
      child: Text("cart page"),
    )
  ];
  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            elevation: 0,
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(gradient: GlobalVariables.appBarGradient),
            ),
            title: const Center(
                child: Text(
              "Admin",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
          )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          //HomePage
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarwidth,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: _page == 0
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.unselectedNavBarColor,
                            width: bottomBarBorderwidth))),
                child: const Icon(Icons.home),
              ),
              label: "home"),
          //Account
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarwidth,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: _page == 1
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.unselectedNavBarColor,
                            width: bottomBarBorderwidth))),
                child: const Icon(Icons.analytics_outlined),
              ),
              //Cart
              label: "Person"),
          BottomNavigationBarItem(
              icon: Container(
                width: bottomBarwidth,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: _page == 1
                                ? GlobalVariables.selectedNavBarColor
                                : GlobalVariables.unselectedNavBarColor,
                            width: bottomBarBorderwidth))),
                child: const Icon(Icons.all_inbox_outlined),
              ),
              //Cart
              label: "Person"),
        ],
      ),
    );
  }
}
