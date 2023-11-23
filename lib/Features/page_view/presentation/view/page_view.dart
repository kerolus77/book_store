
import 'dart:async';

import 'package:book_stor/Core/widget/button.dart';
import 'package:book_stor/Features/page_view/presentation/view/widged/indicator.dart';
import 'package:book_stor/constant.dart';
import 'package:flutter/material.dart';

import '../view_models/view_page_model.dart';

class PageViews extends StatefulWidget {
  const PageViews({super.key});

  @override
  State<PageViews> createState() => _PageViewsState();
}

class _PageViewsState extends State<PageViews> {
  int _currentIndex=0;
  final PageController _pageController=PageController(initialPage: 0);
  final List<ViewPageModel> pages=[
    ViewPageModel(title: 'Increase your knowledge', 
    body: 'A literary text is a piece of writing, such as a book or poem, that has the purpose of telling a story.', 
    image: 'assets/images/page1.png'),
     ViewPageModel(title: 'Find your favorite book', 
    body: 'Books and friends should be few but good, A living man there is nothing more wonderful than a book!',
    image: 'assets/images/page2.jpg'),
     ViewPageModel(title: 'Increase your knowledge', 
    body: 'A literary text is a piece of writing, such as a book or poem, that has the purpose of telling a story.', 
    image: 'assets/images/a-girl-flips-through-the-pages-of-the-book.jpg'),
  ];

  @override
 void initState() {
    Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_currentIndex < pages.length - 1) {
        _currentIndex = (_currentIndex + 1) % pages.length;
        _pageController.animateToPage(
          _currentIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      } else {
        _pageController.jumpToPage(0);
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  Stack(
          children: [
            PageView(
                controller: _pageController,
                onPageChanged: (index) => setState(() {
                  _currentIndex=index;
                }),
                children: pages.map((page) =>  Stack(
                  
                  children: [
                      Positioned.fill(
                      bottom: MediaQuery.of(context).size.height/3.5,
                    child: Image(
                      image: AssetImage(page.image),
                      fit: BoxFit.fill,
                    ),
                  ),

                  ],
            
                )).toList(),
                
                
              ),
                                  Positioned(
                      top: MediaQuery.of(context).size.height/1.7,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        decoration: const BoxDecoration(
                        color:primaryClr ,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                        boxShadow:[
                          BoxShadow(color: Color.fromARGB(255, 209, 210, 204),
                          offset: Offset(0, -2),
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
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Text(pages[_currentIndex].body,style: Themes().subheadingStyle.copyWith(color: grey),textAlign: TextAlign.center,),
                          ),
                          Button(label: 'Sign in', onTap: (){}, color: primaryClr),
                          Button(label: 'Sign up', onTap: (){}, color: secondaryColor)
                          ],
                        ),
                      ))
          ],
        )
        ,
       
      ),
    );
  }
}





