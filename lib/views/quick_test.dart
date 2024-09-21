import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class QuickTestWidget extends StatefulWidget {
  const QuickTestWidget({
    super.key,
  });

  @override
  State<QuickTestWidget> createState() => _QuickTestWidgetState();
}

class _QuickTestWidgetState extends State<QuickTestWidget> {
  PageController? pageController;
  static ValueNotifier onChange = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    onChange.addListener(ChangeNotifier.new);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          padding: const EdgeInsets.all(
            15,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: isDark ? null :[
               BoxShadow(
                offset: Offset(3, 2),
                blurRadius: 5,
                color: Colors.grey.withOpacity(0.4),
              )
            ],
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Easy Class',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Vaqtingizdan unumli foydalaning!\nAi yordamida test va quiz tuzishda \nfoydalaning",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,

                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        Positioned(
          right: 20,
          top: 0,
          child: SvgPicture.asset(
            "assets/svg_icon/lightning-2.svg",
            height: 130,
          ),
        ),
      ],
    );
  }
}
