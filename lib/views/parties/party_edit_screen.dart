import 'package:components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im/app/app.dart';
import 'package:im/view_models/party_view_model.dart';
import 'package:im/widgets/button/bottom_button.dart';
import 'package:im/widgets/input/drop_down_search.dart';
import 'package:im/widgets/input/tags_radio.dart';
import 'package:im/widgets/view/accordian.dart';
import 'package:line_icons/line_icons.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

class PartyEditScreen extends StatefulWidget {
  const PartyEditScreen({Key? key}) : super(key: key);

  @override
  _PartyEditScreenState createState() => _PartyEditScreenState();
}

class _PartyEditScreenState extends State<PartyEditScreen> {
  bool isFocus = false;
  late PartyViewModel viewModel;
  late List<Contact> contacts;

  @override
  void initState() {
    viewModel = PartyViewModel(App());
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
            title: "Edit Party"
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
          label: "party_type_imp",
          mainAxisAlignment: mainStart,
        ),
        Box(
          bgColor: white,
          padding: const [15,15,20,10],
          child: TagsRadio(
            radius: round,
            tags: const ["customer","supplier"],
            selected: (val) {  },
          ),
          margin: const [0,0,0,5],
        ),
        const AccordianContainer(
            accordianHeader: "gst_details",
            child: TextInput(
              margin: [15,20],
              fontSize: 16,
              labelText: "gstin",
              labelColor: promptColor,
              textHeight: 1,
              isFilled: false,
              enabledBorderColor: borderColor,
              focusedBorderColor: borderColor,
              radius: blunt,
              textAlignVertical: TextAlignVertical.top,
            )
        ),
        AccordianContainer(
            accordianHeader: "address_details",
            child: Box(
              margin: const [15,20],
              child: Column(
                mainAxisSize: min,
                children: const [
                  Label(
                    label: 'billing_address',
                    mainAxisAlignment: mainStart,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                    expanded: true,
                    fontSize: 14,
                  ),
                  TextInput(
                    height: 130,
                    margin: [0,0,10,0],
                    maxLine: 5,
                    fontSize: 16,
                    textHeight: 1,
                    isExpands: true,
                    isFilled: false,
                    enabledBorderColor: borderColor,
                    focusedBorderColor: borderColor,
                    radius: blunt,
                    textAlignVertical: TextAlignVertical.top,
                  )
                ],
              ),
            )
        ),
        AccordianContainer(
            accordianHeader: "balance_details",
            child: Box(
              margin: const [15,20],
              child: Column(
                mainAxisSize: min,
                children: [
                  const Label(
                    label: 'Opening Balance',
                    mainAxisAlignment: mainStart,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                    expanded: true,
                    fontSize: 14,
                  ),
                  Box(
                    margin: const [0,0,10,0],
                    borderColor: borderColor,
                    radius: blunt,
                    child: Row(
                      mainAxisAlignment: mainEnd,
                      children: [
                        const Expanded(
                          child: TextInput(
                            height: 50,
                            prefixIconSize: 20,
                            margin: [0,0,0,0],
                            fontSize: 16,
                            color: textColor,
                            prefixIcon: LineIcons.indianRupeeSign,
                            noBorder: true,
                            textHeight: 1.5,
                            contentPadding: [0,0,11,0],
                            textAlign: start,
                            hintText: "00.00",
                            isFilled: false,
                            enabledBorderColor: borderColor,
                            focusedBorderColor: borderColor,
                            radius: blunt,
                          ),
                        ),
                        TagsRadio(
                          tags: const ["receive","pay"],
                          selected: (val){},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
        ),
        const Divider(height:1)
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
