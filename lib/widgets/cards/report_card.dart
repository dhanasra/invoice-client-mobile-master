import 'package:components/components.dart';
import 'package:flutter/material.dart';

class ReportCard extends StatelessWidget {

  final String label;
  final String value;
  final IconData icon;
  final Color iconColor;

  const ReportCard({
    Key? key,
    required this.label,
    required this.value,
    required this.icon,
    required this.iconColor
  }) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Box(
        width: 150,
        isShadow: true,
        padding: const [15],
        radius: 4,
        borderColor: borderColor,
        margin: const [10,0],
        child: Row(
          mainAxisSize: min,
          crossAxisAlignment: crossStart,
          children: [
            Box(
              margin: const [0,10,0,0],
              child: Icon(icon,color: iconColor,)
            ),
            Column(
              crossAxisAlignment: crossStart,
              mainAxisSize: min,
              children: [
                Label(
                  label: label,
                  mainAxisAlignment: mainStart,
                  fontSize: 14,
                  color: promptColor,
                  fontWeight: FontWeight.w600,
                  margin: const [0,0,0,5],
                ),
                Label(
                    label: '${Global.getMoneySymbol("IN")} $value',
                    mainAxisAlignment: mainStart,
                    fontSize: 18,
                    color: textColor,
                    fontWeight: FontWeight.w600
                ),
              ],
            )
          ],
        )
    );
  }
}
