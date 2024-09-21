import 'package:easy_class/views/books_screen/widgets/book_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  bool _isShowed = false;
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    setState(() {});
  }


  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.red,
        toolbarHeight: _isShowed == false ? 48 : 130,
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Kitoblar',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                      ),
                      textScaler: TextScaler.linear(1),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        backgroundColor:Colors.white,
        elevation: 0,
      ),
      // appBar: MyCustomAppbar(
      //   child: ,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 8,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return BookItem(
              bookId: 1,
              title: "Kitob nomi",
              subtitle: "Kitob havfasi",
            );
          },
        ),
      ),
    );
  }
}

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
                const SizedBox(height: 20,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
