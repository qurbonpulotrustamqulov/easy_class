import 'package:easy_class/models/data_model.dart';
import 'package:flutter/material.dart';

class ComingSoonBooks extends StatefulWidget {
  final DataModel? dataModel;
  const ComingSoonBooks({super.key, required this.dataModel});

  @override
  State<ComingSoonBooks> createState() => _ComingSoonBooksState();
}

class _ComingSoonBooksState extends State<ComingSoonBooks> {


  @override
  Widget build(BuildContext context) {
    List<String> imgPath = [
      ...?widget.dataModel?.books.where((element) => element.status=="tez",).toList().map((e) => e.bookImage,)
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: SizedBox(
        height: 150,
        child: ListView.builder(
          itemCount: imgPath.length,
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
                    imgPath[index],
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
