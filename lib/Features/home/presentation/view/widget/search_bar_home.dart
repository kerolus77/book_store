
import 'package:flutter/material.dart';

import '../../../../../constant.dart';

class SearchBarHome extends StatelessWidget {
  const SearchBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SearchBar(
        backgroundColor: const MaterialStatePropertyAll(primaryClr),
        elevation: const MaterialStatePropertyAll(0),
       leading: const Icon(Icons.search,color: Color.fromARGB(255, 128, 127, 127),size: 35,),
       hintText: 'Search',
       hintStyle: MaterialStatePropertyAll(Themes().subheadingStyle.copyWith(color: Colors.grey)),
     side: const MaterialStatePropertyAll(BorderSide(color: Colors.grey)),
     shape:MaterialStatePropertyAll(
       RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18), // Adjust the radius as needed
          side: const BorderSide(color: Colors.grey),
           // Optional: Add a border color
        )
     ),
     padding: const MaterialStatePropertyAll(EdgeInsets.all(1)),
     
      ),
    );
  }
}