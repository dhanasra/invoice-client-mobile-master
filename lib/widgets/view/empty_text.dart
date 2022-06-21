import 'package:components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyText extends StatefulWidget {
  final String text;
  final String subText;
  final IconData icon;

  const EmptyText({
    Key? key,
    required this.text,
    required this.subText,
    required this.icon,
  }) : super(key:key);

  @override
  _EmptyTextState createState() => _EmptyTextState();
}

class _EmptyTextState extends State<EmptyText> {
  @override
  Widget build(BuildContext context) {
    return Box(
      padding: const [0,50],
      radius: sharp,
      bgColor: borderColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            widget.icon,
            size: 80,
            color: iconColor,
          ),
          const Divider(color: Colors.transparent,),
          Label(
            label: widget.text,
            fontSize: 16,
            color: textColor,
            fontWeight: FontWeight.w500,
          ),
          const Divider(color: Colors.transparent,height: 10,),
          Label(
            label: widget.subText,
            fontSize: 14,
            color: promptColor,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
