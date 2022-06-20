import 'package:flutter/material.dart';
import 'package:shopping_app/features/home/screens/home_screen.dart';
import 'package:shopping_app/features/home/services/home_serivces.dart';
import 'package:shopping_app/features/product_details/screens/porduct_details.dart';
import 'package:shopping_app/models/product.dart';

import '../../../common/widgets/loader.dart';
import '../../../constatns/global_var.dart';

class CategoryDealsScreen extends StatefulWidget {
  static const String routeName = '/category-screen';
  final String category;
  const CategoryDealsScreen({Key? key, required this.category})
      : super(key: key);

  @override
  State<CategoryDealsScreen> createState() => _CategoryDealsScreenState();
}

class _CategoryDealsScreenState extends State<CategoryDealsScreen> {
  List<Product>? productList;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchCategoryProducts();
  }

  fetchCategoryProducts() async {
    productList = await homeServices.fetchCategoryProducts(
      context: context,
      category: widget.category,
    );
    setState(() {});
  }

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
            title: Text(
              widget.category,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )),
      ),
      body: productList == null
          ? const Loader()
          : Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                ),
                SizedBox(
                    height: 190,
                    child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productList!.length,
                        padding: const EdgeInsets.only(
                          left: 25,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                childAspectRatio: 1.4,
                                mainAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          final product = productList![index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ProductDetailScreen.routeName,
                                  arguments: product);
                            },
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 130,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black12,
                                        width: 2,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Image.network(
                                        product.images[0],
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      product.name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      "\$${product.price.toString()}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        }))
              ],
            ),
    );
  }
}
