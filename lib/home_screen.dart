import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LinearGradient gradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0Xffe0deeb),
      Color(0xFF9690c0),
    ],
  );

  List<String> list = [
    'All',
    'Living Room',
    'Bedroom',
    'Kitchen',
    'Bathroom',
    'Office',
    'Hotel'
  ];

  var light = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: gradient,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Manage Home', style: TextStyle(fontSize: 12)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('Hey,'),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Gautam',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/profile.webp',
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/6563276.webp',
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('motion'),
                                  Text(
                                    '75%',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Container(
                            width: 1,
                            height: MediaQuery.of(context).size.height * 0.05,
                            color:
                                Colors.grey, // You can customize the color here
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/energy.webp',
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('energy'),
                                  Text(
                                    '65%',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Container(
                            width: 1,
                            height: MediaQuery.of(context).size.height * 0.05,
                            color:
                                Colors.grey, // You can customize the color here
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/temp.webp',
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('temp'),
                                  Text(
                                    '24°C',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*0.02),



              Container(
                height: MediaQuery.of(context).size.height*0.06,
                child:   ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  itemBuilder: (context, count){
                    return  Container(
                      margin: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: count == 0 ? Colors.black : Colors.white,
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: MediaQuery.of(context).size.width*0.2, // Minimum width of 15
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(' ' + list[count] + ' ', style: TextStyle(color: count == 0 ? Colors.white : Colors.black,),),
                              ],
                            ),
                          ),
                       ),
                    );
                  },
                ),
              ),

SizedBox(height: 25,),


                  GridView.builder(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(
                        parent:
                        AlwaysScrollableScrollPhysics()),
                    shrinkWrap: true,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.3,
                    ),
                    itemCount: 4,
                    itemBuilder:
                        (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFf1f0f6),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset('assets/9799404.png',
                                      height: MediaQuery.of(context).size.height*0.04,
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width*0.27),
                                    Icon(Icons.wifi, size: 15,)
                                  ],
                                ),


                                Text('Smart Lightning', style: TextStyle(fontWeight: FontWeight.bold),),
                                Text('Bedroom'),

                                const Divider(
                                  height: 20,
                                  thickness: 1,
                                  indent: 20,
                                  endIndent: 0,
                                  color: Colors.black,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Off'),
                                    InkWell(
                                      onTap: (){
                                        setState(() {
                                          light = !light;
                                        });


                                        print(light);
                                      },
                                      child: Image.asset(light!=true?'assets/121124.png':'assets/786385.png',height: MediaQuery.of(context).size.height*0.03),
                                    )


                                  ],
                                )
                              ],
                            )
                        ),
                      );
                    },
                  ),



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
