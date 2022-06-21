import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:im/app/app.dart';
import 'package:im/app/app_routes.dart';
import 'package:im/bloc/network_bloc.dart';
import 'package:im/bloc/network_state.dart';
import 'package:im/view_models/authentication_view_model.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({Key? key}) : super(key: key);

  @override
  _NameScreenState createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  late AuthenticationViewModel viewModel;
  late NetworkBloc bloc;
  late bool nameLoading;

  @override
  void initState() {
    viewModel = AuthenticationViewModel(App());
    bloc = NetworkBloc(Init());
    nameLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: BlocBuilder(
            bloc: bloc,
            builder: (context,state){
              if(state is Loading ){
                viewModel.buttonLoadingStream.add("name_loading");
              }else if(state is Success) {
                viewModel.buttonLoadingStream.add("name_complete");
                App().setNavigation(context, AppRoutes.APP_EXPLORE);
              }else if(state is Failed) {
                viewModel.buttonLoadingStream.add("name_complete");
                Utils.showSnackBar(context: context, message: "Sorry, Something went wrong. Try again.");
              }

              return Box(
                padding: const [15, 15, 0, 15],
                expanded: true,
                bgColor: white,
                child: StreamBuilder(
                  stream: viewModel.buttonLoadingStream.stream,
                  builder: (context,snapshot){
                    nameLoading = snapshot.data=='name_loading';
                    return buildView();
                  },
                ),
              );
            },
          )
        )
    );
  }

  Widget buildView(){
    return Column(
      children: [
        Content(
          margin: const [0,0,50,0],
          text: "Welcome to your account!",
          color: primaryColor,
          fontWeight: FontWeight.w600,
          fontSize: 18,
          fontFamily: GoogleFonts.openSans().fontFamily,
          expanded: true,
          textAlign: start,
        ),
        Content(
          margin: const [0,0,0,10],
          text: "Just one step to get into the work",
          color: textColor1,
          fontWeight: FontWeight.w600,
          fontSize: 12,
          fontFamily: GoogleFonts.openSans().fontFamily,
          expanded: true,
          textAlign: start,
        ),
        TextInput(
          margin: const [0,10],
          hintText: "Name",
          bgColor: white,
          controller: viewModel.nameController,
          prefixIcon: Icons.person,
          prefixIconColor: btnColor,
          autoFocus: true,
          focusedBorderColor: borderColor,
          fontFamily: GoogleFonts.openSans().fontFamily,
          enabledBorderColor: borderColor,
          fontWeight: FontWeight.w600,
          inputType: TextInputType.text,
          color: textColor,
          labelColor: textColor1,
          fontSize: 16,
        ),
        TextInput(
          margin: const [0,0,0,10],
          hintText: "Business Name",
          bgColor: white,
          controller: viewModel.businessNameController,
          prefixIcon: Icons.work,
          prefixIconColor: btnColor,
          autoFocus: true,
          focusedBorderColor: borderColor,
          fontFamily: GoogleFonts.openSans().fontFamily,
          enabledBorderColor: borderColor,
          fontWeight: FontWeight.w600,
          inputType: TextInputType.text,
          color: textColor,
          labelColor: textColor1,
          fontSize: 16,
        ),
        InkWell(
          child: TextInput(
            hintText: "Select Category",
            bgColor: white,
            controller: viewModel.categoryController,
            prefixIcon: Icons.category,
            prefixIconColor: btnColor,
            autoFocus: true,
            focusedBorderColor: borderColor,
            fontFamily: GoogleFonts.openSans().fontFamily,
            enabledBorderColor: borderColor,
            fontWeight: FontWeight.w600,
            inputType: TextInputType.text,
            color: textColor,
            labelColor: textColor1,
            fontSize: 16,
            isEnabled: false,
          ),
          onTap: (){
            Future.delayed(const Duration(seconds: 0),(){
              showCategories(context);
            });
          }
        ),
        PrimaryButton(
          margin: const [0,0,40,20],
          expanded: true,
          type: 1,
          fontSize: 14,
          isLoading: nameLoading,
          fontWeight: FontWeight.w600,
          fontFamily: GoogleFonts.openSans().fontFamily,
          height: btnHeight2,
          label: "Finish",
          onPressed: ()async{
            if(viewModel.validateNameScreen(context)) {
              viewModel.createUser(bloc);
            }
          },
        ),
      ],
    );
  }

  showCategories(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: false,
        enableDrag: false,
        shape: const RoundedRectangleBorder(
            borderRadius:
            BorderRadius.vertical(top: Radius.circular(16))),
        builder: (context) => categoriesWidget()
    );
  }
  
  Widget categoriesWidget() {
    return SafeArea(child: Box(
        margin: const [15, 0],
        child: Column(
          children: [
            Content(
              text: "Select Category",
              fontSize: 18,
              fontFamily: GoogleFonts.openSans().fontFamily,
              color: textColor,
              textAlign: start,
              margin: const [0,0,40,20],
              expanded: true,
            ),
            Expanded(child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                  color: borderColor,
                ),
                itemCount: viewModel.categories.length,
                itemBuilder: (BuildContext context,int index){
                  return ListTile(
                    contentPadding: const EdgeInsets.only(left: 10,right: 10),
                    title: Content(
                      text: viewModel.categories[index],
                      fontSize: 16,
                      fontFamily: GoogleFonts.openSans().fontFamily,
                      color: textColor1,
                      expanded: true,
                      textAlign: start,
                    ),
                    onTap: (){
                      viewModel.categoryController.text = viewModel.categories[index];
                      Navigator.pop(context);
                    },
                  );
                }))
          ],
        )
      )
    );
  }
}
