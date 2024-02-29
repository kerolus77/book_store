import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import '../../../../../size_config.dart';

class SearchBarHome extends StatelessWidget {
  const SearchBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.only(left: 14),
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight * .066,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: Colors.grey),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 0, right: 5),
                    child: Icon(
                      Icons.search,
                      color: clrIconButton,
                      size: 30,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: TextFormField(
                        // controller: widget.controller,
        
                        autofocus: false,
        
                        style: font19w500,
                        cursorColor: Colors.grey[700],
                        cursorHeight: 20,
        
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: font16W600.copyWith(
                              color: Colors.grey[500]),
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(22),
                            borderSide: const BorderSide(
                              color: primaryClr,
                              width: 0,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(22),
                            borderSide: const BorderSide(
                              color: primaryClr,
                              width: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
