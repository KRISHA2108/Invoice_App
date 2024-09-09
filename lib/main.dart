import 'package:invoice_genetator/utils/routes.dart';

import 'header_files.dart';

void main() {
  runApp(
    const InvoiceBillApp(),
  );
}

class InvoiceBillApp extends StatelessWidget {
  const InvoiceBillApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
    );
  }
}
