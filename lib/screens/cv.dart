import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:loginsignup/screens/autres.dart';
import 'package:loginsignup/styles/app_colors.dart';
import 'package:loginsignup/screens/signin.dart';
import 'package:loginsignup/widgets/custom_button.dart';
import 'package:loginsignup/widgets/custom_formfield.dart';
import 'package:loginsignup/widgets/custom_header.dart';
import 'package:loginsignup/widgets/custom_richtext.dart';

class CV extends StatefulWidget {
  const CV({Key? key}) : super(key: key);

  @override
  State<CV> createState() => _CVState();
}

class _CVState extends State<CV> {
  final _userName = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _pdfController = TextEditingController();

  String get userName => _userName.text.trim();
  String get email => _emailController.text.trim();
  String get password => _passwordController.text.trim();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: AppColors.blue,
          ),
          CustomHeader(
              text: 'Votre CV.',
              onTap: () {
                Navigator.of(context).pop();
              }),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.08,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: AppColors.whiteshade,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32))),
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.09),
                    child: Image.asset("assets/images/login.png"),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomFormField(
                    headingText: "PDF",
                    hintText: "PDF",
                    obsecureText: false,
                    suffixIcon: InkWell(
                      child: Icon(Icons.folder),
                      onTap: () async {
                        FilePickerResult? result = await FilePicker.platform
                            .pickFiles(
                                type: FileType.custom,
                                allowedExtensions: ['pdf', 'doc']);

                        if (result != null) {
                          File file = File(result.files.single.path!);
                          setState(() {
                            _pdfController.text = result.files.single.name;
                          });
                        } else {
                          // User canceled the picker
                        }
                      },
                    ),
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.text,
                    controller: _pdfController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomFormField(
                    headingText: "Formations",
                    hintText: "Formations",
                    obsecureText: false,
                    suffixIcon: const SizedBox(),
                    maxLines: 5,
                    textInputAction: TextInputAction.none,
                    textInputType: TextInputType.multiline,
                    controller: TextEditingController(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomFormField(
                    headingText: "Expositions",
                    hintText: "Expositions",
                    obsecureText: false,
                    suffixIcon: const SizedBox(),
                    maxLines: 5,
                    textInputAction: TextInputAction.none,
                    textInputType: TextInputType.multiline,
                    controller: TextEditingController(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomFormField(
                    headingText: "Prix et bourses",
                    hintText: "Prix et bourses",
                    obsecureText: false,
                    suffixIcon: const SizedBox(),
                    maxLines: 5,
                    textInputAction: TextInputAction.none,
                    textInputType: TextInputType.multiline,
                    controller: TextEditingController(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomFormField(
                    headingText: "Activités professionnelles",
                    hintText: "Activités professionnelles",
                    obsecureText: false,
                    suffixIcon: const SizedBox(),
                    maxLines: 5,
                    textInputAction: TextInputAction.none,
                    textInputType: TextInputType.multiline,
                    controller: TextEditingController(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AuthButton(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Autres()));
                    },
                    text: 'Suivant',
                  ),
                  CustomRichText(
                    discription: 'Already Have an account? ',
                    text: 'Log In here',
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Signin()));
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              )),
            ),
          ),
        ],
      )),
    );
  }
}
