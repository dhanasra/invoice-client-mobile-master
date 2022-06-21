import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TransactionCard extends StatelessWidget {
  final VoidCallback onPressed;
  final VoidCallback onDownloadPressed;
  final VoidCallback onSharePressed;
  final String partyName;
  final String transactionType;
  final String date;
  final String no;
  final String total;
  final String balance;

  const TransactionCard({
    Key? key,
    required this.balance,
    required this.total,
    required this.no,
    required this.transactionType,
    required this.date,
    required this.partyName,
    required this.onPressed,
    required this.onDownloadPressed,
    required this.onSharePressed
}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Box(
        isShadow: true,
        margin: const [12,5],
        padding: const [10,10,5,15],
        child: InkWell(
          onTap: onPressed,
          child: Column(
            mainAxisSize: min,
            children: [
              ExpandedRow(
                children: [
                  Label(
                    mainAxisAlignment: mainStart,
                    label: partyName,
                    margin: const [0,0,5,0],
                    fontSize: 16,
                    color: textColor,
                    fontWeight: FontWeight.w600,
                  ),
                  Label(
                    mainAxisAlignment: mainEnd,
                    label: date,
                    margin: const [0,0,5,0],
                    fontSize: 14,
                    color: textColor,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
              const Divider(height: 5,color: Colors.transparent,),
              ExpandedRow(
                children: [
                  Row(
                    children: [
                      Box(
                          radius: 2,
                          bgColor: Colors.red.withOpacity(0.2),
                          child: const Label(
                            margin: [2],
                            label: "Purchase",
                            fontSize: 8,
                            color: btnColor,
                          )
                      ),
                    ],
                  ),
                  Label(
                    mainAxisAlignment: mainEnd,
                    label: no,
                    fontSize: 14,
                    color: promptColor,
                  )
                ],
              ),
              const Divider(height: 5,color: Colors.transparent,),
              Row(
                children: [
                  Expanded(child:
                  Column(
                    children: [
                      const ExpandedRow(
                        children: [
                          Label(
                            label: "Total",
                            margin: [0,0,5,0],
                            fontSize: 13,
                            mainAxisAlignment: mainStart,
                            color: promptColor,
                          ),
                          Label(
                            label: "Balance",
                            margin: [0,0,5,0],
                            fontSize: 13,
                            mainAxisAlignment: mainStart,
                            color: promptColor,
                          )
                        ],
                      ),
                      ExpandedRow(
                        children: [
                          Label(
                            mainAxisAlignment: mainStart,
                            label: "${Global.getMoneySymbol("IN")} $total",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: textColor,),
                          Label(
                            mainAxisAlignment: mainStart,
                            label: "${Global.getMoneySymbol("IN")} $balance",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: textColor,)
                        ],
                      ),
                    ],),
                  ),
                   SizedBox(
                        child: Row(
                          children: [
                            IconButton(icon: const Icon(Icons.download_sharp,color: iconColorLight,size: 18,),onPressed: onDownloadPressed,),
                            IconButton(
                              constraints: const BoxConstraints(maxWidth: 30,minWidth: 10),
                              icon: const Icon(Icons.share,color: iconColorLight,size: 18,),onPressed: onSharePressed,),
                          ],
                        ),
                        height: 25,
                   )
                ],
              )
            ],
          ),
        )
    );
  }
}
