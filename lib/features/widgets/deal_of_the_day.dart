import 'package:flutter/material.dart';

class DealOfTheDay extends StatelessWidget {
  const DealOfTheDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: const Text(
            "Deal of the day",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Image.network(
          "https://www.tradeinn.com/f/13787/137870852/apple-macbook-pro-13-m1-8gb-512gb-ssd-laptop.jpg",
          height: 235,
          fit: BoxFit.fitHeight,
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(
            left: 15,
          ),
          child: const Text(
            "\$999",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
          child: const Text(
            "Apple MacBookPro",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                "https://www.tradeinn.com/f/13787/137870852/apple-macbook-pro-13-m1-8gb-512gb-ssd-laptop.jpg",
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                "https://www.tradeinn.com/f/13787/137870852/apple-macbook-pro-13-m1-8gb-512gb-ssd-laptop.jpg",
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                "https://www.tradeinn.com/f/13787/137870852/apple-macbook-pro-13-m1-8gb-512gb-ssd-laptop.jpg",
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                "https://www.tradeinn.com/f/13787/137870852/apple-macbook-pro-13-m1-8gb-512gb-ssd-laptop.jpg",
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                "https://www.tradeinn.com/f/13787/137870852/apple-macbook-pro-13-m1-8gb-512gb-ssd-laptop.jpg",
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                "https://www.tradeinn.com/f/13787/137870852/apple-macbook-pro-13-m1-8gb-512gb-ssd-laptop.jpg",
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
          alignment: Alignment.topLeft,
          child: const Text(
            "See All Deals",
            style: TextStyle(
                color: Colors.purple,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
