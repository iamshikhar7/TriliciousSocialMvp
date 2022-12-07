import 'package:flutter/material.dart';

//Image card consists of no caption


class ImageCard extends StatelessWidget {
  const ImageCard ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24)
      ),
      elevation: 4,
      color: Colors.white,
      margin:  const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset('assets/images/rosted.png',
                    height: 290,
                    width: 170,
                    fit: BoxFit.cover),
              )
          ),
        ],
      ),
    );
  }
}
