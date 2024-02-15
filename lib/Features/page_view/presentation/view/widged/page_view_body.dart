import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constant.dart';
import '../../../../../size_config.dart';
import '../../../../home/presentation/view/home.dart';
import '../../view_models/view_page_model.dart';
import 'bottom_container.dart';

class PageViewBody extends StatefulWidget {
  const PageViewBody({super.key});

  @override
  State<PageViewBody> createState() => _PageViewBodyState();
}

class _PageViewBodyState extends State<PageViewBody> {
  int _currentIndex = 0;

  final PageController _pageController = PageController(initialPage: 0);

  final List<ViewPageModel> pages = [
    ViewPageModel(
        title: 'Increase your knowledge',
        body:
            'A literary text is a piece of writing, such as a book or poem, that has the purpose of telling a story.',
        image: 'assets/images/page1.png'),
    ViewPageModel(
        title: 'Find your favorite book',
        body:
            'Books and friends should be few but good, A living man there is nothing more wonderful than a book!',
        image: 'assets/images/page2.jpg'),
    ViewPageModel(
        title: 'Increase your knowledge',
        body:
            'A literary text is a piece of writing, such as a book or poem, that has the purpose of telling a story.',
        image: 'assets/images/a-girl-flips-through-the-pages-of-the-book.jpg'),
  ];

  @override
  void initState() {
    jumpToNextPage();
    super.initState();
  }

    void jumpToNextPage() {
    Timer.periodic(const Duration(seconds: 4), (timer) {
     if(_pageController.hasClients){ if (_currentIndex < pages.length - 1) {
        _currentIndex = (_currentIndex + 1) % pages.length;
        // _pageController.animateToPage(
        //   _currentIndex,
        //   duration: const Duration(milliseconds: 500),
        //   curve: Curves.easeIn,
        // );
        _pageController.jumpToPage(_currentIndex);
      } else {
        _pageController.jumpToPage(0);
      }}
    });
  }

    @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizeConfig.orientation == Orientation.landscape
        ? Row(
            children: [
              Expanded(
                flex: 1,
                child: Builder(
                  builder: (context) {
                    return Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        pageView(),
                        BottomContainer(
                            currentIndex: _currentIndex,
                            pages: pages,
                            context: context),
                        skipButton(),
                      ],
                    );
                  },
                ),
              ),
            ],
          )
        : Stack(
            alignment: Alignment.topRight,
            children: [
              pageView(),
              BottomContainer(
                  currentIndex: _currentIndex, pages: pages, context: context),
              skipButton(),
            ],
          );
  }

  TextButton skipButton() {
    return TextButton(
        onPressed: () {
  //          @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   _pageController.dispose();
  // }
          Get.to(const Home(),
              transition: Transition.fadeIn, duration: transitionDuration);
        },
        child: Text(
          'Skip',
          style: font16W600.copyWith(color: Colors.black),
        ));
  }

  Builder pageView() {
    return Builder(builder: (context) {
      return PageView(
        controller: _pageController,
        onPageChanged: (index) => setState(() {
          _currentIndex = index;
        }),
        children: pages
            .map((page) => Stack(
                  children: [
                    Positioned.fill(
                      bottom: SizeConfig.orientation == Orientation.landscape
                          ? 0
                          : MediaQuery.of(context).size.height / 3.5,
                      right: SizeConfig.orientation == Orientation.landscape
                          ? MediaQuery.of(context).size.width / 2
                          : 0,
                      child: Image(
                        image: AssetImage(page.image),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ))
            .toList(),
      );
    });
  }


 
}
