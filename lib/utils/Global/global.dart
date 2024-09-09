import 'package:invoice_genetator/header_files.dart';

class Globals {
  static String Fname = '';
  static String Lname = '';
  static String phone = '';
  static String email = '';
  static String itemname = '';
  static String Price = '';
  static String Qty = '';
  static String discount = '';
  static String companyname = '';
  static File? image;
  static double total = 0;
  static GlobalKey<FormState> personalInfoKey = GlobalKey<FormState>();
}

class Global {
  final String Fname;
  final String Lname;
  final String phone;
  final String email;
  final String itemname;
  final String Price;
  final String Qty;
  final String discount;
  final String companyname;
  static File? image;
  final double total;

  Global({
    required this.Fname,
    required this.Lname,
    required this.phone,
    required this.email,
    required this.itemname,
    required this.Price,
    required this.Qty,
    required this.discount,
    required this.companyname,
    required this.total,
    required image,
  });
}

List<Global> bill = [];
