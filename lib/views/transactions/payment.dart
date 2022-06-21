import 'package:components/components.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:im/app/app.dart';
import 'package:im/app/app_routes.dart';
import 'package:im/view_models/payment_view_model.dart';
import 'package:im/widgets/button/bottom_button.dart';
import 'package:im/widgets/input/drop_down_search.dart';
import 'package:im/widgets/input/tags_radio.dart';
import 'package:im/widgets/view/accordian.dart';
import 'package:line_icons/line_icons.dart';
import 'package:permission_handler/permission_handler.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {

  bool isFocus = false;
  late PaymentViewModel viewModel;
  late List<Contact> contacts;

  @override
  void initState() {
    viewModel = PaymentViewModel(App());
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
            title: AppRoutes.CURRENT_PATH=="Received Payment"?"Received Payment":"Record Payment Out"
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
        DropDownSearch(
          onClick: (val){
            viewModel.partyNameController.text = val.displayName;
            viewModel.phoneNumberController.text = val.phones[0].value;
          },
          isFocus:isFocus,
          searchList: contacts,
          controller: viewModel.partyNameController,
        ),
        TextInput(
          labelText: "contact_number",
          isClassic: true,
          bgColor: white,
          padding: const [15,15,5,10],
          controller: viewModel.phoneNumberController,
          fontWeight: FontWeight.w600,
          contentPadding: const [0,0,0,10],
          color: textColor,
          labelColor: textColor1,
          fontSize: 16,
        ),
        const Label(
          padding: [15,15,30,0],
          bgColor: white,
          fontWeight: FontWeight.w600,
          color: textColor,
          fontSize: 14,
          label: "AMOUNT*",
          mainAxisAlignment: mainStart,
        ),
        const TextInput(
          padding: [15,20],
          fontSize: 16,
          prefixIcon: LineIcons.indianRupeeSign,
          hintColor: promptColor,
          textHeight: 1,
          isFilled: false,
          enabledBorderColor: borderColor,
          focusedBorderColor: borderColor,
          radius: blunt,
          textAlignVertical: TextAlignVertical.top,
        ),
        const Label(
          padding: [15,15,30,0],
          bgColor: white,
          fontWeight: FontWeight.w600,
          color: textColor,
          fontSize: 14,
          label: "PAYMENT MODE",
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
        const Divider(height:1)
      ],
    );
  }
}
