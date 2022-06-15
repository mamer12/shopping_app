import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/common/widgets/custom_textField.dart';
import 'package:shopping_app/constatns/utils.dart';

import '../../../common/widgets/custom_button.dart';
import '../../../constatns/global_var.dart';

class AddProductScreen extends StatefulWidget {
  static const String routName = '/add-products';
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  String category = 'Mobiles';
  List<File> images = [];
  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }

  List<String> productCategories = [
    'Mobiles',
    'Essentials',
    'Appliances',
    'Books',
    'Fashion'
  ];

  void selectImages() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
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
            title: const Text(
              "Add Product",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )),
      body: SingleChildScrollView(
          child: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              images.isNotEmpty
                  ? CarouselSlider(
                      items: images.map(
                        (i) {
                          return Builder(
                            builder: (BuildContext context) => Image.file(
                              i,
                              fit: BoxFit.cover,
                              height: 200,
                            ),
                          );
                        },
                      ).toList(),
                      options: CarouselOptions(
                        viewportFraction: 1,
                        height: 200,
                      ),
                    )
                  : GestureDetector(
                      onTap: selectImages,
                      child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          dashPattern: const [10, 4],
                          strokeCap: StrokeCap.round,
                          child: Container(
                            width: double.maxFinite,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.folder_open),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'Select Product Images',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey.shade900),
                                  )
                                ]),
                          )),
                    ),
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                  controller: productNameController, hintText: "Product Name"),
              const SizedBox(height: 10),
              CustomTextField(
                controller: descriptionController,
                hintText: "Product Name",
                maxLines: 7,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                  controller: priceController, hintText: "Product Name"),
              const SizedBox(height: 10),
              CustomTextField(
                  controller: quantityController, hintText: "Product Name"),
              SizedBox(
                width: double.infinity,
                child: DropdownButton(
                  value: category,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: productCategories.map((String item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? newVal) {
                    setState(() {
                      category = newVal!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              CustomButton(
                text: 'Sell',
                onTap: () {},
              ),
            ],
          ),
        ),
      )),
    );
  }
}
