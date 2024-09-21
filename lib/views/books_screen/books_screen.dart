import 'package:easy_class/models/data_model.dart';
import 'package:easy_class/views/books_screen/book_detail.dart';
import 'package:easy_class/views/books_screen/widgets/book_items.dart';
import 'package:flutter/material.dart';

class BooksScreen extends StatefulWidget {
  final DataModel? dataModel;
  const BooksScreen({super.key, required this.dataModel});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  final bool _isShowed = false;
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
    List<BookModel> books = [
      ...?widget.dataModel?.books.toList().where((element) => element.status!="tez",)
    ];
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.red,
        toolbarHeight: _isShowed == false ? 48 : 130,
        title: const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Kitoblar',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
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
          itemCount: books.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return BookItem(
              bookId: books[index].bookId,
              title: books[index].bookName,
              subtitle: books[index].classes.first.mundarija.first.desc??"",
              image: books[index].bookImage,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BookDetail(dataModel: books[index],),));
              },
            );
          },
        ),
      ),
    );
  }
}

