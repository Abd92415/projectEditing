import 'package:flutter/material.dart';
import 'package:graduation_project/services/constant/path_images.dart';
import 'package:graduation_project/services/language/generated/key_lang.dart';
import 'package:graduation_project/views/login_signup/component/button.dart';

class DetailsPostSeller extends StatelessWidget {
  const DetailsPostSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        // color: Colors.black,
        color: Colors.blueAccent,
        child: Column(
          children: [
            Expanded(
                flex: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        const Positioned.fill(
                            child: Image(
                          image: AssetImage(PathImage.clothes1),
                          fit: BoxFit.cover,
                        )),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: const EdgeInsets.only(
                                top: 50, left: 20, right: 20),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Icon(Icons.favorite,
                                        color: Colors.orange))
                              ],
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              padding: const EdgeInsets.only(
                                  top: 30, right: 30, left: 30),
                              height: 150,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(.6),
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      topRight: Radius.circular(50))),
                              child: Column(
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //****************************name Product
                                      const Text(
                                        KeyLang.projectName,
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            decoration: TextDecoration.none),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      //*****************************name user selller
                                      Text('user name seller',
                                          style: TextStyle(
                                              fontSize: 17,
                                              color:
                                                  Colors.white.withOpacity(.5),
                                              decoration: TextDecoration.none)),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      const Row(
                                        children: [
                                          Icon(
                                            Icons.attach_money_rounded,
                                            color: Colors.orange,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Prise',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.only(top: 20, left: 20, right: 30),
                  height: double.infinity,
                  width: double.infinity,
                  child: Column(
                    children: [
                      SingleChildScrollView(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Description",
                            style: TextStyle(
                              color: Colors.white.withOpacity(.5),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'description Product from fire basedescription Product from fire basedescription Product from fire basedescription Product from fire base ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      )),

                      InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Button(textButton: 'Back'))
                      // Container(
                      //   alignment: Alignment.center,
                      //   height: 60,
                      //   width: 250,
                      //   decoration: BoxDecoration(
                      //       color: Colors.orange,
                      //       borderRadius: BorderRadius.circular(20)),
                      //   child: const Text(
                      //     "Cancel",
                      //     style: TextStyle(
                      //         color: Colors.white,
                      //         fontSize: 20,
                      //         fontWeight: FontWeight.bold),
                      //   ),
                      // )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
