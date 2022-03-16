import 'package:flutter/material.dart';
import 'package:loginsignup/styles/app_colors.dart';
import 'package:loginsignup/screens/signin.dart';
import 'package:loginsignup/widgets/custom_button.dart';
import 'package:loginsignup/widgets/custom_formfield.dart';
import 'package:loginsignup/widgets/custom_header.dart';
import 'package:loginsignup/widgets/custom_richtext.dart';

class Autres extends StatefulWidget {
  const Autres({Key? key}) : super(key: key);

  @override
  State<Autres> createState() => _AutresState();
}

class _AutresState extends State<Autres> {
  final _userName = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
              text: 'Autres.',
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
              child: SingleChildScrollView(child: Column(
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
                    headingText: "Démarche artistique",
                    hintText: "Démarche artistique",
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
                    headingText: "Biographie",
                    hintText: "Biographie",
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
                    headingText: "Révue de presse",
                    hintText: "Révue de presse",
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
                    onTap: () {},
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
