import 'package:flutter/material.dart';
import 'package:myislamicdream/utils/constants.dart';

import '../../utils/custom_search_delegate.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: color_primary,
          title: Image.asset(
            'asset/images/myislamicdream_logo.png',
            height: 95,
            width: 150,
          ),
          leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu, color: Colors.white)),
          actions: [
            IconButton(onPressed: (){
              showSearch(context: context, delegate: CustomSearchDelegate());
            }, icon: Icon(Icons.search, color: Colors.white)),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ClipRRect(
            //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
            //   //clipBehavior: Clip.antiAlias,
            //   child: Container(
            //     color: color_primary,
            //     height: 100,
            //     child: Row(
            //       children: [
            //         IconButton(
            //           onPressed: () {},
            //           icon: Icon(Icons.menu, color: Colors.white,),
            //         ),
            //         SizedBox(height: 55,),
            //         SizedBox(
            //           width: 250,
            //           child: TextFormField(
            //             onChanged: (value) {},
            //             keyboardType: TextInputType.text,
            //             decoration: InputDecoration(
            //               fillColor: Colors.white,
            //               hintText: 'what was your dream about ',
            //               prefixIcon: Icon(
            //                 Icons.search_outlined,
            //                 color: color_primary,
            //               ),
            //               // icon:
            //               hintStyle: TextStyle(fontSize: 14.0, fontFamily: 'Roboto'),
            //               border: OutlineInputBorder(
            //                 borderRadius: BorderRadius.circular(28),
            //               ),
            //               filled: true,
            //               contentPadding: EdgeInsets.all(16),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Expanded(
              child: Container(
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: <Widget>[
                    Card(
                      elevation: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                            child: Text("Crying", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Roboto'),),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                            child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting  survived not only five centuries",style: TextStyle(fontSize: 16, fontFamily: 'Roboto') ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                            child: Text("Crying", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Roboto'),),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                            child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting  survived not only five centuries",style: TextStyle(fontSize: 16, fontFamily: 'Roboto') ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                            child: Text("Crying", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Roboto'),),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                            child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting  survived not only five centuries",style: TextStyle(fontSize: 16, fontFamily: 'Roboto') ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                            child: Text("Crying", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Roboto'),),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                            child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting  survived not only five centuries",style: TextStyle(fontSize: 16, fontFamily: 'Roboto') ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                            child: Text("Crying", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Roboto'),),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                            child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting  survived not only five centuries",style: TextStyle(fontSize: 16, fontFamily: 'Roboto') ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



