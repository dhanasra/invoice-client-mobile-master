import 'package:flutter/cupertino.dart';
import 'package:im/views/authentication/explore_screen.dart';
import 'package:im/views/authentication/name_screen.dart';
import 'package:im/views/home/home_screen.dart';
import 'package:im/views/items/item_create_screen.dart';
import 'package:im/views/items/item_details_screen.dart';
import 'package:im/views/items/item_edit_screen.dart';
import 'package:im/views/parties/party_create_screen.dart';
import 'package:im/views/parties/party_details_screen.dart';
import 'package:im/views/parties/party_edit_screen.dart';
import 'package:im/views/authentication/phone_number_screen.dart';
import 'package:im/views/splash_screen.dart';
import 'package:im/views/transactions/expense.dart';
import 'package:im/views/transactions/invoice.dart';
import 'package:im/views/transactions/payment.dart';
import 'package:im/views/transactions/transactions_details.dart';
import 'package:im/views/welcome_screen.dart';

class AppRoutes {
  static String CURRENT_PATH = '/';

  //Authentication pages
  static const String APP_SPLASH = '/splash';
  static const String APP_WELCOME = '/welcome';
  static const String APP_PHONE_NUMBER = '/phone_number';
  static const String APP_NAME_DETAILS = '/name_details';
  static const String APP_EXPLORE = '/explore';

  //transactions
  static const String APP_PAYMENT = '/payment';
  static const String APP_INVOICE = '/invoice';
  static const String APP_EXPENSE = '/expense';
  static const String APP_TRANSACTIONS_DETAILS = '/transactions_details';


  //Party pages
  static const String APP_PARTY_CREATE = '/create_party';
  static const String APP_PARTY_EDIT = '/edit_party';
  static const String APP_PARTY_DETAILS = '/party_details';

  //Item pages
  static const String APP_ITEM_CREATE = '/create_item';
  static const String APP_ITEM_EDIT = '/edit_item';
  static const String APP_ITEM_DETAILS = '/item_details';

  //settings
  static const String APP_BUSINESS_SETTINGS = '/business_settings';

  //more
  static const String APP_ABOUT = '/about';
  static const String APP_INVOICE_SETTINGS = '/invoice_settings';
  static const String APP_ACCOUNT_SETTINGS = '/account_settings';
  static const String APP_BUSINESS_CARD = '/business_card';
  static const String APP_REMINDER_SETTINGS = '/reminder_settings';
  static const String APP_GREETINGS = '/greetings';
  static const String APP_MANAGE_STAFF = '/manage_staff';
  static const String APP_SUBSCRIPTION_PLAN = '/subscription_plan';

  //home pages
  static const String APP_HOME = '/home';

  Route getRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case APP_TRANSACTIONS_DETAILS:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => const TransactionsDetails(),
            fullscreenDialog: true,
          );
        }
      case APP_PAYMENT:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => const Payment(),
            fullscreenDialog: true,
          );
        }
      case APP_INVOICE:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => const Invoice(),
            fullscreenDialog: true,
          );
        }
      case APP_EXPENSE:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => const Expense(),
            fullscreenDialog: true,
          );
        }
      case APP_PARTY_EDIT:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => const PartyEditScreen(),
            fullscreenDialog: true,
          );
        }
      case APP_PARTY_CREATE:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => const PartyCreateScreen(),
            fullscreenDialog: true,
          );
        }
      case APP_PARTY_DETAILS:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => const PartyDetailsScreen(),
            fullscreenDialog: true,
          );
        }
      case APP_ITEM_EDIT:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => const ItemEditScreen(),
            fullscreenDialog: true,
          );
        }
      case APP_ITEM_CREATE:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => const ItemCreateScreen(),
            fullscreenDialog: true,
          );
        }
      case APP_ITEM_DETAILS:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => const ItemDetailsScreen(),
            fullscreenDialog: true,
          );
        }
      case APP_HOME:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => const HomeScreen(),
            fullscreenDialog: true,
          );
        }
      case APP_EXPLORE:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => const ExploreScreen(),
            fullscreenDialog: true,
          );
        }
      case APP_NAME_DETAILS:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => const NameScreen(),
            fullscreenDialog: true,
          );
        }
      case APP_PHONE_NUMBER:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => const PhoneNumberScreen(),
            fullscreenDialog: true,
          );
        }
      case APP_WELCOME:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => const WelcomeScreen(),
            fullscreenDialog: true,
          );
        }
      case APP_SPLASH:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => const SplashScreen(),
            fullscreenDialog: true,
          );
        }
      default:
        {
          return CupertinoPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => Container(),
            fullscreenDialog: true,
          );
        }
    }
  }

  getWidget(BuildContext context, String appRouteName) {
    switch(appRouteName) {
      case APP_TRANSACTIONS_DETAILS:
        {
          return const TransactionsDetails();
        }
      case APP_INVOICE:
        {
          return const Invoice();
        }
      case APP_PAYMENT:
        {
          return const Payment();
        }
      case APP_EXPENSE:
        {
          return const Expense();
        }
      case APP_ITEM_CREATE:
        {
          return const ItemCreateScreen();
        }
      case APP_ITEM_EDIT:
        {
          return const ItemEditScreen();
        }
      case APP_ITEM_DETAILS:
        {
          return const ItemDetailsScreen();
        }
      case APP_PARTY_EDIT:
        {
          return const PartyEditScreen();
        }
      case APP_PARTY_CREATE:
        {
          return const PartyCreateScreen();
        }
      case APP_PARTY_DETAILS:
        {
          return const PartyDetailsScreen();
        }
      case APP_HOME:
        {
          return const HomeScreen();
        }
      case APP_EXPLORE:
        {
          return const ExploreScreen();
        }
      case APP_NAME_DETAILS:
        {
          return const NameScreen();
        }
      case APP_PHONE_NUMBER:
        {
          return const PhoneNumberScreen();
        }
      case APP_WELCOME:
        {
          return const WelcomeScreen();
        }
      case APP_SPLASH:
        {
          return const SplashScreen();
        }
      default:
        {
          return Container();
        }
    }
  }
}