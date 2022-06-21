import 'package:components/components.dart';
import 'package:flutter/material.dart';

class Option extends StatelessWidget {

  final IconData icon;
  final String title;
  final String? subTitle;
  final VoidCallback onClick;
  final Color bgColor;
  final Color iconColor;
  final Color txtColor;

  const Option({
    Key? key,
    required this.onClick,
    required this.title,
    required this.icon,
    this.subTitle,
    this.bgColor = white,
    this.iconColor = textColor,
    this.txtColor = textColor
  }): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onClick,
        child: Box(
          bgColor: bgColor,
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 1,
                      color: borderColor
                  )
              )
          ),
          child: ListTile(
            tileColor: bgColor,
            title: Label(
              mainAxisAlignment: mainStart,
              textAlign: start,
              fontFamily: AppFont.FONT,
              fontSize: 14,
              color: txtColor,
              label: title,),
            subtitle: subTitle!=null?Label(
              label: subTitle!,
              color: borderColor,
              mainAxisAlignment: mainStart,
              fontSize: 12,
              margin: const [0,0,5,0],
              textAlign: start,
            ):null,
            leading: Icon(icon,color: iconColor),
            trailing: Icon(Icons.keyboard_arrow_right,color: iconColor),
          ),
        ),
      ),
    );
  }
}
