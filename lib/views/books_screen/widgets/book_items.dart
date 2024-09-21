import 'package:flutter/material.dart';

class BookItem extends StatefulWidget {
   const BookItem(
      {super.key,
      required this.bookId,
      required this.subtitle,
      required this.title});
  final String subtitle, title;
  final int bookId;

  @override
  State<BookItem> createState() => _BookItemState();
}

class _BookItemState extends State<BookItem> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Row(
        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: Image.asset(
              'assets/svg_icon/adbiyot.png',
              height: 160,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.subtitle,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,

                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
