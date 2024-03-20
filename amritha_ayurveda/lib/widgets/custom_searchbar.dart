import 'package:amritha_ayurveda/core/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.deviceWidth,
  });

  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: deviceWidth - 130  ,
      height: 40,
      child: CupertinoSearchTextField(
        placeholder: "Search for treatments",
        placeholderStyle: t12BlackLight400,
        prefixIcon:const  Icon(Icons.search_sharp,size: 20,color: Colors.black26 ,),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black38),
          borderRadius: BorderRadius.circular(8),
          
    
        ),
      ),
    );
  }
}