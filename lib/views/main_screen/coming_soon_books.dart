import 'package:flutter/material.dart';

class ComingSoonBooks extends StatefulWidget {
  const ComingSoonBooks({super.key});

  @override
  State<ComingSoonBooks> createState() => _ComingSoonBooksState();
}

class _ComingSoonBooksState extends State<ComingSoonBooks> {
  List<String> images = [
    'assets/svg_icon/img.png',
    'assets/svg_icon/img.png',
    'assets/svg_icon/img.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: SizedBox(
        height: 150,
        child: ListView.builder(
          itemCount: images.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const PageScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: Image(
                  height: 140,
                  image: AssetImage(
                    images[index],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
