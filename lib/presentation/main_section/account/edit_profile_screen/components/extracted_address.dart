import 'package:ecommerce_seller/controllers/address_controller.dart';
import 'package:ecommerce_seller/presentation/main_section/account/edit_profile_screen/add_new_adreess.dart';
import 'package:ecommerce_seller/presentation/main_section/account/more_option_screen/manage_adress/manage_address_screen.dart';
import 'package:ecommerce_seller/utilz/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class ExtractedAddressWidget extends StatelessWidget {
  const ExtractedAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Address List',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, fontSize: 17.px),
              ),
              Spacer(),
              Text(
                'Add New Address',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: Color(0xff0A84FF),
                    fontSize: 17.px),
              ).onTap(() {
                Get.to(() => AddNewAddressScreen());
              }),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child:
                Consumer<AddresssController>(builder: (context, controller, _) {
              return ListView.builder(
                itemCount: controller.addresses.length,
                itemBuilder: (context, index) =>
                    addressWidget(controller.addresses[index]),
              );
            }),
          )
        ],
      ),
    );
  }
}
