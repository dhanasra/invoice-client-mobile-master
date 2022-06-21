import 'package:components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im/app/app.dart';

class Empty extends StatefulWidget {
  final String route;
  final String text;
  final IconData icon;
  final String btnText;

  const Empty({
    Key? key,
    required this.text,
    required this.icon,
    required this.btnText,
    required this.route
  }) : super(key:key);

  @override
  _EmptyState createState() => _EmptyState();
}

class _EmptyState extends State<Empty> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          widget.icon,
          size: 50,
          color: iconColor,
        ),
        Label(
          label: widget.text,
          fontSize: 14,
          color: promptColor,
          fontWeight: FontWeight.w500,
        ),
        const Divider(color: Colors.transparent,),
        PrimaryButton(
          label: widget.btnText,
          prefix: const Icon(Icons.add_circle_outline),
          margin: const [10,0],
          textMargin: const [10,0],
          radius: round,
          buttonColor: AppColors.BUTTON_COLOR,
          onPressed: (){
            App().setNavigation(context,widget.route);
          },
        ),
      ],
    );
  }
}
