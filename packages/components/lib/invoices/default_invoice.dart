part of components;

class DefaultInvoice extends StatelessWidget {
  const DefaultInvoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Box(
      decoration: BoxDecoration(
          color: bright,
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: borderColor)
      ),
      margin: [0],
      padding: [0,0,0,5],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicHeight(
            child:
            Row(
                children: [
                  Expanded(
                    child: Row(children: [
                      const Box(width: 50,height: 50,asset: "logo.png",radius: 30,margin: [5],),
                      Column(
                        mainAxisAlignment: mainCenter,
                        crossAxisAlignment: crossStart,
                        children: [
                          Content(text: "Business Name",fontSize: 12,textAlign: start,fontWeight: FontWeight.bold,color: secondaryColor,),
                          Content(text: "8056384773",fontSize: 8,textAlign: start,fontWeight: FontWeight.bold,padding: [0,0,5,0],),
                        ],
                      )
                    ],),
                  ),
                  VerticalDivider(
                      width: 1,
                      color: Colors.black
                  ),
                  Box(
                    width: 120,
                    child: Column(
                      mainAxisAlignment: mainCenter,
                      children: [
                        ExpandedRow(children: [
                          Content(text: "Invoice No :",textAlign: start,fontSize: 8,padding: [2,0,0,0]),
                          Content(text: "#22",textAlign: end,fontSize: 8,padding: [0,2,0,0],),
                        ],),
                        ExpandedRow(children: [
                          Content(text: "Invoice Date :",textAlign: start,fontSize: 8,padding: [2,0,5,0]),
                          Content(text: "10-01-2022",textAlign: end,fontSize: 8,padding: [0,2,5,0],),
                        ],),
                      ],
                    ),
                  )
                ]
            ),),
          ExpandedRow(
              bgColor: secondaryColor.withOpacity(0.4),
              padding: [5,5],
              children: [
                Content(text: "BILL TO",fontSize: 8,textAlign: start,fontWeight: FontWeight.bold,),
                Content(text: "SHIP TO",fontSize: 8,textAlign: start,fontWeight: FontWeight.bold),
              ]
          ),
          ExpandedRow(

              padding: [2,5],
              children: [
                Column(
                  crossAxisAlignment: crossStart,
                  children: [
                    Content(text: "RAKESH ENTERPRISES",fontSize: 8,fontWeight: FontWeight.w500,),
                    Content(text: "2nd Floor, 12th Main Road, Sector 6, Tamilnadu, 625009",fontSize: 7,textAlign: start),
                    Content(text: "GSTIN : 29BDNPXXXXXXXX",fontSize: 7,),
                    Content(text: "PLACE OF SUPPLY : Mumbai",fontSize: 7,),
                    Content(text: "PHONE NUMBER : 8056384773",fontSize: 7,),
                  ],
                ),
                Column(
                  crossAxisAlignment: crossStart,
                  children: [
                    Content(text: "RAKESH ENTERPRISES",fontSize: 8,fontWeight: FontWeight.w500,),
                    Content(text: "2nd Floor, 12th Main Road, Sector 6, Tamilnadu, 625009",fontSize: 7,textAlign: start,),
                    Content(text: "GSTIN : 29BDNPXXXXXXXX",fontSize:7,),
                  ],
                )
              ]
          ),
          SizedBox(
              width: 400,
              child: IMTable.items(context: context, items: [
                Items(name: "Rice IR 20 ", rate: "120", qty: "5 kg", disc: "12%", mrp: "130", tax: "-", amount: "120"),
                Items(name: "Rice IR 20 ", rate: "120", qty: "5 kg", disc: "12%", mrp: "130", tax: "-", amount: "120"),
                Items(name: "Rice IR 20 ", rate: "120", qty: "5 kg", disc: "12%", mrp: "130", tax: "-", amount: "120"),
                Items(name: "Rice IR 20 ", rate: "120", qty: "5 kg", disc: "12%", mrp: "130", tax: "-", amount: "120"),
                Items(name: "Rice IR 20 ", rate: "120", qty: "5 kg", disc: "12%", mrp: "130", tax: "-", amount: "120"),
                Items(name: "Rice IR 20 ", rate: "120", qty: "5 kg", disc: "12%", mrp: "130", tax: "-", amount: "120"),
                Items(name: "Rice IR 20 ", rate: "120", qty: "5 kg", disc: "12%", mrp: "130", tax: "-", amount: "120"),
                Items(name: "", rate: "", qty: "", disc: "", mrp: "", tax: "TOTAL", amount: "120")
              ])
          ),
          IntrinsicHeight(
            child:  Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: crossStart,
                      children: [
                      Content(text: "BANK DETAILS",textAlign: start,fontSize: 8,padding: [2,0,5,0],fontWeight: FontWeight.w500,),

                      ExpandedRow(children: [
                        Content(text: "Name :",textAlign: start,fontSize: 8,padding: [2,0,5,0]),
                        Content(text: "Dhana Sekaran",textAlign: start,fontSize: 8,padding: [0,2,5,0],),
                      ],),
                      ExpandedRow(children: [
                        Content(text: "Account Number :",textAlign: start,fontSize: 8,padding: [2,0,5,0]),
                        Content(text: "12345667788",textAlign: start,fontSize: 8,padding: [0,2,5,0],),
                      ],),
                      ExpandedRow(children: [
                        Content(text: "IFSC Code :",textAlign: start,fontSize: 8,padding: [2,0,5,0]),
                        Content(text: "6767676767",textAlign: start,fontSize: 8,padding: [0,2,5,0],),
                      ],),
                      ExpandedRow(children: [
                        Content(text: "Bank :",textAlign: start,fontSize: 8,padding: [2,0,5,0]),
                        Content(text: "SBI Bank",textAlign: start,fontSize: 8,padding: [0,2,5,0],),
                      ],),

                      Content(text: "Notes",textAlign: start,fontSize: 8,padding: [2,0,20,0],fontWeight: FontWeight.w500,),
                    ],),

                  ),
                  VerticalDivider(
                      width: 1,
                      color: Colors.black
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: crossEnd,
                      children: [
                      ExpandedRow(children: [
                        Content(text: "Taxable Amount :",textAlign: end,fontSize: 8,padding: [0,2,5,0]),
                        Content(text: "${Global.getMoneySymbol("IN")} 120",textAlign: end,fontSize: 8,padding: [0,2,5,0],),
                      ],),
                      ExpandedRow(children: [
                        Content(text: "Subtotal :",textAlign: end,fontSize: 8,padding: [0,2,5,0]),
                        Content(text: "${Global.getMoneySymbol("IN")} 220",textAlign: end,fontSize: 8,padding: [0,2,5,0],),
                      ],),
                      ExpandedRow(children: [
                        Content(text: "Round Off :",textAlign: end,fontSize: 8,padding: [0,2,5,0]),
                        Content(text: "${Global.getMoneySymbol("IN")} 12",textAlign: end,fontSize: 8,padding: [0,2,5,0],),
                      ],),
                      ExpandedRow(children: [
                        Content(text: "Discount :",textAlign: end,fontSize: 8,padding: [0,2,5,0]),
                        Content(text: "${Global.getMoneySymbol("IN")} -10",textAlign: end,fontSize: 8,padding: [0,2,5,0],),
                      ],),
                      ExpandedRow(children: [
                        Content(text: "Delivery Charges :",textAlign: end,fontSize: 8,padding: [0,2,5,0]),
                        Content(text: "${Global.getMoneySymbol("IN")} 100",textAlign: end,fontSize: 8,padding: [0,2,5,0],),
                      ],),
                      ExpandedRow(children: [
                        Content(text: "Total :",textAlign: end,fontSize: 8,padding: [0,2,5,0],fontWeight: FontWeight.w500,),
                        Content(text: "${Global.getMoneySymbol("IN")} 320",textAlign: end,fontSize: 8,padding: [0,2,5,0],fontWeight: FontWeight.w500,),
                      ],),
                      ExpandedRow(children: [
                        Content(text: "Received :",textAlign: end,fontSize: 8,padding: [0,2,5,0]),
                        Content(text: "${Global.getMoneySymbol("IN")} 120",textAlign: end,fontSize: 8,padding: [0,2,5,0],),
                      ],),
                      ExpandedRow(children: [
                        Content(text: "Balance :",textAlign: end,fontSize: 8,padding: [0,2,5,0],fontWeight: FontWeight.w500,),
                        Content(text: "${Global.getMoneySymbol("IN")} 100",textAlign: end,fontSize: 8,padding: [0,2,5,0],fontWeight: FontWeight.w500,),
                      ],),
                      Content(text: "Total Amount In Words",textAlign: end,fontSize: 8,padding: [0,2,5,0],fontWeight: FontWeight.w500,),
                      Content(text: "Hundred ten",textAlign: end,fontSize: 8,padding: [0,2,5,0],fontWeight: FontWeight.w500,),
                    ],
                    )
                  ),
                ]
            ),
          ),

        ],
      ),
    );
  }
}
