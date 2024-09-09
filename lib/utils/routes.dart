import 'package:invoice_genetator/header_files.dart';
import 'package:invoice_genetator/views/screens/homepage/home_page.dart';
import 'package:invoice_genetator/views/screens/homepage/invoice_page/bill/bill.dart';
import 'package:invoice_genetator/views/screens/homepage/invoice_page/from_page/from_page.dart';
import 'package:invoice_genetator/views/screens/homepage/invoice_page/invoice_bill.dart';
import 'package:invoice_genetator/views/screens/homepage/invoice_page/item_page/item_page.dart';
import 'package:invoice_genetator/views/screens/splash_page/splash_page.dart';

import '../views/screens/homepage/invoice_page/company_page/company_page.dart';

class Routes {
  static String splashpage = '/';
  static String homepage = 'homepage';
  static String invoice = 'Invoice';

  static List buildoption = [
    {
      'name': 'Logo',
      'route': 'companylogo',
      'icon': 'assets/image/apple.png',
    },
    {
      'name': 'name',
      'route': 'name',
      'icon': 'assets/image/user.png',
    },
    {
      'name': 'Items',
      'route': 'item',
      'icon': 'assets/image/shopping.png',
    },
    {
      'name': 'Bill',
      'route': 'bil',
      'icon': 'assets/image/bill.png',
    },
  ];
}

Map<String, Widget Function(BuildContext)> routes = {
  Routes.splashpage: (context) => const SplashPage(),
  Routes.homepage: (context) => const HomePage(),
  Routes.invoice: (context) => const InvoicePage(),
  Routes.buildoption[0]['route']: (context) => const CompanyLogoPage(),
  Routes.buildoption[1]['route']: (context) => const PersonalInfoPage(),
  Routes.buildoption[2]['route']: (context) => const ItemPage(),
  Routes.buildoption[3]['route']: (context) => const BillPage(),
};
