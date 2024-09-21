import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RecommendedList extends StatefulWidget {
  const RecommendedList({super.key});

  @override
  State<RecommendedList> createState() => _RecommendedListState();
}

class _RecommendedListState extends State<RecommendedList> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: SizedBox(
        height: 150,
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const PageScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
              ),
              child: GestureDetector(
                onTap: () {

                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    height: 150,
                    width: 120,
                    image: AssetImage("assets/svg_icon/adabiyot.png",
                    ),
                    fit: BoxFit.fill,
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
