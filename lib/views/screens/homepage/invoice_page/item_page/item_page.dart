// import 'package:invoice/header_files.dart';
import 'package:invoice_genetator/header_files.dart';
import 'package:invoice_genetator/utils/Global/global.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff003152),
        foregroundColor: Colors.white,
        title: const Text("Add Items"),
        actions: [
          IconButton(
            onPressed: () {
              if (Globals.personalInfoKey.currentState!.validate()) {
                Globals.personalInfoKey.currentState!.save();
                bill.add(
                  Global(
                    Fname: Globals.Fname,
                    Lname: Globals.Lname,
                    phone: Globals.phone,
                    email: Globals.email,
                    itemname: Globals.itemname,
                    Price: Globals.Price,
                    Qty: Globals.Qty,
                    discount: Globals.discount,
                    total: Globals.total,
                    image: Globals.image,
                    companyname: Globals.companyname,
                  ),
                );

                setState(() {});
              }
            },
            icon: const Icon(Icons.check),
          ),
          IconButton(
            onPressed: () {
              Globals.personalInfoKey.currentState!.reset();
              Globals.Fname;
              Globals.Lname;
              Globals.phone;
              Globals.email;
              Globals.itemname;
              Globals.Price;
              Globals.Qty;
              Globals.discount;
              Globals.total;
              Globals.image;
              Globals.companyname;

              setState(() {});
            },
            icon: const Icon(
              Icons.restart_alt_outlined,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: Globals.personalInfoKey,
          autovalidateMode: AutovalidateMode.always,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Item Name",
                  ),
                  onSaved: (value) {
                    Globals.itemname = value!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Item Name";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    Globals.Price = value!;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Price",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Price";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    Globals.Qty = value!;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Quantity",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Quantity";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    Globals.discount = value!;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Discount",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Discount";
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
