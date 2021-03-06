import 'package:flutter/material.dart';

String uri = 'https://appshoppp.herokuapp.com';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 106, 29, 201),
      Color.fromARGB(255, 162, 125, 221),
    ],
    stops: [0.15, 1.0],
  );

  static const secondaryColor = Color.fromARGB(255, 153, 0, 255);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = const Color.fromARGB(255, 131, 0, 143);
  static const unselectedNavBarColor = Colors.black87;

  // STATIC IMAGES
  static const List<String> carouselImages = [
    'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wireless/AdvantagePrime/BAU/14thJan/D37196025_IN_WL_AdvantageJustforPrime_Jan_Mob_ingress-banner_1242x450.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Essentials',
      'image': 'assets/images/essentials.jpg',
    },
    {
      'title': 'mobiles',
      'image': 'assets/images/mobiles.jpg',
    },
    {
      'title': 'Appliances',
      'image': 'assets/images/appliances.jpg',
    },
    {
      'title': 'Books',
      'image': 'assets/images/books.jpg',
    },
    {
      'title': 'Fashion',
      'image': 'assets/images/fashion.jpg',
    },
  ];
}
