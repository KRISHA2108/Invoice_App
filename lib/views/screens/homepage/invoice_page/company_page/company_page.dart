import 'package:invoice_genetator/header_files.dart';
import 'package:invoice_genetator/utils/Global/global.dart';

class CompanyLogoPage extends StatefulWidget {
  const CompanyLogoPage({super.key});

  @override
  State<CompanyLogoPage> createState() => _CompanyLogoPageState();
}

class _CompanyLogoPageState extends State<CompanyLogoPage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff003152),
        foregroundColor: Colors.white,
        title: const Text("Company Logo"),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            Container(
              height: 250,
              width: 400,
              alignment: Alignment.center,
              child: Stack(
                alignment: const Alignment(0.8, 0.9),
                children: [
                  CircleAvatar(
                    radius: s.height * 0.15,
                    foregroundImage: (Globals.image != null)
                        ? FileImage(Globals.image!)
                        : null,
                  ),
                  // image
                  FloatingActionButton.extended(
                    onPressed: () async {
                      ImagePicker picker = ImagePicker();
                      XFile? xFile =
                          await picker.pickImage(source: ImageSource.gallery);
                      Globals.image = File(xFile!.path);
                      setState(() {});
                    },
                    backgroundColor: const Color(0xff003152),
                    label: const Icon(
                      Icons.camera_alt,
                      weight: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            //Name
            TextFormField(
              onChanged: (value) => Globals.companyname = value,
              decoration: const InputDecoration(
                hintText: 'Company Name ',
                hintStyle: TextStyle(
                  color: Color(0xff003152),
                ),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(),
              ),
              validator: (value) =>
                  (value!.isEmpty) ? 'Please enter  CompanyName' : null,
              textInputAction: TextInputAction.next,
            ),
          ],
        ),
      ),
    );
  }
}
