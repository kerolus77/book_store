
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../Core/utils/assets.dart';
import '../../../../../constant.dart';
import '../../../../page_view/presentation/view/page_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {

  late AnimationController animationController;
  late Animation<double> fadeAnimation;
  @override
  void initState() {
    super.initState();
    initFadeAnimation();
    transitionPage();
    
  }

 


  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return   Stack(
      alignment: Alignment.center,
      children: [
        const Positioned.fill(
          child: Image(
            image: AssetImage(AssetsData.splashBackGround),
            fit: BoxFit.fill,
          ),
        ),
        Container(
          color: const Color.fromARGB(156, 97, 124, 145),
        ),
        FadeTransition(
          opacity:fadeAnimation ,
          child: const FlutterLogo(size: 100,))

      ]
    );
    
  }
    void initFadeAnimation() {
     animationController=AnimationController(vsync: this,duration: const Duration(seconds: 2))..forward();
    fadeAnimation=CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    
  }

   void transitionPage() {
     Future.delayed(const Duration(seconds: 3),() {
      Get.to(()=> const PageViews(),transition: Transition.fade,duration: transitionDuration);
    },);
  }
}