import 'package:components/components.dart';
import 'package:flutter/material.dart';

class AccordianContainer extends StatefulWidget {

  final Widget child;
  final String accordianHeader;

  const AccordianContainer({
    Key? key,
    required this.child,
    required this.accordianHeader
  }):super(key:key);

  @override
  _AccordianContainerState createState() => _AccordianContainerState();
}

class _AccordianContainerState extends State<AccordianContainer> {

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Box(
      expanded: true,
      child: Column(
        children: [
          Material(
            color: isVisible?Colors.transparent:white,
            child: InkWell(
              child: Label(
                expanded: true,
                height: 55,
                margin: const [20,0],
                mainAxisAlignment: mainEnd,
                suffix: Icon(
                  isVisible?Icons.cancel:Icons.add_circle,
                  size: 18,
                  color: isVisible?btnColor:textColor,
                ),
                textMargin: const [10,0],
                label: widget.accordianHeader,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: isVisible?btnColor:textColor,
              ),
              onTap: (){
                setState(() {
                  isVisible = !isVisible;
                });
              },
            ),
          ),
          Visibility(
            visible: isVisible,
            child: Container(
              color: white,
              child: widget.child,
            )
          ),
        ],
      ),
    );
  }
}
