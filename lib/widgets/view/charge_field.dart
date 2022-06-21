import 'package:components/components.dart';
import 'package:flutter/material.dart';

class ChargeField extends StatefulWidget {
  final Widget? child;
  final bool isAmountLabel;
  final bool isNone;
  final bool isCloseable;
  final VoidCallback onClick;
  final bool addInput;
  final List<double> margin;

  const ChargeField({
    Key? key,
    this.child,
    this.margin = const [],
    this.isAmountLabel = false,
    this.isNone = false,
    this.isCloseable = true,
    required this.onClick,
    this.addInput = true
  }):super(key:key);

  @override
  _ChargeFieldState createState() => _ChargeFieldState();
}

class _ChargeFieldState extends State<ChargeField> {
  @override
  Widget build(BuildContext context) {
    return Box(
      padding: const [5,10,0,0],
      margin: widget.margin,
      bgColor: white,
      child: Row(
        mainAxisSize: max,
        children: [
          Visibility(
            visible: widget.isCloseable,
            child:SizedBox(
                width: 40,
                child: IconButton(
                    onPressed: widget.onClick,
                    icon: const Icon(Icons.cancel,size: 20,color: iconColor,)
                ),
              ),
          ),
          Visibility(
            visible: !widget.addInput,
            child: Expanded(child: widget.child??const Spacer()),
          ),
          Visibility(
            visible: widget.addInput ,
              child: const Expanded(
                  child: Box(
                    margin: [0,10,0,0],
                    bottomBorder: true,
                    child: TextInput(
                      width: 80,
                      contentPadding: [0,5],
                      textHeight: 1.2,
                      height: 30,
                      hintText: "charge_name",
                      textAlign: start,
                      isFilled :false,
                      noBorder: true,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
          ),
          Box(
              width: 80,
              bottomBorder: true,
              child: Row(
                mainAxisAlignment: mainSpace,
                children: [
                  Label(label:Global.getMoneySymbol("IN"),fontWeight: FontWeight.w400,color: widget.isAmountLabel?textColor:promptColor,),
                  widget.isAmountLabel?
                  const Label(
                    bgColor: white,
                    color: textColor,
                    fontSize: 14,
                    textAlign: end,
                    textHeight: 1.2,
                    width: 60,
                    fontWeight: FontWeight.w500,
                    textPadding: [0,5],
                    label: "00.00",
                    mainAxisAlignment: mainEnd,
                  ):
                  const TextInput(
                    fontSize: 14,
                    width: 60,
                    textAlign: end,
                    textHeight: 1.2,
                    height: 30,
                    hintText: "00.00",
                    hintColor: promptColor,
                    contentPadding: [0,5],
                    isFilled: false,
                    noBorder: true,
                    fontWeight: FontWeight.w500,
                    enabledBorderColor: borderColor,
                    focusedBorderColor: borderColor,
                    radius: blunt,
                    textAlignVertical: TextAlignVertical.top,
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
