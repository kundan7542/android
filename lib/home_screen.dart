import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imgList = [
    'assets/banner1.png', // Replace with your image URLs or asset paths
    'assets/banner2.png',
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xfff7f7f7),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white
                      ),
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Image.asset('assets/menu.png', height: MediaQuery.of(context).size.height*0.03,),
                        ),
                    ),

                    Text('Home', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),

                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Image.asset('assets/cart.png', height: MediaQuery.of(context).size.height*0.03,),
                            ),
                          ),

                          SizedBox(width: 10,),

                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Image.asset('assets/profile.png', height: MediaQuery.of(context).size.height*0.03,),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),



              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                Container(
                 child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 200.0,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 1.0,  // Show only one image in the frame
                    ),
                    items: imgList.map((item) => Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        child: Image.asset(item, fit: BoxFit.cover),
                      ),
                    )).toList(),
                  ),
                               ),
               ),


            ],
          ),
        ),

    );
  }
}
