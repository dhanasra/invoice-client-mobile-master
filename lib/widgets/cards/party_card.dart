import 'package:components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im/modals/party_model.dart';

class PartyCard extends StatelessWidget {
  final ModelParty party;
  final VoidCallback onPressed;

  const PartyCard({
    Key? key,
    required this.onPressed,
    required this.party
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Box(
      isShadow: true,
      margin: const [15,5],
      padding: const [10],
      child: InkWell(
        onTap: onPressed,
        child: Column(
          mainAxisSize: min,
          children: [
            ExpandedRow(
              children: [
                Label(
                  mainAxisAlignment: mainStart,
                  label: party.name,
                  fontSize: 16,
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
                Label(
                  mainAxisAlignment: mainEnd,
                  label: "${Global.getMoneySymbol("IN")} ${party.balance??0.0}",
                  margin: const [0,0,5,0],
                  fontSize: 14,
                  color: textColor,
                  fontWeight: FontWeight.w500,
                )
              ],
            ),
            Label(
              expanded: true,
              mainAxisAlignment: mainStart,
              label: party.type,
              margin: const [0,5],
              fontSize: 12,
              color: promptColor,
            ),
          ],
        ),
      )
    );
  }
}
