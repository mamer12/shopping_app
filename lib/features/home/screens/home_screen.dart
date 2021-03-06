import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/features/widgets/address_box.dart';
import 'package:shopping_app/features/widgets/carousel_image.dart';
import 'package:shopping_app/features/widgets/deal_of_the_day.dart';
import 'package:shopping_app/provieders/user_provider.dart';

import '../../../constatns/global_var.dart';
import '../../widgets/top_cateogries.dart';
import '../search/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void navigateToSearchQuery(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: AppBar(
              elevation: 0,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                    gradient: GlobalVariables.appBarGradient),
              ),
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Container(
                            height: 42,
                            margin: const EdgeInsets.only(left: 15),
                            child: Material(
                                borderRadius: BorderRadius.circular(7),
                                elevation: 1,
                                child: TextFormField(
                                  onFieldSubmitted: navigateToSearchQuery,
                                  decoration: InputDecoration(
                                      prefixIcon: InkWell(
                                          onTap: () {},
                                          child: const Padding(
                                            padding: EdgeInsets.only(left: 6),
                                            child: Icon(Icons.search_outlined,
                                                color: Colors.black, size: 23),
                                          )),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          const EdgeInsets.only(top: 10),
                                      border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7)),
                                        borderSide: BorderSide.none,
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(7)),
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 1),
                                      ),
                                      hintText: "Search in the app",
                                      hintStyle: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17)),
                                )))),
                  ]),
            )),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              AddressBox(),
              SizedBox(
                height: 20,
              ),
              CarouselImage(),
              SizedBox(
                height: 20,
              ),
              TopCategories(),
              SizedBox(
                height: 10,
              ),
              DealOfTheDay()
            ],
          ),
        ));
  }
}
