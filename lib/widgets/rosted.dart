import 'package:flutter/material.dart';

import '../constants/app_large_text.dart';
import '../constants/app_text.dart';


class  ReelCard extends StatelessWidget {
  const ReelCard ({required this.outletName, required this.dishName});

  final String outletName;
  final String dishName;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24)
        ),
        elevation: 4,
        color: Colors.white,
        margin:  const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset('assets/images/rosted.png',
                  height: 250,
                  width: 170,
                  fit: BoxFit.cover),
            ),
            Spacer(flex: 1,),
            AppLargeText(text: dishName,size: 11,),
            AppText(text: outletName, size: 10,),
            Spacer(flex: 1,)
          ],
        ),
      ),
    );
  }
}
