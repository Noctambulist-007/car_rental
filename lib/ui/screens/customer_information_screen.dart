import 'package:car_rental/controllers/customer_info_controller.dart';
import 'package:car_rental/ui/widgets/next_button_customer.dart';
import 'package:car_rental/ui/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomerInformationScreen extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final CustomerInfoController customerInfoController =
      Get.put(CustomerInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Back'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined, size: 15),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(23, 48.5, 22, 96),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SectionHeader(title: 'Customer Information'),
                Container(
                  margin: EdgeInsets.only(bottom: 197),
                  padding: EdgeInsets.all(19),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFD7D7FF)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTextField('First Name', firstNameController, true),
                      SizedBox(height: 10),
                      _buildTextField('Last Name', lastNameController, true),
                      SizedBox(height: 10),
                      _buildTextField('Email', emailController, true),
                      SizedBox(height: 10),
                      _buildTextField('Phone', phoneController, true),
                    ],
                  ),
                ),
                NextButtonCustomer(
                  firstNameController: firstNameController,
                  lastNameController: lastNameController,
                  emailController: emailController,
                  phoneController: phoneController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller, bool isRequired) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w300,
                fontSize: 14,
                letterSpacing: 0.3,
                color: Color(0xFF1B1B1B),
              ),
            ),
            if (isRequired)
              Text(
                '*',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  letterSpacing: 0.3,
                  color: Color(0xFFFF1212),
                ),
              ),
          ],
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: const Color(0xFFDFDFFF)),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: const Color(0xFFDFDFFF))),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: const Color(0xFFDFDFFF)),
            ),
          ),
        ),
      ],
    );
  }
}
