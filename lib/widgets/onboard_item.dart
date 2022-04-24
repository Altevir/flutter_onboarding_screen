import 'package:flutter/material.dart';

class OnboardItem extends StatelessWidget {
  const OnboardItem({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final double totalWidth = MediaQuery.of(context).size.width;
    final double totalHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Image.asset(
          'images/$image',
          fit: BoxFit.cover,
          width: totalWidth,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 35,
                  wordSpacing: 0,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                description,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: totalHeight * 0.1,
              )
            ],
          ),
        )
      ],
    );
  }
}
