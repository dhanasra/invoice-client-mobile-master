import 'package:components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:im/app/app.dart';
import 'package:im/app/app_routes.dart';
import 'package:im/bloc/network_bloc.dart';
import 'package:im/bloc/network_event.dart';
import 'package:im/bloc/network_state.dart';
import 'package:im/modals/user_model.dart';
import 'package:im/widgets/cards/report_card.dart';
import 'package:im/widgets/cards/transaction_card.dart';
import 'package:line_icons/line_icons.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late NetworkBloc bloc;

  @override
  void initState() {
    bloc = NetworkBloc(Init());
    bloc.add(GetAllTransactionEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarTypes.appBarMain(
          onPressed: (){},
          children: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.all_inbox_sharp,color: iconColor,),splashRadius: 20,),
            IconButton(onPressed: (){}, icon: const Icon(Icons.notifications,color: iconColor,),splashRadius: 20,)
          ],
          title: "Business Name",
          leading: const Box(width: 30,height: 50,asset: "logo.png",radius: 30,margin: [10,0,5,5],)
        ),
        body: BlocBuilder(
          bloc: bloc,
          builder: (context,state){
            if(state is Loading){
              return const Loader();
            } else if(state is Fetched){
              if(state.data.length>0) {
                return body();
              }else{
                return bodyEmpty();
              }
            }else{
              return const Box();
            }
          },
        )
    );
  }

  Widget body(){
    return Stack(
      children: [
        Column(
          children: [
            report(false,"0","0"),
            Expanded(
              child:ListView.builder(
                  itemCount: 10,
                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                  itemBuilder: (BuildContext context,index) {
                    return TransactionCard(
                      partyName: "Dhana",
                      no: "#1",
                      date: "23 Oct 2021",
                      transactionType: "Paid",
                      total: "23",
                      balance: "12",
                      onPressed: (){
                        AppRoutes.CURRENT_PATH="Bill/Invoice";
                        App().setNavigation(context, AppRoutes.APP_TRANSACTIONS_DETAILS);
                      },
                      onDownloadPressed: (){},
                      onSharePressed: (){},
                    );
                  }
              ),
            )
          ],
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Box(
              height: 50,
              margin: const [10,20],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Box(
                      child: FloatingActionButton.extended(
                          heroTag: "purchase",
                          onPressed: () {
                            AppRoutes.CURRENT_PATH="Purchase";
                            App().setNavigation(context, AppRoutes.APP_INVOICE);
                          },
                          backgroundColor: btnColor,
                          label: const Label(
                            label: "Purchase",
                            fontSize: 14,
                            color: white,
                          )
                      ),
                    ),
                  ),
                  Box(
                    margin: const [5,0],
                    child: FloatingActionButton(
                      onPressed: (){
                        Future.delayed(const Duration(seconds: 0), () {
                          showBottomSheet(context: context);
                        });
                      },
                      backgroundColor: btnColor,
                      child: const Icon(Icons.add,color: white,),
                    ),
                  ),
                  Expanded(
                    child: Box(
                      child: FloatingActionButton.extended(
                          heroTag: "bill",
                          onPressed: () {
                            AppRoutes.CURRENT_PATH="Bill/Invoice";
                            App().setNavigation(context, AppRoutes.APP_INVOICE);
                          },
                          backgroundColor: btnColor,
                          label: const Label(
                            label: "Bill/Invoice",
                            fontSize: 14,
                            color: white,
                          )
                      ),
                    ),
                  )
                ],
              ),
            )
        ),
      ],
    );
  }

  Widget bodyEmpty(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [report(true,"0","0"),
            const Align(
                alignment: Alignment.bottomCenter,
                child: Box(
                  height: 240,
                  child: Icon(Icons.lock),
                )
            )
          ],
        ),
        const Label(
          label: "create_invoice",
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: textColor,
          margin: [5],
        ),
        const Label(
          label: "unlock",
          fontSize: 14,
          color: promptColor,
          fontWeight: FontWeight.w500,
        ),
        PrimaryButton(
          margin: const [0,20],
          label: "bill_invoice",
          radius: round,
          width: 150,
          buttonColor: btnColor,
          onPressed: (){

          },
        ),
      ],
    );
  }

  Widget report(bool isFade,String amount1,String amount2){
    return Box(
      decoration: const BoxDecoration(
          color: white,
          border: Border(bottom: BorderSide(
              color: borderColor,
              width: 6,
              style: BorderStyle.solid
          ))
      ),
      padding: const [0,0,10,20],
      bgColor: white,
      child: Opacity(
          opacity: isFade?0.2:1,
          child: ExpandedRow(
            children: [
              ReportCard(
                  label:"To Pay",
                  value:amount1,
                  icon:Icons.arrow_upward_outlined,
                  iconColor:Colors.red
              ),
              ReportCard(
                  label:"To Collect",
                  value:amount1,
                  icon:Icons.arrow_downward_outlined,
                  iconColor:Colors.green
              ),
            ],
          )
      ),
    );
  }

  showBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        shape: const RoundedRectangleBorder(
            borderRadius:
            BorderRadius.vertical(top: Radius.circular(16))),
        builder: (context) =>
            DraggableScrollableSheet(
              initialChildSize: 0.75,
              minChildSize: 0.7,
              maxChildSize: 0.75,
              expand: false,
              builder: (_, controller) =>
                  Column(
                    crossAxisAlignment: crossStart,
                    children: [
                      const Label(
                        padding: [15,15,30,10],
                        label: "Sales Transactions",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                      Box(
                        height: 200,
                        expanded: true,
                        child: GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 4,
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 1.5,
                          children: [
                            transactionItem("Bill/Invoice",Icons.sticky_note_2_outlined,Colors.green,AppRoutes.APP_INVOICE),
                            transactionItem("Received Payment",LineIcons.indianRupeeSign,Colors.green,AppRoutes.APP_PAYMENT),
                            transactionItem("Sales Return",Icons.keyboard_return_sharp,Colors.green,AppRoutes.APP_INVOICE),
                            transactionItem("Quotation/Estimate",Icons.note_rounded,Colors.green,AppRoutes.APP_INVOICE),
                            transactionItem("Delivery Challan",Icons.car_repair,Colors.green,AppRoutes.APP_INVOICE),
                          ],
                        ),
                      ),
                      const Divider(),
                      const Label(
                        padding: [15,10],
                        label: "Purchase Transactions",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                      Box(
                        height: 100,
                        expanded: true,
                        child: GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 4,
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 1.5,
                          children: [
                            transactionItem("Purchase",Icons.shopping_cart_outlined,primaryColor,AppRoutes.APP_INVOICE),
                            transactionItem("Payment Out",LineIcons.indianRupeeSign,primaryColor,AppRoutes.APP_PAYMENT),
                            transactionItem("Purchase Return",Icons.shopping_cart_rounded,primaryColor,AppRoutes.APP_INVOICE),
                            transactionItem("Purchase Order",Icons.event_note_sharp,primaryColor,AppRoutes.APP_INVOICE),
                          ],
                        ),
                      ),
                      const Divider(),
                      const Label(
                        padding: [15,10],
                        label: "Other Transactions",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                      Box(
                        height: 100,
                        expanded: true,
                        child: GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 4,
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 1.5,
                          children: [
                            transactionItem("Expense",Icons.account_balance_wallet_rounded,Colors.red,AppRoutes.APP_EXPENSE),
                          ],
                        ),
                      ),
                    ],
                  ),
            )
    );
  }

  Widget transactionItem(String text, IconData icon,Color color,String page){
    return InkWell(
      onTap: (){
        AppRoutes.CURRENT_PATH=text;
        App().setNavigation(context, page);
      },
      child: Column(
        children: [
          Box(
            margin: const [0,5],
            radius:round,
            bgColor: color.withOpacity(0.2),
            padding: const [12],
            child:Icon(icon,size: 20,color: color,)
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: textColor1,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
