import 'package:easy_class/views/books_screen/books_screen.dart';
import 'package:easy_class/views/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  static final List<Widget> _pages = <Widget>[
    const MainScreen(),
    const BooksScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: selectedIndex, children: _pages),
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
