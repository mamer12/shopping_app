import 'package:flutter/material.dart';
import 'package:shopping_app/features/account/widgets/account_button.dart';

import '../services/account_services.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(text: "your orders", onTap: () {}),
            AccountButton(text: "Turn Seller", onTap: () {})
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            AccountButton(
              text: "Log Out",
              onTap: () => AccountServices().logOut(context),
            ),
            AccountButton(text: "your Wishlist", onTap: () {})
          ],
        )
      ],
    );
  }
}
