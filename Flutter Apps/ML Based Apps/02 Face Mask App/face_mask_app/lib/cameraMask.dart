import 'package:avatar_view/avatar_view.dart';
import 'package:camera_deep_ar/camera_deep_ar.dart';
import 'package:flutter/material.dart';
import 'dart:io';


class CameraMask extends StatefulWidget {
  @override
  _CameraMaskState createState() => _CameraMaskState();
}

class _CameraMaskState extends State<CameraMask> {
  CameraDeepArController cameraDeepArController;
  String platformVersion = "Unknown";
  int currentPage=0;
  final vp = PageController(viewportFraction: .24);
  Effects currentEffects = Effects.none;
  Filters currentFilters = Filters.none;
  Masks currentMask = Masks.none;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            CameraDeepAr(
              onCameraReady: (isReady){
                platformVersion = "Camera Status $isReady";
                print(platformVersion);
                setState(() {

                });
              },
              // androidLicenceKey: "a386f8ca3b9b4d4e32a1338046feaf9874f38b4e83864727d0da9ebe4e67eaadd0b80fdb243639e3",
              cameraDeepArCallback: (c) async
              {
                cameraDeepArController =c;
                setState(() {

                });
              },
            ),

            // Face Masks filters Icons Button
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(8, (page){
                          bool active = currentPage == page;
                          return Platform.isIOS ? GestureDetector(
                            //ios app view
                            onTap: (){
                              currentPage = page;
                              cameraDeepArController.changeMask(page);
                              setState(() {

                              });
                            },
                            child: AvatarView(
                                radius: active ? 65 : 30,
                                borderColor: Colors.yellow,
                              borderWidth: 2,
                              isOnlyText: false,
                              avatarType: AvatarType.CIRCLE,
                              backgroundColor: Colors.red,
                              imagePath: "assets/ios/${page.toString()}.jpg",
                              placeHolder: Icon(Icons.person,size: 50,),
                              errorWidget: Container(child: Icon(Icons.error,size: 50,),),
                            ) ,
                          ) : GestureDetector(
                            //android app view
                            onTap: (){
                              currentPage = page;
                              cameraDeepArController.changeMask(page);
                              setState(() {

                              });
                            },
                            child: AvatarView(
                              radius: active ? 45 : 25,
                              borderColor: Colors.yellow,
                              borderWidth: 2,
                              isOnlyText: false,
                              avatarType: AvatarType.CIRCLE,
                              backgroundColor: Colors.red,
                              imagePath: "assets/android/${page.toString()}.jpg",
                              placeHolder: Icon(Icons.person,size: 50,),
                              errorWidget: Container(child: Icon(Icons.error,size: 50,),),
                            ) ,

                          );
                        }),
                      ),
                    )
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
