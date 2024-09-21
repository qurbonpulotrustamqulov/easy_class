import 'dart:convert';

import 'package:easy_class/models/data_model.dart';
import 'package:easy_class/views/books_screen/books_screen.dart';
import 'package:easy_class/views/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/services.dart' show rootBundle; // Faylni o'qish uchun

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {

  DataModel? datas;

  Future<void> loadJsonData() async {
    String jsonString = await rootBundle.loadString('assets/json/data.json');
    final data = jsonDecode(jsonString);
    datas = DataModel.fromJson(data);
  }
  int selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  void initState() {
    loadJsonData();
    setState(() {

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: selectedIndex, children: [
         MainScreen(dataModel: datas,),
        BooksScreen(dataModel: datas),

      ]),
      bottomNavigationBar: SizedBox(
        height: 60 + MediaQuery.of(context).padding.bottom,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: _onItemTapped,
          elevation: 5,
          backgroundColor:Colors.white,
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: 14,
          selectedLabelStyle: const TextStyle(color: Colors.blueAccent),
          unselectedLabelStyle:const TextStyle(color: Colors.grey),
          selectedItemColor: const Color(0xff00bac7),
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/svg_icon/home.svg",
                colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              ),
              activeIcon: SvgPicture.asset(
                "assets/svg_icon/home.svg",
                colorFilter: const ColorFilter.mode(Color(0xff00bac7), BlendMode.srcIn),
              ),
              label: 'Bosh sahifa',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/svg_icon/open-book.svg",
                colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              ),
              activeIcon: SvgPicture.asset(
                "assets/svg_icon/open-book.svg",
                colorFilter: const ColorFilter.mode(Color(0xff00bac7), BlendMode.srcIn),
              ),
              label: "Kitoblar",
            ),
          ],
        ),
      ),
    );
  }
}
