import 'package:easy_class/models/data_model.dart';
import 'package:easy_class/views/books_screen/book_detail.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RecommendedList extends StatefulWidget {
  final DataModel? dataModel;

  const RecommendedList({super.key, required this.dataModel});

  @override
  State<RecommendedList> createState() => _RecommendedListState();
}

class _RecommendedListState extends State<RecommendedList> {
  @override
  Widget build(BuildContext context) {
    List<String> imgPath = [
      ...?widget.dataModel?.books
          .where(
            (element) => element.status == "tavsiya",
          )
          .toList()
          .map(
            (e) => e.bookImage,
          )
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
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookDetail(
                          dataModel: widget.dataModel?.books[index],
                        ),
                      ));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    height: 150,
                    width: 110,
                    image: AssetImage(
                      imgPath.isNotEmpty
                          ? imgPath[index]
                          : "assets/svg_icon/img.png",
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
