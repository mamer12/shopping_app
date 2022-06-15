import 'package:flutter/material.dart';
import 'package:shopping_app/constatns/global_var.dart';
import 'package:shopping_app/features/account/widgets/below_appBar.dart';
import 'package:shopping_app/features/account/widgets/orders.dart';

import '../widgets/top_buttons.dart';

class AccountScreeb extends StatelessWidget {
  const AccountScreeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            elevation: 0,
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(gradient: GlobalVariables.appBarGradient),
            ),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    // child: Image.asset(
                    //   "",
                    //   width: 120,
                    //   height: 45,
                    //   color: Colors.black,
                    // ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Icon(
                          Icons.notifications_outlined,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Icon(
                          Icons.search_outlined,
                          color: Colors.white,
                        ),
                      )
                    ]),
                  )
                ]),
          )),
      // ignore: prefer_const_constructors
      body: Column(children: const [
        BelowAppBar(),
        SizedBox(
          height: 10,
        ),
        TopButtins(),
        SizedBox(
          height: 10,
        ),
        Orders()
      ]),
    );
  }
}
