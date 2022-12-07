import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      scrollDirection: Axis.vertical,
      padEnds: false,
      children: const [
        SinglePage(
          color: Colors.red,
        ),
        SinglePage(
          color: Colors.green,
        ),
        SinglePage(
          color: Colors.yellow,
        ),
        SinglePage(color: Colors.amber),
        SinglePage(
          color: Colors.purple,
        ),
      ],
    );
  }
}
class SinglePage extends StatelessWidget {
  const SinglePage({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(color: color),
      Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 8,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 20,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Name of user",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const Text(
                      "This is the very long description of the videos which has many lines This is the very long description of the videos which has many lines This is the very long description of the videos which has many lines This is the very long description of the videos which has many lines",
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 2,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const Flexible(flex: 1, child: Buttons())
            ],
          ),
        ),
      )
    ]);
  }
}
class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
              color: Colors.white,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.message_outlined,
              color: Colors.white,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              color: Colors.white,
            )),
      ],
    );
  }
}