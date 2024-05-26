import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../main.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  List images = [
    "assets/images/banners/food_banner.jpeg",
    "assets/images/banners/food_banner2.jpg",
    "assets/images/banners/food_banner3.jpeg"
  ];
  List foods = [
    {"image": "assets/images/foods/biriyani.jpeg", "name": "Biryani"},
    {"image": "assets/images/foods/burger.jpeg", "name": "Burger"},
    {"image": "assets/images/foods/cake.jpeg", "name": "Cakes"},
    {"image": "assets/images/foods/chinese.jpeg", "name": "Chinese"},
    {"image": "assets/images/foods/dosa.jpeg", "name": "Dosa"},
    {"image": "assets/images/foods/fired.jpeg", "name": "Fired Chicken"},
    {"image": "assets/images/foods/noodles.jpeg", "name": "Noodles"},
    {"image": "assets/images/foods/pasta.jpeg", "name": "Pasta"},
    {"image": "assets/images/foods/pizza.jpeg", "name": "Pizza"}
  ];

  List offers = [
    {
      "name": "Burger",
      "image": "assets/images/foods/burger.jpeg",
      "offerPrice": "10",
      "price": "50",
    },
    {
      "name": "Pizza",
      "image": "assets/images/foods/pizza.jpeg",
      "offerPrice": "10",
      "price": "60",
    },
    {
      "name": "Pasta",
      "image": "assets/images/foods/pasta.jpeg",
      "offerPrice": "20",
      "price": "70",
    },
    {
      "name": "Noodles",
      "image": "assets/images/foods/noodles.jpeg",
      "offerPrice": "15",
      "price": "50",
    }
  ];
  List resto = [
    {
      "name":"McDonald's",
      "image":"assets/images/banners/mcdonalds.jpeg"
    },
    {
      "name":'Zomato',
      "image":"assets/images/banners/zomato.jpeg"
    }, {
      "name":'Swiggy',
      "image":"assets/images/banners/swiggy.jpeg"
    },
  ];

  int initialindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(w * 0.02),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on_sharp,
                      color: Colors.orange,
                    ),
                    SizedBox(
                      width: w * 0.03,
                    ),
                    SizedBox(
                      height: h * 0.05,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Janub Ad Dahariz",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Salalah,Oman",
                            style: TextStyle(
                                color: Colors.blue.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: w * 0.35,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: w * 0.02,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.notifications_none,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              SizedBox(
                width: w * 0.9,
                height: w * 0.15,
                child: TextFormField(
                  decoration: InputDecoration(
                      // filled: true,
                      // fillColor: Colors.grey.shade200,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                          ),
                          borderRadius: BorderRadius.circular(w * 0.03)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(w * 0.03)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(w * 0.03),
                      ),
                      hintText: "Dishes,Resturants,Burger,Pizza...",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.search),
                      prefixIconColor: Colors.orange,
                      suffixText: "|",
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.mic_rounded,
                          color: Colors.orange,
                        ),
                      )),
                ),
              ),
              SizedBox(
                height: w * 0.02,
              ),
              Container(
                height: w * 0.4,
                width: w,
                child: CarouselSlider.builder(
                  itemCount: images.length,
                  options: CarouselOptions(
                    autoPlayAnimationDuration: Duration(
                      milliseconds: 300,
                    ),
                    autoPlay: true,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      initialindex = index;
                      setState(() {});
                    },
                  ),
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return Container(
                      // height: w * 0.1,
                      // width: w * 1,
                      margin: EdgeInsets.only(right: w * 0.03, left: w * 0.03),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(w * 0.03),
                          color: Colors.black,
                          image: DecorationImage(
                            image: AssetImage(
                              images[index],
                            ),
                            fit: BoxFit.cover,
                          )),
                    );
                  },
                ),
              ),
              SizedBox(
                height: w * 0.03,
              ),
              Center(
                child: AnimatedSmoothIndicator(
                  activeIndex: initialindex,
                  count: images.length,
                  duration: Duration(milliseconds: 200),
                  effect: ScrollingDotsEffect(
                      dotWidth: w * 0.02,
                      dotHeight: w * 0.02,
                      activeDotColor: Colors.orange,
                      dotColor: Colors.black),
                ),
              ),
              SizedBox(
                height: w * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Categories",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: w * 0.03,
              ),
              Center(
                child: Container(
                  height: h * 0.3,
                  width: w * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(w * 0.03),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            offset: Offset(0, 0)),
                      ]),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: w * 0.02,
                      mainAxisSpacing: w * 0.02,
                      childAspectRatio: 1.3,
                    ),
                    itemCount: foods.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage(foods[index]["image"]),
                              radius: w * 0.07,
                            ),
                          ),
                          Text(foods[index]["name"])
                        ],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: w * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Offers",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: w * 0.02,
              ),
              Center(
                child: SizedBox(
                  height: h * 0.4,
                  width: w,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: w * 0.02,
                      mainAxisSpacing: w * 0.02,
                      childAspectRatio: 1.3,
                    ),
                    itemCount: offers.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: w * 0.2,
                          width: w * 0.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(w * 0.04),
                              image: DecorationImage(
                                  image: AssetImage(offers[index]["image"]),
                                  fit: BoxFit.cover)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: w * 0.15,
                                width: w,
                                decoration: BoxDecoration(
                                    color: Colors.black38,
                                    borderRadius:
                                        BorderRadius.circular(w * 0.03),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 5,
                                          offset: Offset(0, 0.7))
                                    ]),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: w,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: w * 0.02, top: w * 0.02),
                                        child: Text(
                                          offers[index]["name"],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: w * 0.04),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: w,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.only(left: w * 0.02),
                                        child: Text(
                                          "Starting From",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: w * 0.03),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: w,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.only(left: w * 0.02),
                                        child: RichText(
                                          text: TextSpan(
                                            text:
                                                "OMR ${offers[index]["offerPrice"]}  ",
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold),
                                            children: [
                                              TextSpan(
                                                  text:
                                                      "OMR ${offers[index]["price"]}",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      decoration: TextDecoration
                                                          .lineThrough)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Top rated restuarants near you",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: w,
                  height: w*0.45,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: w*0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(w*0.03),
                          color: Colors.red,
                            image: DecorationImage(
                                image: AssetImage(resto[index]["image"]),
                                fit: BoxFit.fill),
                        ),
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: w * 0.13,
                              width: w,
                              decoration: BoxDecoration(
                                  color: Colors.black38,
                                  borderRadius:
                                  BorderRadius.circular(w * 0.03),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 5,
                                        offset: Offset(0, 0.7))
                                  ]),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: w,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: w * 0.02, top: w * 0.02),
                                      child: Text(
                                        resto[index]["name"],
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: w * 0.04),
                                      ),
                                    ),
                                  ),

                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Padding(
                                     padding: EdgeInsets.only(
                                         left: w * 0.02,top: w*0.02 ),
                                     child: Text(
                                       "40-45 min",
                                       style: TextStyle(
                                           color: Colors.grey,
                                           fontWeight: FontWeight.bold,
                                           fontSize: w * 0.03),
                                     ),
                                   ),
                                   Padding(
                                     padding:  EdgeInsets.only(right: w*0.02),
                                     child: Container(
                                       height: w*0.04,
                                       width: w*0.09,
                                       color: Colors.green,
                                       child: Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Padding(
                                             padding:  EdgeInsets.all(w*0.002),
                                             child: Text("4.1",style: TextStyle(color: Colors.white,
                                             fontWeight: FontWeight.bold,
                                             fontSize: w*0.03),),
                                           ),
                                           Icon(Icons.star,size: w*0.035,color: Colors.white,)
                                         ],
                                       ),
                                     ),
                                   )
                                 ],
                               )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    width: w*0.03,
                  ),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
