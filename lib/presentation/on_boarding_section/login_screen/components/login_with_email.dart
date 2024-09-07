import 'package:ecommerce_seller/controllers/auth_controller.dart';
import 'package:ecommerce_seller/presentation/on_boarding_section/otp/otp_screen.dart';
import 'package:ecommerce_seller/presentation/on_boarding_section/reset_password/reset_password_screen.dart';
import 'package:ecommerce_seller/presentation/widgets/button_widgets.dart';
import 'package:ecommerce_seller/utilz/colors.dart';
import 'package:ecommerce_seller/utilz/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreenWithEmail extends StatelessWidget {
  LoginScreenWithEmail({super.key});

  TextEditingController emailField = TextEditingController();
  TextEditingController passwordField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 4.h,
            ),
            TextField(
              controller: emailField,
              decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: 'Email',
                  labelStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.px,
                      color: black),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: black,
                      ),
                      borderRadius: BorderRadius.circular(10)),

                  //  border: OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: 'Email id',
                  hintStyle: TextStyle(
                    color: grey.withOpacity(0.3),
                  ),
                  contentPadding: EdgeInsets.all(10)),
            ),
            SizedBox(
              height: Adaptive.h(2),
            ),
            TextField(
              obscureText: true,
              controller: passwordField,
              decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: 'Password',
                  labelStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.px,
                      color: black),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: black,
                      ),
                      borderRadius: BorderRadius.circular(10)),

                  //  border: OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: 'Password*',
                  hintStyle: TextStyle(
                    color: grey.withOpacity(0.3),
                  ),
                  contentPadding: EdgeInsets.all(10)),
            ),
            sizedBoxHeight20,

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Checkbox(
                //           value: true, // Set the initial value of the checkbox
                //           onChanged: (bool? value) {
                //             // Define a function to handle changes in the checkbox state
                //             print('Checkbox value changed to: $value');
                //           },
                //           shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(4.0),
                //             side: BorderSide(color: Color(0XFFFFDC80)),
                //           ),
                //           checkColor:Colors.white, // Color of the check mark
                //           activeColor: Color(0XFFFFDC80), // Color of the box when checked
                //           focusColor: Color(0XFFFFDC80),

                //         ),

                GestureDetector(
                  onTap: () {
                    Get.to(() => ResetPassword());
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Forget Your Password?',
                            style: GoogleFonts.roboto(
                                fontSize: 16.sp, color: Colors.black)),
                        TextSpan(
                          text: ' Reset Here',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.yellow,
                              fontWeight: FontWeight
                                  .w300, // Optional: You can also apply other styles
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.yellow),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: Adaptive.h(8),
            ),
            Consumer<AuthController>(builder: (context, controller, _) {
              print("updated");
              return controller.isLoading
                  ? SizedBox(
                      width: 10,
                      height: 10,
                      child: CircularProgressIndicator(),
                    )
                  : InkWell(
                      onTap: () async {
                        Status status = await AuthController().signIn(
                            email: emailField.text,
                            password: passwordField.text);

                        if (status == Status.success) {
                          Get.to(() => OtpScreen());
                        }
                      },
                      child: ButtonWidget(
                        backgroundColor: buttonColor,
                        title: 'Login',
                        textColor: Colors.white,
                        heights: Adaptive.h(6),
                      ));
            }),
            SizedBox(
              height: 2.h,
            ),
            // InkWell(
            //   onTap: () {
            //     // Get.to(()=> CreateAccountScreeen());
            //   },
            //   child: RichText(text: TextSpan(
            //     children: [
            //       TextSpan(
            //         text: 'By continuing, I agree of the',
            //        style: GoogleFonts.roboto(
            //         color: Color(0XFF505050),
            //        ),

            //       ),
            //       TextSpan(
            //         text: ' Terms of Use',
            //         style: GoogleFonts.roboto(
            //           color: buttonColor,
            //           fontWeight: FontWeight.w500,
            //           fontSize: 14.px
            //         )
            //       ),
            //        TextSpan(
            //         text: '&',
            //        style: GoogleFonts.roboto(
            //         color: Color(0XFF505050),
            //        ),

            //       ),
            //        TextSpan(
            //         text: ' Privacy \npolicy ',
            //        style: GoogleFonts.roboto(
            //        color: buttonColor,
            //           fontWeight: FontWeight.w500,
            //           fontSize: 14.px
            //        ),

            //       ),
            //     ]
            //   )),
            // ),
          ],
        ),
      ),
    );
  }
}
