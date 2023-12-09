import 'package:flutter/material.dart';

import '../../../../../Core/widget/button.dart';
import '../../../../../constant.dart';
import '../../../../../size_config.dart';
import '../../view_models/view_page_model.dart';
import 'indicator.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({
    super.key,
    required int currentIndex,
    required this.pages,
    required this.context,
  }) : _currentIndex = currentIndex;

  final int _currentIndex;
  final List<ViewPageModel> pages;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
                  top:SizeConfig.orientation==Orientation.landscape?0: MediaQuery.of(context).size.height/1.8,
                  bottom: 0,
                  left:SizeConfig.orientation==Orientation.landscape?MediaQuery.of(context).size.width/2.3:0,
                  child: Container(
                    decoration:  BoxDecoration(
                    color:primaryClr ,
                    borderRadius: SizeConfig.orientation==Orientation.landscape?const BorderRadius.horizontal(left: Radius.circular(50)):const BorderRadius.vertical(top: Radius.circular(50)),
                    boxShadow:[
                        BoxShadow(color: const Color.fromARGB(255, 209, 210, 204),
                      offset: SizeConfig.orientation==Orientation.landscape?const Offset(-2, 0):
                      const Offset(0, -2),
                      )
                    ]
                    ),
                    child: Column(
                     
                      
                      children: [
                        
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: indicator(_currentIndex, 3),
                          ),
                        ),
                      Text(pages[_currentIndex].title,style: Themes().headingStyle,),
                      const SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(pages[_currentIndex].body,style: Themes().subheadingStyle.copyWith(color: grey),textAlign: TextAlign.center,),
                      ),
                      const SizedBox(height: 20,),
                      Button(label: 'Sign in', onTap: (){}, color: primaryClr),
                      const SizedBox(height: 7,),
                      Button(label: 'Sign up', onTap: (){}, color: secondaryColor)
                      ],
                    ),
                  ));
  }
}