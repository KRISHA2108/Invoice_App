import 'package:invoice_genetator/header_files.dart';
import 'package:invoice_genetator/utils/Global/global.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff003152),
        foregroundColor: Colors.white,
        title: const Text("New Client"),
        actions: [
          IconButton(
            onPressed: () {
              if (Globals.personalInfoKey.currentState!.validate()) {
                Globals.personalInfoKey.currentState!.save();
              }
              setState(() {});
            },
            icon: const Icon(Icons.check),
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
                //Name
                TextFormField(
                  onChanged: (value) => Globals.Fname = value,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.person_outlined,
                      color: Color(0xff003152),
                    ),
                    hintText: 'First Name',
                    hintStyle: TextStyle(
                      color: Color(0xff003152),
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      (value!.isEmpty) ? 'Please enter First Name' : null,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  onChanged: (value) => Globals.Lname = value,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.person_outlined,
                      color: Color(0xff003152),
                    ),
                    hintText: 'Last Name',
                    hintStyle: TextStyle(
                      color: Color(0xff003152),
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      (value!.isEmpty) ? 'Please enter Last Name' : null,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 10,
                ),
                // phone
                TextFormField(
                  maxLength: 10,
                  onSaved: (val) {
                    Globals.phone = val!;
                  },
                  decoration: const InputDecoration(
                    hintMaxLines: 10,
                    label: Text(
                      "Phone",
                      style: TextStyle(
                        color: Color(0xff003152),
                      ),
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.phone_outlined,
                      color: Color(0xff003152),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  validator: (value) =>
                      (value!.isEmpty) ? 'Please enter phone' : null,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 10,
                ),
                //EmailAddress
                TextFormField(
                  onSaved: (val) {
                    Globals.email = val!;
                  },
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Color(0xff003152),
                    ),
                    label: Text(
                      "Email Address",
                      style: TextStyle(
                        color: Color(0xff003152),
                      ),
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) =>
                      (value!.isEmpty) ? 'Please enter email' : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
