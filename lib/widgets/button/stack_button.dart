import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:im/app/app.dart';

class StackButton extends StatefulWidget {
  final Widget child;
  final String btnText;
  final String route;
  final IconData icon;

  const StackButton({
    Key? key,
    required this.btnText,
    required this.route,
    required this.icon,
    required this.child,
  }) : super(key:key);

  @override
  _StackButtonState createState() => _StackButtonState();
}

class _StackButtonState extends State<StackButton> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        Align(
            alignment: Alignment.bottomCenter,
            child: Box(
              margin: const [0, 30],
              child: FloatingActionButton.extended(
                  onPressed: () {
                    App().setNavigation(context, widget.route,func: ()=>setState(() {
                    }));
                  },
                  icon: Icon(widget.icon),
                  backgroundColor: btnColor,
                  label: Label(
                    label: widget.btnText,
                    fontSize: 14,
                    color: white,
                  )
              ),
            )
        ),
      ],
    );
  }
}