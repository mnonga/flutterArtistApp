import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginsignup/screens/cv.dart';
import 'package:loginsignup/styles/app_colors.dart';
import 'package:loginsignup/screens/signin.dart';
import 'package:loginsignup/widgets/custom_button.dart';
import 'package:loginsignup/widgets/custom_formfield.dart';
import 'package:loginsignup/widgets/custom_header.dart';
import 'package:loginsignup/widgets/custom_richtext.dart';

class Identity extends StatefulWidget {
  const Identity({Key? key}) : super(key: key);

  @override
  State<Identity> createState() => _IdentityState();
}

class _IdentityState extends State<Identity> {
  final _prenom = TextEditingController();
  final _nom = TextEditingController();
  final _postnom = TextEditingController();
  final _telephone = TextEditingController();
    final _adresse = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String get userName => _prenom.text.trim();
  String get email => _emailController.text.trim();
  String get password => _passwordController.text.trim();
  String? sexe, categorie, province;
  DateTime? dateNaissance;
  XFile? image;

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
              text: 'Identité.',
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
                  Center(child:
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Text("Photo de profil", style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    InkWell(
                      child: SizedBox(
                          width: 70,
                          height: 70,
                          child: CircleAvatar(
                              backgroundColor: Colors.grey.shade300,
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(50)),
                                child: Icon(
                                image==null?  Icons.person : Icons.edit,
                                size: 30,
                                color: Colors.white,
                              )),
                              backgroundImage: image != null
                                  ? FileImage(File(image!.path))
                                  : null)),
                      onTap: () async {
                        image = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        setState(() {});
                      },
                    )
                  ])),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomFormField(
                    headingText: "Prénom",
                    hintText: "Prénom",
                    obsecureText: false,
                    suffixIcon: const SizedBox(),
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.text,
                    controller: _prenom,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomFormField(
                    headingText: "Nom",
                    hintText: "Nom",
                    obsecureText: false,
                    suffixIcon: const SizedBox(),
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.text,
                    controller: _nom,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomFormField(
                    headingText: "Postnom",
                    hintText: "Postnom",
                    obsecureText: false,
                    suffixIcon: const SizedBox(),
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.text,
                    controller: _postnom,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomFormField(
                    headingText: "Téléphone",
                    hintText: "Téléphone",
                    obsecureText: false,
                    suffixIcon: const SizedBox(),
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.text,
                    controller: _telephone,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomDropdownFormField(
                    headingText: "Sexe",
                    hintText: "Sexe",
                    items: ['Femme', 'Homme'],
                    value: sexe,
                    onChanged: (value) {
                      setState(() {
                        sexe = value;
                      });
                    },
                  ),

                  const SizedBox(
                    height: 16,
                  ),
                  CustomDatePickerFormField(
                    headingText: "Date naissance",
                    hintText: "Date naissance",
                    value: dateNaissance,
                    onChanged: (value) {
                      setState(() {
                        dateNaissance = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomDropdownFormField(
                    headingText: "Province",
                    hintText: "Province",
                    items: ['Kinshasa', 'Kongo-Central'],
                    value: province,
                    onChanged: (value) {
                      setState(() {
                        province = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomFormField(
                    headingText: "Adresse",
                    hintText: "Adresse",
                    obsecureText: false,
                    suffixIcon: const SizedBox(),
                    maxLines: 3,
                    textInputAction: TextInputAction.none,
                    textInputType: TextInputType.multiline,
                    controller: _adresse,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomDropdownFormField(
                    headingText: "Catégorie",
                    hintText: "Catégorie",
                    items: ['Comédien', 'Peintre'],
                    value: categorie,
                    onChanged: (value) {
                      setState(() {
                        categorie = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AuthButton(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const CV()));
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
