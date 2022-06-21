import 'package:components/components.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im/app/app.dart';
import 'package:im/view_models/item_view_model.dart';
import 'package:im/widgets/button/bottom_button.dart';
import 'package:im/widgets/input/tags_radio.dart';
import 'package:im/widgets/view/accordian.dart';
import 'package:im/widgets/view/accordian_switch.dart';
import 'package:line_icons/line_icons.dart';

class ItemEditScreen extends StatefulWidget {
  const ItemEditScreen({Key? key}) : super(key: key);


  @override
  _ItemEditScreenState createState() => _ItemEditScreenState();
}

class _ItemEditScreenState extends State<ItemEditScreen> {

  String? selectedDate;
  var isProduct = true;

  late ItemViewModel viewModel;

  @override
  void initState() {
    viewModel = ItemViewModel(App());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarTypes.appBarBack(
            onPressed: ()=>App().setBackNavigation(context),
            title: "Edit Item"),
        body: BottomButton(
          child: Box(
            padding: const [0,0,0,50],
            child: body(),
          ),
          btnText: "save",
          onPressed: (){

          },
        )
    );
  }

  Widget body(){
    return ListView(
      children: [
        const Label(
          label: 'item_name_imp',
          mainAxisAlignment: mainStart,
          bgColor: white,
          padding: [15,10],
          fontWeight: FontWeight.w600,
          color: promptColor,
          fontSize: 14,
        ),
        const TextInput(
          padding: [15,15,0,10],
          isFilled:false,
          radius: blunt,
          textHeight: 1.5,
          bgColor: white,
          enabledBorderColor: borderColor,
          focusedBorderColor: borderColor,
          contentPadding: [12,12],
          labelColor: promptColor,
          fontWeight: FontWeight.w600,
          color: textColor,
          fontSize: 16,
        ),
        const Label(
          label: 'Item Type',
          mainAxisAlignment: mainStart,
          bgColor: white,
          padding: [15,10],
          fontWeight: FontWeight.w600,
          color: promptColor,
          fontSize: 14,
        ),
        Box(
          padding: const [15,0,0,15],
          bgColor: white,
          child: TagsRadio(
            tags: const ["product","service"],
            selected: (val){
              setState(() {
                isProduct = val.toLowerCase()=="product";
              });
            },
          ),
        ),
        isProduct ? product() :service()
      ],
    );
  }

  Widget service(){
    return DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const Box(
              child: TabBar(
                indicatorColor: primaryColor,
                labelColor: primaryColor,
                unselectedLabelColor: promptColor,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
                tabs: [
                  Tab(text: "Pricing",),
                  Tab(text: "Other",),
                ],
              ),
              decoration: BoxDecoration(
                  color: white,
                  border: Border(
                      bottom: BorderSide(width: 1,color: borderColor),
                      top: BorderSide(width: 1,color: borderColor)
                  )
              ),
            ),
            Box(
              bgColor: white,
              child: TabBarView(
                children: [
                  servicePricing(),
                  productOthers()
                ],
              ),
              height: 600,
            )
          ],
        )
    );
  }

  Widget servicePricing(){
    return Column(
      crossAxisAlignment: crossStart,
      mainAxisSize: min,
      children: [
        const Label(
          label: 'Sales Price',
          mainAxisAlignment: mainStart,
          bgColor: white,
          padding: [15,10],
          fontWeight: FontWeight.w600,
          color: promptColor,
          fontSize: 14,
        ),
        Box(
          margin: const [15,0],
          child:  Row(
            crossAxisAlignment: crossStart,
            children: [
              Expanded(
                child: TextInput(
                  isFilled:false,
                  radius: blunt,
                  textHeight: 1.5,
                  bgColor: white,
                  enabledBorderColor: borderColor,
                  focusedBorderColor: borderColor,
                  contentPadding: const [12],
                  labelColor: promptColor,
                  prefixIcon: LineIcons.indianRupeeSign,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                  suffixText: InkWell(
                      child: Label(
                        label: viewModel.selectedUnit,
                        suffix: const Icon(Icons.arrow_drop_down),
                        mainAxisAlignment: mainStart,
                        bgColor: bgColor,
                        padding: const [10,12],
                        fontWeight: FontWeight.w600,
                        color: promptColor,
                        fontSize: 14,
                      ),
                      onTap:() {
                        Future.delayed(const Duration(seconds: 0), () {
                          showBottomSheet(context: context);
                        });
                      }
                  ),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        AccordianContainer(
          accordianHeader: "add_gst_details",
          child: Column(
            crossAxisAlignment: crossStart,
            mainAxisSize: MainAxisSize.min,
            children: [
              Box(
                padding: const [15,0,15,15],
                bgColor: white,
                child: TagsRadio(
                  tags: const ["prices_with_tax","prices_without_tax"],
                  selected: (val) {},
                ),
              ),
              ExpandedRow(
                children: [
                  Column(
                    crossAxisAlignment: crossStart,
                    children: const [
                      Label(
                        label: 'HSN',
                        mainAxisAlignment: mainStart,
                        bgColor: white,
                        padding: [15,10],
                        fontWeight: FontWeight.w600,
                        color: promptColor,
                        fontSize: 14,
                      ),
                      TextInput(
                        padding: [15,15,0,10],
                        isFilled:false,
                        radius: blunt,
                        textHeight: 1.5,
                        bgColor: white,
                        enabledBorderColor: borderColor,
                        focusedBorderColor: borderColor,
                        contentPadding: [12,12],
                        labelColor: promptColor,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                        fontSize: 16,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: crossStart,
                    children: const [
                      Label(
                        label: 'GST',
                        mainAxisAlignment: mainStart,
                        bgColor: white,
                        padding: [15,10],
                        fontWeight: FontWeight.w600,
                        color: promptColor,
                        fontSize: 14,
                      ),
                      TextInput(
                        padding: [15,15,0,10],
                        isFilled:false,
                        radius: blunt,
                        textHeight: 1.5,
                        bgColor: white,
                        enabledBorderColor: borderColor,
                        focusedBorderColor: borderColor,
                        contentPadding: [12,12],
                        labelColor: promptColor,
                        suffixIcon: CupertinoIcons.percent,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                        fontSize: 16,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget product(){
    return DefaultTabController(
        length: 3,
        child: Column(
          children: [
            const Box(
              child: TabBar(
                indicatorColor: primaryColor,
                labelColor: primaryColor,
                unselectedLabelColor: promptColor,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
                tabs: [
                  Tab(text: "Pricing",),
                  Tab(text: "Stock",),
                  Tab(text: "Other",),
                ],
              ),
              decoration: BoxDecoration(
                  color: white,
                  border: Border(
                      bottom: BorderSide(width: 1,color: borderColor),
                      top: BorderSide(width: 1,color: borderColor)
                  )
              ),
            ),
            Box(
              bgColor: white,
              child: TabBarView(
                children: [
                  pricing(),
                  stock(),
                  productOthers()
                ],
              ),
              height: 600,
            )
          ],
        )
    );
  }

  Widget productOthers(){
    return  Column(
      crossAxisAlignment: crossStart,
      children: const [
        Label(
          label: 'Add Remark',
          mainAxisAlignment: mainStart,
          bgColor: white,
          padding: [15,10],
          fontWeight: FontWeight.w600,
          color: promptColor,
          fontSize: 14,
        ),
        TextInput(
          padding: [15,0],
          isFilled:false,
          radius: blunt,
          textHeight: 1.5,
          bgColor: white,
          enabledBorderColor: borderColor,
          focusedBorderColor: borderColor,
          contentPadding: [12,12],
          labelColor: promptColor,
          fontWeight: FontWeight.w600,
          color: textColor,
          fontSize: 16,
        ),
      ],
    );
  }

  Widget stock(){
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        ExpandedRow(
          children: [
            Column(
              crossAxisAlignment: crossStart,
              children: const [
                Label(
                  label: 'Opening Stock',
                  mainAxisAlignment: mainStart,
                  bgColor: white,
                  padding: [15,10],
                  fontWeight: FontWeight.w600,
                  color: promptColor,
                  fontSize: 14,
                ),
                TextInput(
                  padding: [15,15,0,10],
                  isFilled:false,
                  radius: blunt,
                  textHeight: 1.5,
                  bgColor: white,
                  enabledBorderColor: borderColor,
                  focusedBorderColor: borderColor,
                  contentPadding: [12,12],
                  labelColor: promptColor,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                  fontSize: 16,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: crossStart,
              children: [
                const Label(
                  label: 'As Of Date',
                  mainAxisAlignment: mainStart,
                  bgColor: white,
                  padding: [15,10],
                  fontWeight: FontWeight.w600,
                  color: promptColor,
                  fontSize: 14,
                ),
                InkWell(
                  child: Box(
                    height: 50,
                    margin: const [15,15,0,10],
                    radius: blunt,
                    padding: const [10,0],
                    borderColor: borderColor,
                    child: Label(
                      expanded: true,
                      mainAxisAlignment: mainStart,
                      label: selectedDate??"",
                      fontWeight: FontWeight.w600,
                      color: textColor,
                      fontSize: 16,
                    ),
                  ),
                  onTap: () async{
                    var date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 1000)),
                    );
                    if(date!= null) {
                      selectedDate = DateFormat("dd MMM yyyy").format(date);
                      setState(() {});
                    }
                  },
                )
              ],
            )
          ],
        ),
        AccordianSwicth(
          accordianHeader: 'Add Low Stock Warning',
          child: Box(
            padding: const [15,10],
            bgColor: white,
            child: Column(
              mainAxisSize: min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Label(
                      label: 'Low Stock Quantity',
                      mainAxisAlignment: mainStart,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                      fontSize: 14,
                    ),
                    TextInput(
                      width: 140,
                      isFilled:false,
                      radius: blunt,
                      textHeight: 1.5,
                      suffixText: Box(width: 30,bgColor: borderColor,),
                      bgColor: white,
                      enabledBorderColor: borderColor,
                      focusedBorderColor: borderColor,
                      contentPadding: [12,12],
                      labelColor: promptColor,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                      fontSize: 16,
                    ),
                  ],
                ),
                const Label(
                  label: "You will be notified when stock goes below",
                  mainAxisAlignment: mainStart,
                  padding: [15,20],
                  fontWeight: FontWeight.w500,
                  color: promptColor,
                  fontSize: 14,
                ),
              ],
            ),
          ),
        ),
        const Label(
          label: 'Item Code',
          mainAxisAlignment: mainStart,
          bgColor: white,
          padding: [15,10],
          fontWeight: FontWeight.w600,
          color: promptColor,
          fontSize: 14,
        ),
        const TextInput(
          padding: [15,0],
          isFilled:false,
          radius: blunt,
          textHeight: 1.5,
          bgColor: white,
          enabledBorderColor: borderColor,
          focusedBorderColor: borderColor,
          contentPadding: [12,12],
          labelColor: promptColor,
          fontWeight: FontWeight.w600,
          color: textColor,
          fontSize: 16,
        ),
      ],
    );
  }

  Widget pricing(){

    return Column(
      crossAxisAlignment: crossStart,
      mainAxisSize: min,
      children: [
        const Label(
          label: 'Sales Price',
          mainAxisAlignment: mainStart,
          bgColor: white,
          padding: [15,10],
          fontWeight: FontWeight.w600,
          color: promptColor,
          fontSize: 14,
        ),
        Box(
          margin: const [15,0],
          child:  Row(
            crossAxisAlignment: crossStart,
            children: [
              Expanded(
                child: TextInput(
                  isFilled:false,
                  radius: blunt,
                  textHeight: 1.5,
                  bgColor: white,
                  enabledBorderColor: borderColor,
                  focusedBorderColor: borderColor,
                  contentPadding: const [12],
                  labelColor: promptColor,
                  prefixIcon: LineIcons.indianRupeeSign,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                  suffixText: InkWell(
                      child: Label(
                        label: viewModel.selectedUnit,
                        suffix: const Icon(Icons.arrow_drop_down),
                        mainAxisAlignment: mainStart,
                        bgColor: bgColor,
                        padding: const [10,12],
                        fontWeight: FontWeight.w600,
                        color: promptColor,
                        fontSize: 14,
                      ),
                      onTap:() {
                        Future.delayed(const Duration(seconds: 0), () {
                          showBottomSheet(context: context);
                        });
                      }
                  ),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const Label(
          label: 'Purchase Price',
          mainAxisAlignment: mainStart,
          bgColor: white,
          padding: [15,10],
          fontWeight: FontWeight.w600,
          color: promptColor,
          fontSize: 14,
        ),
        TextInput(
          padding: const [15,0],
          isFilled:false,
          radius: blunt,
          textHeight: 1.5,
          bgColor: white,
          enabledBorderColor: borderColor,
          focusedBorderColor: borderColor,
          contentPadding: const [12,12],
          labelColor: promptColor,
          prefixIcon: LineIcons.indianRupeeSign,
          fontWeight: FontWeight.w600,
          color: textColor,
          suffixText: Label(
            label: '/ ${viewModel.selectedUnit}',
            mainAxisAlignment: mainStart,
            padding: const [10,12],
            fontWeight: FontWeight.w600,
            color: promptColor,
            fontSize: 14,
          ),
          fontSize: 16,
        ),
        const Label(
          label: 'MRP',
          mainAxisAlignment: mainStart,
          bgColor: white,
          padding: [15,10],
          fontWeight: FontWeight.w600,
          color: promptColor,
          fontSize: 14,
        ),
        TextInput(
          padding: const [15,0],
          isFilled:false,
          radius: blunt,
          textHeight: 1.5,
          bgColor: white,
          enabledBorderColor: borderColor,
          focusedBorderColor: borderColor,
          contentPadding: const [12,12],
          labelColor: promptColor,
          prefixIcon: LineIcons.indianRupeeSign,
          fontWeight: FontWeight.w600,
          color: textColor,
          suffixText: Label(
            label: '/ ${viewModel.selectedUnit}',
            mainAxisAlignment: mainStart,
            padding: const [10,12],
            fontWeight: FontWeight.w600,
            color: promptColor,
            fontSize: 14,
          ),
          fontSize: 16,
        ),
        ExpandedRow(
          children: [
            Column(
              crossAxisAlignment: crossStart,
              children: [
                const Label(
                  label: 'Wholesale Price',
                  mainAxisAlignment: mainStart,
                  bgColor: white,
                  padding: [15,10],
                  fontWeight: FontWeight.w600,
                  color: promptColor,
                  fontSize: 14,
                ),
                TextInput(
                  padding: const [15,15,0,10],
                  isFilled:false,
                  radius: blunt,
                  textHeight: 1.5,
                  bgColor: white,
                  prefixIcon: LineIcons.indianRupeeSign,
                  enabledBorderColor: borderColor,
                  focusedBorderColor: borderColor,
                  contentPadding: const [12],
                  labelColor: promptColor,
                  fontWeight: FontWeight.w600,
                  suffixText: Label(
                    label: '/ ${viewModel.selectedUnit}',
                    mainAxisAlignment: mainStart,
                    padding: const [10,12],
                    fontWeight: FontWeight.w600,
                    color: promptColor,
                    fontSize: 14,
                  ),
                  color: textColor,
                  fontSize: 16,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: crossStart,
              children: [
                const Label(
                  label: 'Min Wholesale Qty',
                  mainAxisAlignment: mainStart,
                  bgColor: white,
                  padding: [15,10],
                  fontWeight: FontWeight.w600,
                  color: promptColor,
                  fontSize: 14,
                ),
                TextInput(
                  padding: const [15,15,0,10],
                  isFilled:false,
                  radius: blunt,
                  textHeight: 1.5,
                  bgColor: white,
                  enabledBorderColor: borderColor,
                  focusedBorderColor: borderColor,
                  contentPadding: const [12],
                  labelColor: promptColor,
                  suffixText: Label(
                    label: viewModel.selectedUnit,
                    mainAxisAlignment: mainStart,
                    padding: const [10,12],
                    fontWeight: FontWeight.w600,
                    color: promptColor,
                    fontSize: 14,
                  ),
                  fontWeight: FontWeight.w600,
                  color: textColor,
                  fontSize: 16,
                ),
              ],
            )
          ],
        ),
        Box(
          padding: const [15,0,15,15],
          bgColor: white,
          child: TagsRadio(
            tags: const ["prices_with_tax","prices_without_tax"],
            selected: (val) {},
          ),
        ),
        ExpandedRow(
          children: [
            Column(
              crossAxisAlignment: crossStart,
              children: const [
                Label(
                  label: 'HSN',
                  mainAxisAlignment: mainStart,
                  bgColor: white,
                  padding: [15,10],
                  fontWeight: FontWeight.w600,
                  color: promptColor,
                  fontSize: 14,
                ),
                TextInput(
                  padding: [15,15,0,10],
                  isFilled:false,
                  radius: blunt,
                  textHeight: 1.5,
                  bgColor: white,
                  enabledBorderColor: borderColor,
                  focusedBorderColor: borderColor,
                  contentPadding: [12,12],
                  labelColor: promptColor,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                  fontSize: 16,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: crossStart,
              children: const [
                Label(
                  label: 'GST',
                  mainAxisAlignment: mainStart,
                  bgColor: white,
                  padding: [15,10],
                  fontWeight: FontWeight.w600,
                  color: promptColor,
                  fontSize: 14,
                ),
                TextInput(
                  padding: [15,15,0,10],
                  isFilled:false,
                  radius: blunt,
                  textHeight: 1.5,
                  bgColor: white,
                  enabledBorderColor: borderColor,
                  focusedBorderColor: borderColor,
                  contentPadding: [12,12],
                  labelColor: promptColor,
                  suffixIcon: CupertinoIcons.percent,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                  fontSize: 16,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  showBottomSheet({required BuildContext context}){
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        shape: const RoundedRectangleBorder(
            borderRadius:
            BorderRadius.vertical(top: Radius.circular(16))),
        builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.75,
          minChildSize: 0.5,
          maxChildSize: 0.75,
          expand: false,
          builder: (_, controller) => Column(
            children: [
              Box(
                child: Row(
                  mainAxisAlignment: mainSpace,
                  children: [
                    const Label(
                      label: "Measuring Unit",
                      textMargin: [10,0],
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      padding: [15,15,15,20],
                    ),
                    IconButton(
                      icon: const Icon(Icons.clear,color: iconColor,),
                      onPressed: ()=> Navigator.pop(context),
                      splashRadius: 20,
                    )
                  ],
                ),
                padding: const [0,0,10,5],
              ),
              const Divider(color: borderColor,),
              Expanded(
                child: ListView.builder(
                  controller: controller,
                  itemCount: viewModel.units.keys.length,
                  itemBuilder: (_, index) {
                    return InkWell(
                      child: Box(
                          padding: const [0,5],
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: mainSpace,
                                children: [
                                  Label(
                                    label: viewModel.units.keys.elementAt(index),
                                    textMargin: const [10,0],
                                    mainAxisAlignment: mainStart,
                                    fontSize: 16,
                                    color: textColor,
                                    fontWeight: FontWeight.w600,
                                    padding: const [15,0],
                                  ),
                                  Label(
                                    label: viewModel.units.values.elementAt(index),
                                    textMargin: const [10,0],
                                    mainAxisAlignment: mainStart,
                                    fontSize: 16,
                                    color: textColor1,
                                    fontWeight: FontWeight.w600,
                                    padding: const [15,0],
                                  ),
                                ],
                              ),
                              const Divider()
                            ],
                          )
                      ),
                      onTap: (){
                        setState(() {
                          viewModel.selectedUnit = viewModel.units.values.elementAt(index);
                        });
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        )
    );
  }
}
