import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/constatns/global_var.dart';
import 'package:shopping_app/features/account/screens/account_screen.dart';
import 'package:shopping_app/features/home/screens/home_screen.dart';
import 'package:shopping_app/provieders/user_provider.dart';

import '../../features/cart/screen/cart_screen.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarwidth = 42;
  double bottomBarBorderwidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const CartScreen(),
    const AccountScreen(),
  ];
  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: GlobalVariables.backgroundColor,
              gap: 8,
              activeColor: GlobalVariables.backgroundColor,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.purple.shade400,
              haptic: true,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: Icons.home_outlined,
                  text: 'Home',
                  backgroundColor: Colors.red.shade400,
                ),
                GButton(
                  icon: Icons.shopping_bag_outlined,
                  text: 'Cart',
                  onPressed: () => {userCartLen.toString()},
                ),
                GButton(
                  icon: Icons.person_outline,
                  text: 'Profile',
                  backgroundColor: Colors.deepOrangeAccent,
                ),
              ],
              selectedIndex: _page,
              onTabChange: (index) {
                setState(() {
                  _page = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}


                
  // Badge(
  //                   elevation: 0,
  //                   badgeContent: Text(userCartLen.toString()),
  //                   badgeColor: Colors.white,
  //                   child: const Icon(Icons.shopping_bag_outlined)),
  //             ),