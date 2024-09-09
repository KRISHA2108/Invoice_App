import 'package:flutter/material.dart';
import 'package:invoice_genetator/utils/routes.dart';

import '../../../utils/Global/global.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.sizeOf(context);
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: const Color(0xff003152),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(Icons.refresh),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        title: const Text("Invoice"),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.invoice);
              },
              child: Container(
                height: s.height * 0.13,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(
                    0xff003152,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "+ Invoice Bill",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Invoice List",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ...bill.map(
              (e) => Card(
                color: const Color(0xff003152),
                margin: const EdgeInsets.all(5),
                surfaceTintColor: Colors.black,
                child: ListTile(
                  leading: const Icon(
                    Icons.picture_as_pdf,
                    color: Colors.white,
                  ),
                  title: const Text(
                    "Pdf",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      bill.remove(e);
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.white,
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
