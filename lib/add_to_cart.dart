import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List<String> productList = ['Iphone', 'Samsung', 'Redmi', 'Vivo'];

  List<String> cartList = [];

  SharedPreferences? prefs;

  @override
  void initState() {
    super.initState();
    getSharePref();

  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        home: SafeArea(
          child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    ListView.builder(
                      itemCount: productList.length,
                      itemBuilder: (context, index) {
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                          Container(
                              color: Colors.yellow,
                              height: 20,
                              child: Text(productList[index])),
                          GestureDetector(onTap: (){
                            setState(() {
                              if(cartList.contains(productList[index])){
                                cartList.remove(productList[index]);
                                prefs!.setStringList('cartlist', cartList);
                              }else{
                                cartList.add(productList[index]);
                                prefs!.setStringList('cartlist', cartList);
                              }
                            });
                          },child: Icon(cartList.contains(productList[index]) ? Icons.shopping_bag : Icons.shopping_bag_outlined))
                        ]);
                      },
                      shrinkWrap: true,
                    ),
                    SizedBox(height: 15,),
                    Divider(height: 1,),
                    SizedBox(height: 15,),
                    Text('CART'),
                    SizedBox(height: 15),
                    Divider(height: 1,),
                    SizedBox(height: 15),
                    ListView.builder(
                      itemCount: cartList.length,
                      itemBuilder: (context, index) {
                        return Row(children: [
                          Container(
                              color: Colors.yellow,
                              height: 20,
                              child: Text(cartList[index]))
                        ]);
                      },
                      shrinkWrap: true,
                    ),
                  ],
                ),
              )),
        ));
  }

  void getSharePref() async{
    prefs = await SharedPreferences.getInstance();

    setState(() {
      if(prefs!.containsKey('cartlist')){
        cartList = prefs!.getStringList('cartlist')!;
        print('cartlist length ${cartList.length}');
      }else{
        print('cartlist key not found ');
      }
    });


  }
}