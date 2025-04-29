import 'package:flutter/material.dart';
import '/core/lists/product_list.dart';
import '/core/theme/colors.dart';
import '/core/theme/strings.dart';
import '/models/product_model.dart';
import '/screen/rate_screen.dart';

import '../core/components/categories_widget.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late double width;
  late double height;

  int index = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.03, vertical: height * 0.014),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      AppStrings.list,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: width * 0.06,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search, color: Theme.of(context).colorScheme.onSecondary),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              sliver: SliverToBoxAdapter(
                child: SizedBox(
                  height: height * 0.057,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CategoriesWidget(
                        text: AppStrings.fresh,
                        width: 30,
                        index: 0,
                        selectedIndex: index,
                        onTapped: () {
                          setState(() {
                            index = 0;
                          });
                        },
                      ),
                      SizedBox(width: width * 0.08),
                      CategoriesWidget(
                          text: AppStrings.furniture,
                          width: 64,
                          index: 1,
                          selectedIndex: index,
                          onTapped: () {
                            setState(() {
                              index = 1;
                            });
                          }),
                      SizedBox(width: width * 0.08),
                      CategoriesWidget(
                          text: AppStrings.electronic,
                          width: 68,
                          index: 2,
                          selectedIndex: index,
                          onTapped: () {
                            setState(() {
                              index = 2;
                            });
                          }),
                      SizedBox(width: width * 0.08),
                      CategoriesWidget(
                          text: AppStrings.fashion,
                          width: 56,
                          index: 3,
                          selectedIndex: index,
                          onTapped: () {
                            setState(() {
                              index = 3;
                            });
                          }),
                      SizedBox(width: width * 0.08),
                      CategoriesWidget(
                          text: AppStrings.clothing,
                          width: 56,
                          index: 4,
                          selectedIndex: index,
                          onTapped: () {
                            setState(() {
                              index = 4;
                            });
                          }),
                      SizedBox(width: width * 0.08),
                      CategoriesWidget(
                          text: AppStrings.sports,
                          width: 46,
                          index: 5,
                          selectedIndex: index,
                          onTapped: () {
                            setState(() {
                              index = 5;
                            });
                          })
                    ],
                  ),
                ),
              ),
            ),
            // SliverToBoxAdapter(
            //   child: Icon(),
            // )
            SliverPadding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.03, vertical: height * 0.05),
              sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                      childCount: Products.productsList.length,
                      (context, index) {
                    Product item = Products.productsList[index];
                    return Container(
                      color: Theme.of(context).colorScheme.onPrimary,
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RateScreen(
                                      name: item.name,
                                      image: item.image,
                                      price: item.price,
                                      category: item.category,
                                      color: item.color,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                  width: double.maxFinite,
                                  height: height * 0.36,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: AssetImage(
                                        item.image,
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                    color: item.color,
                                  ),
                                ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
                              child: Row(
                                children: [
                                  Text(
                                    "\$${item.price}",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  Spacer(),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.more_horiz,
                                        color: Theme.of(context).colorScheme.onSecondary,
                                      ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),

                    );
                  }),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: (width / 2) / (height * 0.48),
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    crossAxisCount: 2,
                  )),
            )
          ],
        ));
  }
}
