import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:im/modals/item_model.dart';

class ItemCard extends StatelessWidget {
  
  final ModelItem item;
  final VoidCallback onPressed;
  final VoidCallback onEditPressed;

  const ItemCard({
    Key? key,
    required this.item,
    required this.onPressed,
    required this.onEditPressed
  }): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Box(
        isShadow: true,
        margin: const [15,5],
        padding: const [10,10,5,10],
        child: InkWell(
          onTap: onPressed,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ExpandedRow(
                children: [
                  Label(
                    mainAxisAlignment: mainStart,
                    label: item.name,
                    margin: const [0,0,5,0],
                    fontSize: 16,
                    color: textColor,
                    fontWeight: FontWeight.w600,
                  ),
                  Label(
                    mainAxisAlignment: mainEnd,
                    label: item.stock?.stockValue??"--",
                    margin: const [0,0,5,0],
                    fontSize: 14,
                    color: textColor,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
              ExpandedRow(
                children: [
                  const Box(),
                  Label(
                    mainAxisAlignment: mainEnd,
                    label: item.pricing?.unit??"--",
                    fontSize: 12,
                    color: textColor,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Column(
                        children: [
                          const ExpandedRow(
                            children: [
                              Label(
                                label: "Sales Price",
                                margin: [0,0,5,0],
                                fontSize: 13,
                                mainAxisAlignment: mainStart,
                                color: promptColor,
                              ),
                              Label(
                                label: "Purchase Price",
                                margin: [0,0,5,0],
                                fontSize: 13,
                                mainAxisAlignment: mainStart,
                                color: promptColor,
                              ),
                              Box()
                            ],
                          ),
                          ExpandedRow(
                            children: [
                              Label(
                                mainAxisAlignment: mainStart,
                                label: "${Global.getMoneySymbol("IN")} ${item.pricing?.salesPrice}",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: textColor,),
                              Label(
                                mainAxisAlignment: mainStart,
                                label: "${Global.getMoneySymbol("IN")} ${item.pricing?.purchasePrice??"--"}",
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: textColor,),
                              const Box()
                            ],
                          ),
                        ],
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        IconButton(
                          constraints: const BoxConstraints(maxWidth: 30,minWidth: 10),
                          icon: const Icon(Icons.edit,color: iconColorLight,size: 18,),onPressed: onEditPressed,),
                      ],
                    ),
                    height: 25,
                  )
                ],
              ),
            ],
          ),
        )
    );
  }
}
