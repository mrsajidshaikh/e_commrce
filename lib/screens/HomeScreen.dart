import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/routes.dart';
import '../widgets/vegetable_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 36,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Image.asset(
                    "assets/images/User.png",
                    scale: 3.6,
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Good morning",
                            style: TextStyle(
                                color: Color(0xff979899),
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Sajid Shaikh",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                          color: Color(0xffF3F5F7),
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.location,
                            color: Color(0xff23AA49),
                            size: 16,
                          ),
                          Text(
                            "My Flat",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                          Icon(
                            CupertinoIcons.chevron_down,
                            color: Color(0xff23AA49),
                            size: 12,
                          )
                        ],
                      ),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffF3F5F7),
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search Category",
                      hintStyle: TextStyle(
                          fontSize: 14,
                          color: Color(0xff979899),
                          fontWeight: FontWeight.w500),
                      contentPadding: EdgeInsets.all(16),
                      prefixIcon: Icon(
                        CupertinoIcons.search,
                        color: Color(0xff23AA49),
                      ),
                    )),
              )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              "assets/images/banner.png",
              scale: 4.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _seeAllView(context, "Categories"),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    _categoriesView("assets/images/fruits.png", "Fruits"),
                    _categoriesView("assets/images/vegetables.png", "Vegetables"),
                    _categoriesView("assets/images/diary.png", "Diary"),
                    _categoriesView("assets/images/bakery_icon.png", "Bakery")
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                _seeAllView(context, "Best Selling"),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: VegetableCardWidget(
                        imagePath: "assets/images/ginger.png",
                        name: "Ginger",
                        price: "1kg, \$ 4",
                        onTapCallback: () {
                          Navigator.pushNamed(
                              context, MyRoutes.vegetableDetailRoute);
                        },
                      ),
                    ),
                    Expanded(
                      child: VegetableCardWidget(
                          imagePath: "assets/images/pastry.png",
                          name: "Pastry",
                          price: "3 pcs, \$ 6",
                        onTapCallback: () {
                          Navigator.pushNamed(
                              context, MyRoutes.MuffinDetailsRoute);
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: VegetableCardWidget(
                        imagePath: "assets/images/milk.png",
                        name: "Milk",
                        price: "1 litre, \$ 5",
                        onTapCallback: () {
                          Navigator.pushNamed(
                              context, MyRoutes.MilkDetailsRoute);
                        },
                      ),
                    ),
                    Expanded(
                      child: VegetableCardWidget(
                          imagePath: "assets/images/carrots.png",
                          name: "Organic Carrot",
                          price: "1kg, \$ 4",
                        onTapCallback: () {
                          Navigator.pushNamed(
                              context, MyRoutes.CarrotDetailRoute);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget _seeAllView(BuildContext context, String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, MyRoutes.vegetablesRoute);
          },
          child: Text(
            "See All",
            style: TextStyle(
                fontSize: 14,
                color: Color(0xff23AA49),
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  Widget _categoriesView(String imagePath, String catName) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Color(0xffF3F5F7),
            radius: 32,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                imagePath,
                scale: 4.0,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            catName,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
          )
        ],
      ),
    );
  }
}
