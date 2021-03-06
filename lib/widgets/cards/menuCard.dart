import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class MenuCard extends StatefulWidget {
  final Function onTap;
  final String text;
  final List<Color> colorList;

  MenuCard({@required this.onTap, @required this.text, this.colorList});

  @override
  _MenuCardState createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> with TickerProviderStateMixin {
  Animation _scaleanimation;
  AnimationController _scalecontroller;

  @override
  void initState() {
    _scalecontroller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    _scaleanimation = Tween<double>(
      begin: 1,
      end: 0.97,
    ).animate(
      _scalecontroller,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await _scalecontroller.forward();
        await _scalecontroller.reverse();
        widget.onTap();
      },
      child: ScaleTransition(
        scale: _scaleanimation,
        child: Container(
          height: Get.height / 10,
          width: Get.width * 0.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(colors: widget.colorList)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.text,
                  style: TextStyle(
                      fontFamily: "JosefinSans",
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
