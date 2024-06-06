import 'package:shopping/login_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'modal/spalshscreen_view_modal.dart';
class SpalshScreen extends StatefulWidget {

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {

  @override
  Widget build(BuildContext context) {

    return ViewModelBuilder<SpalshscreenViewModal>.reactive(

      onViewModelReady: (viewmodal){
        viewmodal.spalshscreen();
      },

      viewModelBuilder: ()=>SpalshscreenViewModal(),
      builder: (context,viewModel, Widget? child){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: SafeArea(
            child: Scaffold(
              backgroundColor: Color(0xffF3F8FF),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                    Text('CAICE', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.blue),),
                    Text('Carce eCommece mobile app.'),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset('assets/intro-bg.webp'),
                    ),

                    Text('Carce is a one-stop online shop for all of your needs. Buy the latest products from popular brands!'),

                    SizedBox(height: MediaQuery.of(context).size.height*0.1,),

                    Stack(
                      alignment: Alignment.center,
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            // Add your onPressed code here!
                          },
                          backgroundColor: Colors.redAccent,
                          child: InkWell(
                            onTap: (){
                              Get.to(LoginScreenView());
                            },
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );

  }
}
