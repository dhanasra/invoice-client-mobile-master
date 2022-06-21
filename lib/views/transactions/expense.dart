import 'package:components/components.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:im/app/app.dart';
import 'package:im/view_models/expense_view_model.dart';
import 'package:im/widgets/button/bottom_button.dart';
import 'package:im/widgets/input/tags_radio.dart';
import 'package:im/widgets/view/accordian.dart';
import 'package:permission_handler/permission_handler.dart';

class Expense extends StatefulWidget {
  const Expense({Key? key}) : super(key: key);

  @override
  _ExpenseState createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {

  bool isFocus = false;
  late ExpenseViewModel viewModel;
  late List<Contact> contacts;

  @override
  void initState() {
    viewModel = ExpenseViewModel(App());
    super.initState();
    contacts = [];
    WidgetsBinding.instance?.addPostFrameCallback((_) async{
      if (await Permission.contacts.request().isGranted) {
        contacts = await ContactsService.getContacts();
        viewModel.splashLoad.sink.add("added");
        isFocus = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarTypes.appBarBack(
            onPressed: ()=>App().setBackNavigation(context),
            title: "Record Expense"
        ),
        body: BottomButton(
          child: Box(
            padding: const [0,0,0,50],
            child: body(contacts),
          ),
          btnText: "save",
          onPressed: (){

          },
        )
    );
  }

  Widget body(List<Contact> contacts){
    return ListView(
      children: [
        const Label(
          padding: [15,15,30,0],
          bgColor: white,
          fontWeight: FontWeight.w600,
          color: textColor,
          fontSize: 14,
          label: "Expense Category",
          mainAxisAlignment: mainStart,
        ),
        PrimaryButton(
          margin: const [15,20],
          type: 1,
          fontWeight: FontWeight.w500,
          color: textColor,
          fontSize: 14,
          buttonColor: primaryColor.withOpacity(0.1),
          label: "Add Expense Category",
          onPressed: (){},
        ),
        const Divider(height:1),
        const Label(
          padding: [15,15,30,0],
          bgColor: white,
          fontWeight: FontWeight.w600,
          color: textColor,
          fontSize: 14,
          label: "Add Item",
          mainAxisAlignment: mainStart,
        ),
        PrimaryButton(
          margin: const [15,20],
          type: 1,
          fontWeight: FontWeight.w500,
          color: textColor,
          fontSize: 14,
          buttonColor: primaryColor.withOpacity(0.1),
          label: "Add Item",
          onPressed: (){},
        ),
        const Divider(height:1),
        const Label(
          padding: [15,15,30,0],
          bgColor: white,
          fontWeight: FontWeight.w600,
          color: textColor,
          fontSize: 14,
          label: "Payment Mode",
          mainAxisAlignment: mainStart,
        ),
        Box(
          bgColor: white,
          padding: const [15,15,20,10],
          child: TagsRadio(
            radius: round,
            tags: const ["Cash","Cheque","Online"],
            selected: (val) {  },
          ),
          margin: const [0,0,0,5],
        ),
        const AccordianContainer(
            accordianHeader: "ADD NOTE/DESCRIPTION",
            child: TextInput(
              margin: [15,20],
              fontSize: 16,
              hintText: "Type your notes here",
              hintColor: promptColor,
              textHeight: 1,
              isFilled: false,
              enabledBorderColor: borderColor,
              focusedBorderColor: borderColor,
              radius: blunt,
              textAlignVertical: TextAlignVertical.top,
            )
        ),
        const Divider(height:1),
        Box(
          bgColor: white,
          padding: const [15,20],
          child: Row(
            mainAxisAlignment: mainSpace,
            crossAxisAlignment: crossCenter,
            children:[
              const Label(
                bgColor: white,
                fontWeight: FontWeight.w600,
                color: textColor,
                fontSize: 18,
                label: "Total",
                mainAxisAlignment: mainStart,
              ),
              Box(
                width: 120,
                alignment: left,
                bottomBorder: true,
                padding: const [0,0,0,5],
                child:  Label(
                  bgColor: white,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                  fontSize: 16,
                  label: Global.getMoneySymbol("IN")+"",
                  mainAxisAlignment: mainStart,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
