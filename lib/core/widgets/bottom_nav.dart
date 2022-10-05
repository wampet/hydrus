import 'package:flutter/material.dart';
import 'package:hydrus/core/app_export.dart';
import 'package:hydrus/my_flutter_app_icons.dart';

class BottomNavBarCurvedFb1 extends StatefulWidget {
  const BottomNavBarCurvedFb1({Key? key}) : super(key: key);

  @override
  _BottomNavBarCurvedFb1State createState() => _BottomNavBarCurvedFb1State();
}

class _BottomNavBarCurvedFb1State extends State<BottomNavBarCurvedFb1> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = 70;

    final primaryColor = Colors.orange;
    final secondaryColor = Colors.black54;
    final backgroundColor = Colors.white;

    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(size.width, height + 6),
            painter: BottomNavCurvePainter(backgroundColor: backgroundColor),
          ),
          Center(
            heightFactor: 10.0,
            child: Column(
              children: [
                FloatingActionButton(
                    backgroundColor: primaryColor,
                    child: Icon(Icons.add),
                    elevation: 0.1,
                    onPressed: () {
                      Get.toNamed(AppRoutes.payPeopleOptionsScreen);
                    }),
                Text('pay')
              ],
            ),
          ),
          Container(
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavBarIcon(
                  text: "Home",
                  icon: Icons.home_outlined,
                  selected: true,
                  onPressed: () {
                    Get.toNamed(AppRoutes.homeScreen);
                  },
                  defaultColor: secondaryColor,
                  selectedColor: primaryColor,
                ),
                NavBarIcon(
                  text: "Search",
                  icon: Icons.account_balance_wallet_outlined,
                  selected: false,
                  onPressed: () {},
                  defaultColor: secondaryColor,
                  selectedColor: primaryColor,
                ),
                SizedBox(width: 56),
                NavBarIcon(
                    text: "Cart",
                    icon: Icons.person_outline,
                    selected: false,
                    onPressed: () {},
                    defaultColor: secondaryColor,
                    selectedColor: primaryColor),
                NavBarIcon(
                  text: "Calendar",
                  icon: Icons.settings,
                  selected: false,
                  onPressed: () {},
                  selectedColor: primaryColor,
                  defaultColor: secondaryColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavCurvePainter extends CustomPainter {
  BottomNavCurvePainter(
      {this.backgroundColor = Colors.white, this.insetRadius = 38});

  Color backgroundColor;
  double insetRadius;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 12);

    double insetCurveBeginnningX = size.width / 2 - insetRadius;
    double insetCurveEndX = size.width / 2 + insetRadius;
    double transitionToInsetCurveWidth = size.width * .05;
    // path.quadraticBezierTo(size.width * 0.20, 0,
    //     insetCurveBeginnningX - transitionToInsetCurveWidth, 0);
    // path.quadraticBezierTo(
    //     insetCurveBeginnningX, 0, insetCurveBeginnningX, insetRadius / 2);

    // path.arcToPoint(Offset(insetCurveEndX, insetRadius / 2),
    //     radius: Radius.circular(10.0), clockwise: false);

    path.quadraticBezierTo(
        insetCurveEndX, 0, insetCurveEndX + transitionToInsetCurveWidth, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 12);
    path.lineTo(size.width, size.height + 56);
    path.lineTo(
        0,
        size.height +
            56); //+56 here extends the navbar below app bar to include extra space on some screens (iphone 11)
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class NavBarIcon extends StatelessWidget {
  const NavBarIcon(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed,
      this.selectedColor = const Color(0xffFF8527),
      this.defaultColor = Colors.black54})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  final Color defaultColor;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: Icon(
            icon,
            size: 25,
            color: selected ? selectedColor : defaultColor,
          ),
        ),
        Text(text)
      ],
    );
  }
}

class BottomNavBarFb5 extends StatelessWidget {
  const BottomNavBarFb5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: BottomAppBar(
        elevation: 0,
        color: Colors.white,
        child: SizedBox(
          height: 66,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.only(
                left: getHorizontalSize(20),
                right: getHorizontalSize(20),
                bottom: getVerticalSize(5)),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconBottomBar(
                    text: "Home",
                    icon: Icons.home,
                    selected: true,
                    onPressed: () {
                      Get.toNamed(AppRoutes.homeScreen);
                    }),
                IconBottomBar(
                    text: "Cards",
                    icon: MyFlutterApp.payment,
                    selected: false,
                    onPressed: () {}),
                Center(
                  heightFactor: 5,
                  child: NavBarCentreIcon(
                    iconColor: ColorConstant.xenteblue,
                    text: 'pay',
                    selected: false,
                    onPressed: () {},
                  ),
                ),
                IconBottomBar(
                    text: "Manage",
                    icon: Icons.format_list_bulleted_rounded,
                    selected: false,
                    onPressed: () {}),
                IconBottomBar(
                    text: "Grow",
                    icon: Icons.auto_graph_rounded,
                    selected: false,
                    onPressed: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(icon,
              size: 25,
              color:
                  selected ? ColorConstant.xenteblue : ColorConstant.xenteblue),
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: getFontSize(16),
              height: .2,
              color:
                  selected ? ColorConstant.xenteblue : ColorConstant.xenteblue),
        )
      ],
    );
  }
}

class NavBarCentreIcon extends StatelessWidget {
  const NavBarCentreIcon(
      {Key? key,
      required this.iconColor,
      required this.text,
      required this.selected,
      required this.onPressed})
      : super(key: key);
  final String text;

  final bool selected;
  final Function() onPressed;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 20,
          child: FloatingActionButton(
              backgroundColor: iconColor,
              child: Icon(Icons.add),
              elevation: 0.0,
              onPressed: onPressed),
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: getFontSize(16),
              color:
                  selected ? ColorConstant.xenteblue : ColorConstant.xenteblue),
        )
      ],
    );
  }
}
