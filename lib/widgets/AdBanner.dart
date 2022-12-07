import 'package:flutter/material.dart';

import '../constants/app_text.dart';

class AdBanner extends StatelessWidget {
  const AdBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 180,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black)
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(17),
          child: Column(
            children: [
              Image.asset('assets/images/Orangefont.png',
              height: 25,),
              const SizedBox(height: 20,),
              AppText(text: 'Invite friends and rate us to get Treat coins.'),
            ],
          ),
        ),
      )
    );
  }
}
