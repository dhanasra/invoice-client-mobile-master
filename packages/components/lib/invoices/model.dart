part of components;

class CashBank{
  final String date,type,txn,party,mode,paid,received,balance;

  CashBank({required this.date,required this.type,required this.txn,required this.party,required this.mode,required this.paid,required this.received,required this.balance});
}

class Expenses{
  final String date,party,mode,paid,balance;

  Expenses({required this.date,required this.party,required this.mode,required this.paid,required this.balance});
}

class Items{
  final String name,qty,rate,mrp,disc,tax,amount;

  Items({required this.name,required this.rate,required this.qty,required this.disc,required this.mrp,required this.tax,required this.amount});
}

class Parties{
  final String name,mobile,type,balance;

  Parties({required this.name,required this.mobile,required this.type,required this.balance});
}

class Transactions{
  final String date,party,amount,type;

  Transactions({required this.amount,required this.date,required this.party,required this.type});
}

