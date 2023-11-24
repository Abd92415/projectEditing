import 'package:firebase_auth/firebase_auth.dart';
import 'package:graduation_project/services/Firebase/seller_firestore.dart';
import 'package:graduation_project/services/Firebase/user_auth.dart';
import 'package:graduation_project/services/constant/path_images.dart';
import 'package:provider/provider.dart';

import 'dropmenu.dart';
import '../verifiication/verify.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../../../services/language/generated/key_lang.dart';
import '../../../component/button.dart';
import '../../../component/text_pass.dart';
import '../../../component/text_username.dart';
import '../../../login/login.dart';

class RigesterSeller extends StatefulWidget {
  const RigesterSeller({super.key});

  @override
  State<RigesterSeller> createState() => _RigesterSellerState();
}

class _RigesterSellerState extends State<RigesterSeller> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController projectNameController = TextEditingController();
  String selectedCategory = '';
  final TextEditingController phoneController = TextEditingController();

  void handleCategorySelection(String category) {
    selectedCategory = category;
  }

  void _dismissKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    final UserAuth auth = Provider.of<UserAuth>(context);
    final SellerFirestore seller = Provider.of<SellerFirestore>(context);

    return GestureDetector(
      onTap: _dismissKeyboard,
      child: SafeArea(
        child: Scaffold(
          // extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: const Text(KeyLang.seller),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: const AssetImage(
                      PathImage.bgLogin,
                    ),
                    fit: BoxFit.fitHeight,
                    colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.3), BlendMode.modulate)),
              ),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.center,
                    child: const Text(
                      'Welcome, wonderful sellers! Start showcasing your products and be a part of our amazing shopping experience',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        //*textFiald : fill the name user
                        TextFieldUseAll(
                          hint: KeyLang.nameUser,
                          iconuse: Icons.person,
                          type: TextInputType.name,
                          controller: nameController,
                        ),
                        const SizedBox(height: 10),
                        //************************textField :email user */
                        TextFieldUseAll(
                          hint: KeyLang.email,
                          iconuse: Icons.email,
                          type: TextInputType.emailAddress,
                          controller: emailController,
                        ),
                        const SizedBox(height: 10),
                        TextFieldUseAll(
                          hint: KeyLang.projectName,
                          iconuse: Icons.work,
                          type: TextInputType.text,
                          controller: projectNameController,
                        ),

                        const SizedBox(height: 10),
                        TextFieldUseAll(
                          hint: KeyLang.phone,
                          iconuse: Icons.phone,
                          type: TextInputType.phone,
                          controller: phoneController,
                        ),

                        //**********************************************Textfailed password and confirm
                        const SizedBox(height: 10),
                        TextFieldPassword(KeyLang.password, passwordController),
                        const SizedBox(height: 10),
                        DropDownMenuDepart(
                          onCategorySelected: handleCategorySelection,
                          dismissKeyboard: _dismissKeyboard,
                        ),
                        //************************************************************button signUp

                        const SizedBox(height: 40),
                        InkWell(
                          onTap: () async {
                            User? user = await auth.signUp(
                                emailController.text, passwordController.text);
                            if (user != null) {
                              print(
                                  'Buyer signed up successfully: ${user.uid}');
                              await seller.addSeller(
                                  username: nameController.text,
                                  projectName: projectNameController.text,
                                  category: selectedCategory,
                                  phoneNumber: phoneController.text,
                                  email: emailController.text);
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Pageverified(email: emailController.text),
                                ),
                              );
                            } else {
                              Fluttertoast.showToast(
                                  msg: auth.errorMessage.split(']')[1],
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 50,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              print('Seller sign up failed');
                            }
                          },
                          child: const Button(textButton: KeyLang.signup),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: const Divider(color: Colors.grey, height: 2),
                        ),
                        InkWell(
                          onTap: () {
                            var route = MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            );
                            Navigator.push(context, route);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.bottomCenter,
                            child: const Text(
                              'alredy Account ! click here',
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
