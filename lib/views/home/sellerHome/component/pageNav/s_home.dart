import 'package:flutter/material.dart';
import 'package:graduation_project/Models/modelHomeSeller/homeSeller.dart';
import 'package:graduation_project/controller/pageHomeSeller/dataproduct.dart';
import 'package:graduation_project/views/home/sellerHome/component/pageNav/component/detailsPost.dart';

class HomePageSeller extends StatelessWidget {
  const HomePageSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green,
      body: SizedBox(
        height: 250,
        width: double.infinity,
        //*list view  scroller horizontal
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:
                ControllerDataPostSeller.datalenght, //counter after add post

            itemBuilder: (context, index) {
              ModelDataProduct dataPost =
                  ControllerDataPostSeller.getDataPost(index);
              return InkWell(
                onTap: () {
                  var route = MaterialPageRoute(
                      builder: (context) => DetailsPostSeller());
                  Navigator.push(context, route);
                },
                child: Card(
                  elevation: 20,
                  color: Colors.white.withOpacity(0.3),
                  // color: Colors.black.withOpacity(.6),

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.only(right: 20),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    width: 155,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox(
                            height: 120,
                            width: double.infinity,
                            child: Stack(children: [
                              //****************************image product
                              Positioned.fill(
                                  child: Image(
                                image: AssetImage(dataPost.image),
                                fit: BoxFit.cover,
                              )),
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  '\$ ${dataPost.price}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      backgroundColor: Colors.black45),
                                ),
                              )
                            ]),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          dataPost.title,
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 10),
                        // const Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Text('delete'),
                        //     SizedBox(
                        //       width: 10,
                        //     ),
                        //     Text('edit')
                        //   ],
                        // )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
