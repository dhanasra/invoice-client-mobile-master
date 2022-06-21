import 'package:components/components.dart';
import 'package:flutter/material.dart';

class AccordianSwicth extends StatefulWidget {

  final Widget child;
  final String accordianHeader;

  const AccordianSwicth({
    Key? key,
    required this.child,
    required this.accordianHeader
  }):super(key: key);

  @override
  _AccordianSwitchState createState() => _AccordianSwitchState();
}

class _AccordianSwitchState extends State<AccordianSwicth> {

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Box(
        margin: const [15,10],
        borderColor: Colors.red.withOpacity(0.5),
        bgColor: Colors.red.withOpacity(0.1),
        radius: 4,
        child: Column(
          children: [
                Label(
                  expanded: true,
                  height: 55,
                  margin: const [10,0],
                  mainAxisAlignment: mainSpace,
                  textMargin: const [0,0],
                  textAlign: start,
                  label: widget.accordianHeader,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  suffix: Box(
                    child: Switch(
                        value: isVisible,
                        onChanged: (val){
                          setState(() {
                            isVisible = !isVisible;
                          });
                        }
                    ),
                    alignment: right,
                  ),
                  color: Colors.red.withOpacity(0.4),
                ),
            Visibility(
                visible: isVisible,
                child: Box(
                  radius: blunt,
                  child: widget.child,
                )
            )
          ],
        ),
      ),
    );
  }
}
