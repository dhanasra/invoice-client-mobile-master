part of components;

class IMTable {

  static DataCell cell({required BuildContext context,required String text,bool isExpanded = false}){
    return DataCell(
        isExpanded
            ? SizedBox(
            width: 100,
            child:Text(text,
                style: Theme.of(context).textTheme.caption!.copyWith(
                  color: textColor,
                  fontSize: 8,
                )
            )
        )
            :
        Box(
          padding: [0,5,0,0],
          child: SizedBox(
              width: 40,
              child: Text(text,
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.caption!.copyWith(
                    color: textColor,
                    fontSize: 8,
                  )
              )
          ),
        )
    );
  }

  static DataColumn column({required BuildContext context,required String text,bool isExpanded = false}){
    return DataColumn(
        label: isExpanded
            ? SizedBox(
              width: 100,
              child:Text(text,
              style: Theme.of(context).textTheme.caption!.copyWith(color: textColor,
                  fontSize: 8,
                  fontWeight: FontWeight.w500,
              )
              )
            )
            :
       Box(
         padding: [0,5,0,0],
         child:  SizedBox(
             width: 40,
             child: Text(
               text,
               textAlign: TextAlign.right,
               style: Theme.of(context).textTheme.caption!.copyWith(color: textColor,
                   fontSize: 8,
                   fontWeight: FontWeight.w500
               ),
             )
         ),
       )
    );
  }

  static Widget recentTransactions({required BuildContext context,required List<Transactions> transactions}){
    return DataTable(
        showCheckboxColumn: false,
        headingRowColor: MaterialStateProperty.all(highlightColor),
        horizontalMargin: defaultPadding,
        headingRowHeight: 40,
        columnSpacing: defaultPadding,
        columns: [
          IMTable.column(context: context, text: "NO"),
          IMTable.column(context: context, text: "DATE"),
          IMTable.column(context: context, text: "PARTY"),
          IMTable.column(context: context, text: "AMOUNT"),
          IMTable.column(context: context, text: "TYPE"),
        ],
        rows: List.generate(transactions.length, (index) =>
            DataRow(
                onSelectChanged: (index){

                },
                cells: [
                  IMTable.cell(context: context, text: index.toString()),
                  IMTable.cell(context: context, text: transactions[index].date),
                  IMTable.cell(context: context, text: transactions[index].party),
                  IMTable.cell(context: context, text: transactions[index].amount),
                  IMTable.cell(context: context, text: transactions[index].type),
                ]
            )
        )
    );
  }

  static Widget cashBank({required BuildContext context,required List<CashBank> cashBank}){
    return DataTable(
        showCheckboxColumn: false,
        headingRowColor: MaterialStateProperty.all(highlightColor),
        horizontalMargin: defaultPadding,
        headingRowHeight: 40,
        columnSpacing: defaultPadding,
        columns: [
          IMTable.column(context: context, text: "DATE"),
          IMTable.column(context: context, text: "TYPE"),
          IMTable.column(context: context, text: "TXN NO"),
          IMTable.column(context: context, text: "PARTY"),
          IMTable.column(context: context, text: "MODE"),
          IMTable.column(context: context, text: "PAID"),
          IMTable.column(context: context, text: "RECEIVED"),
          IMTable.column(context: context, text: "BALANCE"),
        ],
        rows: List.generate(cashBank.length, (index) =>
            DataRow(
                onSelectChanged: (index){

                },
                cells: [
                  IMTable.cell(context: context, text: cashBank[index].date),
                  IMTable.cell(context: context, text: cashBank[index].type),
                  IMTable.cell(context: context, text: cashBank[index].txn),
                  IMTable.cell(context: context, text: cashBank[index].party),
                  IMTable.cell(context: context, text: cashBank[index].mode),
                  IMTable.cell(context: context, text: cashBank[index].paid),
                  IMTable.cell(context: context, text: cashBank[index].received),
                  IMTable.cell(context: context, text: cashBank[index].balance),
                ]
            )
        )
    );
  }

  static Widget expenses({required BuildContext context,required List<Expenses> expenses}){
    return DataTable(
        showCheckboxColumn: false,
        headingRowColor: MaterialStateProperty.all(highlightColor),
        horizontalMargin: defaultPadding,
        headingRowHeight: 40,
        columnSpacing: defaultPadding,
        columns: [
          IMTable.column(context: context, text: "DATE"),
          IMTable.column(context: context, text: "PARTY"),
          IMTable.column(context: context, text: "MODE"),
          IMTable.column(context: context, text: "PAID"),
          IMTable.column(context: context, text: "BALANCE"),
        ],
        rows: List.generate(expenses.length, (index) =>
            DataRow(
                onSelectChanged: (index){

                },
                cells: [
                  IMTable.cell(context: context, text: expenses[index].date),
                  IMTable.cell(context: context, text: expenses[index].party),
                  IMTable.cell(context: context, text: expenses[index].mode),
                  IMTable.cell(context: context, text: expenses[index].paid),
                  IMTable.cell(context: context, text: expenses[index].balance),
                ]
            )
        )
    );
  }

  static Widget parties({required BuildContext context,required List<Parties> parties}){
    return DataTable(
        showCheckboxColumn: false,
        headingRowColor: MaterialStateProperty.all(highlightColor),
        horizontalMargin: defaultPadding,
        headingRowHeight: 40,
        columnSpacing: defaultPadding,
        columns: [
          IMTable.column(context: context, text: "NAME"),
          IMTable.column(context: context, text: "MOBILE NUMBER"),
          IMTable.column(context: context, text: "PARTY TYPE"),
          IMTable.column(context: context, text: "BALANCE"),
        ],
        rows: List.generate(parties.length, (index) =>
            DataRow(
                onSelectChanged: (index){

                },
                cells: [
                  IMTable.cell(context: context, text: parties[index].name),
                  IMTable.cell(context: context, text: parties[index].mobile),
                  IMTable.cell(context: context, text: parties[index].type),
                  IMTable.cell(context: context, text: parties[index].balance),
                ]
            )
        )
    );
  }

  static Widget items({required BuildContext context,required List<Items> items}){
    return DataTable(
        showCheckboxColumn: false,
        headingRowColor: MaterialStateProperty.all(secondaryColor.withOpacity(0.4)),
        horizontalMargin: 5,
        headingRowHeight: 25,
        dataRowHeight: 30,
        columnSpacing: 0.8,
        showBottomBorder: true,
        dividerThickness: 0,
        columns: [
          IMTable.column(context: context, text: "ITEMS",isExpanded: true),
          IMTable.column(context: context, text: "QTY"),
          IMTable.column(context: context, text: "RATE"),
          IMTable.column(context: context, text: "MRP"),
          IMTable.column(context: context, text: "DISC"),
          IMTable.column(context: context, text: "TAX"),
          IMTable.column(context: context, text: "AMOUNT")
        ],
        rows: List.generate(items.length, (index) =>
            DataRow(
                onSelectChanged: (index){

                },
                cells: [
                  IMTable.cell(context: context, text: items[index].name,isExpanded: true),
                  IMTable.cell(context: context, text: items[index].qty),
                  IMTable.cell(context: context, text: items[index].rate),
                  IMTable.cell(context: context, text: items[index].mrp),
                  IMTable.cell(context: context, text: items[index].disc),
                  IMTable.cell(context: context, text: items[index].tax),
                  IMTable.cell(context: context, text: items[index].amount),
                ]
            )
        )
    );
  }
}

