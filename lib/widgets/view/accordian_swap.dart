import 'package:components/components.dart';
import 'package:flutter/material.dart';

class AccordianSwap extends StatelessWidget {

  final String accordianHeader;
  final bool isSwap;
  final Widget child;
  final VoidCallback onClick;

  const AccordianSwap({
    Key? key,
    required this.accordianHeader ,
    this.isSwap = false,
    required this.child,
    required this.onClick
  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onClick,
        child: Box(
          expanded: true,
          child: Column(
            children: [
              Visibility(
                  visible: !isSwap,
                  child: Label(
                        bgColor: white,
                        expanded: true,
                        height: 55,
                        padding: const [20,0],
                        mainAxisAlignment: mainEnd,
                        suffix: const Icon(
                          Icons.add_circle,
                          size: 18,
                          color: textColor,
                        ),
                        textMargin: const [10,0],
                        label: accordianHeader,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: textColor,
                  ),
              ),
              Visibility(
                  visible: isSwap,
                  child: child
              )
            ],
          ),
        ),
      ),
    );
  }
}
