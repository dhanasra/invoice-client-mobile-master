import 'package:components/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:im/app/app.dart';
import 'package:im/app/app_routes.dart';
import 'package:im/bloc/network_bloc.dart';
import 'package:im/bloc/network_state.dart';
import 'package:im/view_models/authentication_view_model.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  _PhoneNumberScreenState createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  late AuthenticationViewModel viewModel;
  late TextEditingController pinPutController;
  late NetworkBloc bloc;
  late bool phoneNumberLoading;
  late bool googleLoading;

  @override
  void initState() {
    viewModel = AuthenticationViewModel(App());
    pinPutController = TextEditingController();
    bloc = NetworkBloc(Init());
    phoneNumberLoading = false;
    googleLoading = false;
    super.initState();
  }

  Future<void> loginUser(BuildContext context) async{
    FirebaseAuth _auth = FirebaseAuth.instance;
    String phone = viewModel.phoneNumberController.text;

    _auth.verifyPhoneNumber(
        phoneNumber: phone.contains('+91')?phone:'+91$phone',
        timeout: const Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async{
          Navigator.of(context).pop();
          UserCredential result = await _auth.signInWithCredential (credential);
          User? user = result.user;
          if(user != null){
            App().setNavigation(context, AppRoutes.APP_NAME_DETAILS);
          }
        },
        verificationFailed: (FirebaseAuthException exception){
          viewModel.buttonLoadingStream.add("phone_completed");
          Utils.showSnackBar(context: context, message: "Verification failed");
        },
        codeSent: (String verificationId, int? forceResendingToken){
          viewModel.buttonLoadingStream.add("phone_completed");
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              isDismissible: false,
              enableDrag: false,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(16))),
              builder: (context) => otpWidget(_auth, verificationId)
          );
        },
        codeAutoRetrievalTimeout: (String verificationId){  },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        App().closeApp();
        return true;
      },
      child: SafeArea(
        child: Scaffold(
            body: BlocBuilder(
              bloc: bloc,
              builder: (context, state){
                if(state is Init || state is Success) {
                  return Box(
                    padding: const [15, 15, 0, 15],
                    expanded: true,
                    bgColor: white,
                    child: StreamBuilder(
                      stream: viewModel.buttonLoadingStream.stream,
                      builder: (context,snapshot){
                        phoneNumberLoading = snapshot.data=="phone_pending";
                        googleLoading = snapshot.data=="google_pending";
                        return buildView();
                      },
                    ),
                  );
                }else{
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }
            )
        ),
      )
    );
  }

  buildView(){
    return Column(
      crossAxisAlignment: crossCenter,
      children: [
        ColorShader(
          child: Label(
            theme: GoogleFonts.poppins(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            label: "Invoice Maker",
            color: primaryColor,
            margin: const [0,0,50,0],
          ),
          colors: const [Colors.red,Colors.deepOrangeAccent,Colors.orangeAccent,Colors.red],
          stops: const [ 0.2,0.3,0.5,0.9],
        ),
        Content(
          margin: const [0,0,0,10],
          text: "NextGen Inventory Management System",
          color: Colors.deepOrangeAccent,
          fontWeight: FontWeight.w600,
          fontSize: 10,
          fontFamily: GoogleFonts.openSans().fontFamily,
          expanded: true,
        ),
        Content(
          margin: const [0,0,30,10],
          text: "Enter your mobile number to signin to the app",
          color: promptColor,
          fontWeight: FontWeight.w600,
          fontSize: 14,
          fontFamily: GoogleFonts.openSans().fontFamily,
          expanded: true,
          textAlign: start,
        ),
        TextInput(
          hintText: "contact_number",
          bgColor: white,
          controller: viewModel.phoneNumberController,
          prefixIcon: Icons.phone,
          prefixIconColor: btnColor,
          autoFocus: true,
          focusedBorderColor: borderColor,
          fontFamily: GoogleFonts.openSans().fontFamily,
          enabledBorderColor: borderColor,
          fontWeight: FontWeight.w600,
          inputType: TextInputType.phone,
          color: textColor,
          labelColor: textColor1,
          fontSize: 16,
        ),
        PrimaryButton(
          margin: const [0,0,40,20],
          expanded: true,
          type: 1,
          fontSize: 14,
          isLoading: phoneNumberLoading,
          fontWeight: FontWeight.w600,
          fontFamily: GoogleFonts.openSans().fontFamily,
          height: btnHeight2,
          label: "Get OTP",
          onPressed: ()async{
            if(viewModel.validatePhoneNumber(context)) {
              viewModel.buttonLoadingStream.add("phone_pending");
              loginUser(context);
            }
          },
        ),
        const Label(
          label: "OR",
          fontSize: 10,
          color: promptColor,
          prefix: Box(child: Divider(thickness: 1,),width: 100,),
          suffix: Box(child: Divider(thickness: 1,),width: 100,),
        ),
        PrimaryButton(
          label: "Continue with Google",
          onPressed: (){
            viewModel.buttonLoadingStream.add("google_loading");
            viewModel.signInWithGoogle(context);
          },
          margin: const [0,0,20,0],
          width: Global.getScreenSize(context).width-30,
          height: btnHeight2,
          isLoading: googleLoading,
          buttonColor: primaryColor,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: max,
          prefix: const Box(width: 20, height: 20 ,asset: "google.png",),
          suffix: const Box(width: 20, height: 20,),
        ),
        const Spacer(),
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                style: TextStyle(
                  color: textColor1,
                  fontSize: 12,
                  height: 2
                ),
                text: "By Logging in you are agree to our ",
              ),
              TextSpan(
                style: const TextStyle(
                    color: textColor,
                    fontSize: 12,
                    height: 2,
                ),
                text: "Terms & Conditions",
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    const url = 'https://medium.flutterdevs.com/';
                    await launch(
                        url,
                        forceSafariVC: true, forceWebView: true
                    );
                  },
              ),
              const TextSpan(
                style: TextStyle(
                    color: textColor1,
                    fontSize: 12,
                    height: 2
                ),
                text: " and that you have read our ",
              ),
              TextSpan(
                style: const TextStyle(
                    color: textColor,
                    fontSize: 12,
                    height: 2
                ),
                text: "Privacy Policy",
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    const url = 'https://medium.flutterdevs.com/';
                    await launch(
                        url,
                        forceSafariVC: true, forceWebView: true
                    );
                  },
              ),
            ],
          ),),
      ],
    );
  }

  Widget otpWidget(FirebaseAuth auth, String verificationId){
    return SafeArea(child: Box(
      margin: const [15,0],
      child: Column(
        crossAxisAlignment: crossCenter,
        children: [
          ColorShader(
            child: Label(
              theme: GoogleFonts.poppins(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              label: "Invoice Maker",
              color: primaryColor,
              margin: const [0,0,50,0],
            ),
            colors: const [Colors.red,Colors.deepOrangeAccent,Colors.orangeAccent,Colors.red],
            stops: const [ 0.2,0.3,0.5,0.9],
          ),
          Content(
            margin: const [0,0,0,10],
            text: "NextGen Inventory Management System",
            color: Colors.deepOrangeAccent,
            fontWeight: FontWeight.w600,
            fontSize: 10,
            fontFamily: GoogleFonts.openSans().fontFamily,
            expanded: true,
          ),
          Content(
            margin: const [0,0,30,10],
            text: "Enter the received code",
            color: promptColor,
            fontWeight: FontWeight.w600,
            fontSize: 14,
            fontFamily: GoogleFonts.openSans().fontFamily,
            expanded: true,
            textAlign: start,
          ),
          PinPut(
            fieldsCount: 6,
            controller: pinPutController,
            followingFieldDecoration:  BoxDecoration(
              color: borderColor,
              borderRadius: BorderRadius.circular(5.0),
            ),
            pinAnimationType: PinAnimationType.scale,
            eachFieldMargin: const EdgeInsets.all(0),
            eachFieldWidth: 45.0,
            eachFieldHeight: 55.0,
            submittedFieldDecoration:  BoxDecoration(
              color: borderColor,
              borderRadius: BorderRadius.circular(5.0),
            ),
            selectedFieldDecoration: BoxDecoration(
              color: white,
              border: Border.all(color: borderColor),
              borderRadius: BorderRadius.circular(5.0),
            ),
            fieldsAlignment: MainAxisAlignment.spaceBetween,
          ),
          Box(
            margin: const [15,15,50,0],
            bgColor: btnColor,
            radius: round,
            child: IconButton(onPressed: ()async{
              final code = pinPutController.text.trim();
              if(code.isNotEmpty && code.length==6) {
                AuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: verificationId, smsCode: code);
                UserCredential result = await auth.signInWithCredential(
                    credential);
                User? user = result.user;
                if (user != null) {
                  App().setNavigation(context, AppRoutes.APP_NAME_DETAILS);
                }
              }
            }, icon: const Icon(Icons.check),color: white,),
          ),
          Content(
            margin: const [0,0,30,10],
            text: "Get, Set & Go!",
            color: iconColor,
            fontWeight: FontWeight.w600,
            fontSize: 14,
            fontFamily: GoogleFonts.openSans().fontFamily,
            expanded: true,
            textAlign: middle,
          ),
        ],
      ),
    )
    );
  }
}
