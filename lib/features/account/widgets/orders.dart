import 'package:flutter/material.dart';
import 'package:shopping_app/constatns/global_var.dart';
import 'package:shopping_app/features/account/widgets/single_product.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List list = [
    'https://www.tradeinn.com/f/13787/137870852/apple-macbook-pro-13-m1-8gb-512gb-ssd-laptop.jpg',
    'https://www.tradeinn.com/f/13787/137870852/apple-macbook-pro-13-m1-8gb-512gb-ssd-laptop.jpg',
    'https://www.tradeinn.com/f/13787/137870852/apple-macbook-pro-13-m1-8gb-512gb-ssd-laptop.jpg',
    'https://www.tradeinn.com/f/13787/137870852/apple-macbook-pro-13-m1-8gb-512gb-ssd-laptop.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: const Text(
                "Your Orders",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                "See all",
                style: TextStyle(
                  color: GlobalVariables.selectedNavBarColor,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
        // display products
        Container(
          height: 170,
          padding: const EdgeInsets.only(left: 10, top: 20, right: 0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (((context, index) {
              return SingleProduct(image: list[index]);
            })),
          ),
        )
      ],
    );
  }
}
