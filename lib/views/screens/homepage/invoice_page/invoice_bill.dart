// import 'package:invoice/header_files.dart';
import 'package:invoice_genetator/header_files.dart';
import 'package:invoice_genetator/utils/routes.dart';

class InvoicePage extends StatefulWidget {
  const InvoicePage({super.key});

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff003152),
        foregroundColor: Colors.white,
        title: const Text("Invoice"),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ...Routes.buildoption.map(
              (e) => Card(
                color: const Color(0xff003152),
                margin: const EdgeInsets.all(5),
                surfaceTintColor: Colors.black,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      e['route'],
                    );
                  },
                  child: ListTile(
                    leading: Image.asset(
                      e['icon'],
                      scale: 20,
                      color: Colors.white,
                    ),
                    title: Text(
                      e['name'],
                    ),
                    titleTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
