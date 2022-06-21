import 'package:components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im/app/app.dart';
import 'package:im/app/app_routes.dart';
import 'package:im/view_models/invoice_view_model.dart';
import 'package:im/widgets/button/bottom_button.dart';
import 'package:im/widgets/input/tags_radio.dart';
import 'package:im/widgets/view/accordian_swap.dart';
import 'package:im/widgets/view/charge_field.dart';

class Invoice extends StatefulWidget {
  const Invoice({Key? key}) : super(key: key);


  @override
  _InvoiceState createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {


  bool additionalCharge = false;
  bool discount = false;
  bool roundOff = false;
  bool notes = false;
  final List<dynamic> _searchResult = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarTypes.appBarBack(
          onPressed: ()=>App().setBackNavigation(context),
          title: AppRoutes.CURRENT_PATH,
          children: [
            IconButton(
                onPressed: ()=>App().setNavigation(context, AppRoutes.APP_INVOICE_SETTINGS),
                icon: const Icon(Icons.settings)
            )
          ],
        ),
        body: BottomButton(
          child: Box(
            padding: const [0,0,0,50],
            child: body(),
          ),
          btnText: "Generate Bill",
          onPressed: (){

          },
        )
    );
  }

  Widget body(){
    return ListView(
      children: [
        Box(
          padding: const [5],
          bgColor: white,
          child: Row(
            children: [
              Expanded(
                  child: Column(
                    crossAxisAlignment: crossStart,
                    children: const [
                      Label(
                        bgColor: white,
                        fontWeight: FontWeight.w400,
                        color: primaryColor,
                        padding: [15,5],
                        fontSize: 12,
                        mainAxisAlignment: mainStart,
                        textAlign: start,
                        label: "Invoice # 1",
                      ),
                      Label(
                        bgColor: white,
                        fontWeight: FontWeight.w400,
                        color: textColor,
                        padding: [15,5],
                        fontSize: 12,
                        mainAxisAlignment: mainStart,
                        textAlign: start,
                        label: "13 Oct 2021",
                      ),
                    ],
                  )
              ),
              PrimaryButton(
                buttonColor: white,
                label: "edit",
                type: 1,
                margin: const [15,0],
                color: textColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
                width: 50,
                onPressed: (){},
              )
            ],
          ),
        ),
        const Label(
          height: 50,
          bgColor: white,
          margin: [0,0,10,0],
          fontWeight: FontWeight.w600,
          color: textColor,
          padding: [15,15,20,10],
          fontSize: 14,
          mainAxisAlignment: mainStart,
          textAlign: start,
          label: "Party Name *",
        ),
        TextInput(
          padding: const [15,15,0,10],
          isFilled:false,
          radius: blunt,
          hintText: "Enter Party Name",
          textHeight: 1.5,
          onChanged: onSearchTextChanged,
          enabledBorderColor: borderColor,
          focusedBorderColor: borderColor,
          fontWeight: FontWeight.w600,
          contentPadding: const [12],
          prefixIconSize: 22,
          prefixIconColor: iconColor,
          color: textColor,
          fontSize: 14,
          prefixIcon: Icons.person,
        ),
        Box(
          constraints: const BoxConstraints(
              maxHeight: 420
          ),
          padding: const [0,5],
          child: ListView.builder(
              itemCount: _searchResult.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context,index){
                return ListTile(
                  shape: const Border(
                      bottom: BorderSide(
                          width: 1,
                          color: AppColors.WHITE_3
                      )
                  ),
                  title: Label(
                    label: _searchResult[index].displayName,
                    mainAxisAlignment: MainAxisAlignment.start,
                    fontFamily: AppFont.FONT,
                    fontWeight: FontWeight.w600,
                    color: AppColors.TEXT_COLOR,
                    fontSize: AppDimen.TEXT_SMALL,
                  ),
                  subtitle: Label(
                    label: _searchResult[index].phones[0].value,
                    mainAxisAlignment: MainAxisAlignment.start,
                    fontFamily: AppFont.FONT,
                    fontWeight: FontWeight.w600,
                    color: AppColors.GRAY_2,
                    fontSize: AppDimen.TEXT_SMALLEST,
                  ),
                  onTap: () {
                  },
                );
              }
          ),
        ),
        const Label(
          height: 50,
          bgColor: white,
          fontWeight: FontWeight.w600,
          color: textColor,
          padding: [15,15,20,10],
          fontSize: 14,
          mainAxisAlignment: mainStart,
          textAlign: start,
          label: "ITEMS",
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
        AccordianSwap(
          accordianHeader: "additional_charges",
          isSwap: additionalCharge,
          onClick: (){
            setState(() {
              additionalCharge = true;
            });
          },
          child: Container(
            color: AppColors.WHITE,
            child:Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Label(
                      height: 50,
                      bgColor: white,
                      padding: [20,0],
                      fontWeight: FontWeight.w600,
                      color: textColor,
                      fontSize: 14,
                      textAlign: start,
                      label: "Add Additional Charges",
                    ),
                    IconButton(
                        icon: const Icon(Icons.add,color: textColor,),
                        onPressed: (){
                          InvoiceViewModel.additionalItemsList.insert(0, "null");
                          InvoiceViewModel.additionalAmountList.insert(0, "null");
                          setState(() {});
                        }
                    )
                  ],
                ),
                ..._getAdditionalCharges(),
              ],
            ),
          ),
        ),
        AccordianSwap(
          accordianHeader: "Discount",
          isSwap: discount,
          onClick: (){
            setState(() {
              discount = true;
            });
          },
          child: ChargeField(
            isCloseable: true,
            addInput: false,
            child: Row(
              mainAxisAlignment: mainSpace,
              children: [
                const Label(
                  height: 50,
                  bgColor: white,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                  fontSize: 14,
                  textAlign: start,
                  label: "Discount",
                ),
                Box(
                  width: 80,
                  margin: const [10,0],
                  bottomBorder: true,
                  child: Row(
                    mainAxisAlignment: mainSpace,
                    children: const [
                      Label(label: "%",fontWeight: FontWeight.w400,color: promptColor,),
                      TextInput(
                        fontSize: 14,
                        width: 60,
                        textAlign: end,
                        textHeight: 1.2,
                        height: 30,
                        hintText: "00.00",
                        hintColor: promptColor,
                        contentPadding: [0,5],
                        isFilled: false,
                        noBorder: true,
                        fontWeight: FontWeight.w500,
                        enabledBorderColor: borderColor,
                        focusedBorderColor: borderColor,
                        radius: blunt,
                        textAlignVertical: TextAlignVertical.top,
                      )
                    ],
                  ),
                ),
              ],
            ),
            onClick: (){
              setState(() {
                discount = false;
              });
            },
          ),
        ),
        AccordianSwap(
          accordianHeader: "round_off",
          isSwap: roundOff,
          onClick: (){
            setState(() {
              roundOff = true;
            });
          },
          child: ChargeField(
            isCloseable: true,
            addInput: false,
            child: Row(
              mainAxisAlignment: mainSpace,
              children: [
                const Label(
                  height: 50,
                  bgColor: white,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                  fontSize: 14,
                  textAlign: start,
                  label: "Round Off",
                ),
                TagsRadio(tags: const ["-","+"],selected: (val){},)
              ],
            ),
            onClick: (){
              setState(() {
                roundOff = false;
              });
            },
          ),
        ),
        ChargeField(
          isAmountLabel: true,
          isCloseable: false,
          margin: const [0,10],
          addInput: false,
          onClick: () {  },
          child: const Label(
            height: 50,
            padding: [20,0],
            bgColor: white,
            fontWeight: FontWeight.w600,
            color: textColor,
            fontSize: 14,
            label: "Total Amount",
            mainAxisAlignment: mainStart,
          ),
        ),
        AccordianSwap(
            accordianHeader: "Notes",
            child: Row(
              children: [
                SizedBox(
                    width: 40,
                    child: IconButton(
                        onPressed: (){
                          setState(() {
                            notes = false;
                          });
                        },
                        icon: const Icon(Icons.cancel,size: 20,color: iconColor,)
                    ),
                ),
                const Expanded(
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
                )
              ],
            ),
          onClick: (){
            setState(() {
              notes = true;
            });
          },
          isSwap: notes,
        ),
      ],
    );
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    for (var item in InvoiceViewModel.contactsList) {
      if (item.contains(text) || item.contains(text)) {
        _searchResult.add(item);
      }
    }
    setState(() {});
  }

  List<Widget> _getAdditionalCharges(){
    List<Widget> additionalCharges = [];
    for(int i=0; i<InvoiceViewModel.additionalItemsList.length; i++){
      additionalCharges.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                    child: AdditionalChargeItem(
                      index: i,
                      onClick: () {
                          if (1 == InvoiceViewModel.additionalItemsList.length) {
                            additionalCharge = false;
                            setState(() {});
                          }
                          else {
                            InvoiceViewModel.additionalItemsList.removeAt(i);
                            InvoiceViewModel.additionalAmountList.removeAt(i);
                          }
                          setState(() {});
                        },
                    )),
              ],
            ),
          )
      );
    }
    return additionalCharges;
  }

}

class AdditionalChargeItem extends StatefulWidget {
  final int index;
  final VoidCallback onClick;
  const AdditionalChargeItem({
    Key? key,
    required this.index,
    required this.onClick
  }):super(key:key);

  @override
  _AdditionalChargeItemState createState() => _AdditionalChargeItemState();
}

class _AdditionalChargeItemState extends State<AdditionalChargeItem> {

  late TextEditingController _nameController;
  late TextEditingController _amountController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _amountController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _nameController.text = InvoiceViewModel.additionalItemsList[widget.index];
      _amountController.text = InvoiceViewModel.additionalItemsList[widget.index];
    });

    return ChargeField(
      onClick: widget.onClick,
    );
  }
}

