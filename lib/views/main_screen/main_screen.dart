
import 'package:easy_class/models/data_model.dart';
import 'package:easy_class/views/main_screen/recommended_list.dart';
import 'package:flutter/material.dart';
import '../quick_test.dart';
import 'coming_soon_books.dart';

class MainScreen extends StatefulWidget {
  final DataModel ? dataModel;
  const MainScreen({super.key, required this.dataModel});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static ValueNotifier onChange = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    onChange.addListener(ChangeNotifier.new);
    setState(() {
      onChange.addListener(ChangeNotifier.new);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: const AppBarWidget(
                  title: 'Bosh sahifa',
                  txtColor: Colors.white,
                  rightWidget: SizedBox(),
                  backgroundColor: Color(0xff00bac7),
                ),
              ),
            ];
          },
          body: Builder(
            builder: (BuildContext context) {
              return CustomScrollView(
                slivers: <Widget>[
                  SliverPadding(
                    padding: const EdgeInsets.only(top: 90),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          const QuickTestWidget(),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Text(
                              'Tavsiya etamiz',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          RecommendedList(
                            dataModel: widget.dataModel,
                          ),
                          const SizedBox(height: 20),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            child: Text(
                              'Tez kunda',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                           ComingSoonBooks(dataModel: widget.dataModel,),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget(
      {super.key,
      required this.title,
      this.rightWidget,
      required this.backgroundColor,
      required this.txtColor});

  final String title;
  final Widget? rightWidget;
  final Color backgroundColor;
  final Color txtColor;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: backgroundColor,
      elevation: 20,
      shadowColor: Colors.grey.withOpacity(0.6),
      expandedHeight: 90.0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        expandedTitleScale: 1.5,
        title: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: txtColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textScaler: const TextScaler.linear(1),
                textAlign: TextAlign.start,
              ),
            ),
            rightWidget ?? Container()
          ],
        ),
      ),
    );
  }
}
