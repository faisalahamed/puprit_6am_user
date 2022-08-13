import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medibott/view/new_screens/colors.dart';

class MyPrescriptionPage extends StatelessWidget {
  const MyPrescriptionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'My Prescription',
          style: TextStyle(
              color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
      ),
      // bottomSheet: BottomSheet(
      //   backgroundColor: AppColors.colorPrimary,
      //   shape: const RoundedRectangleBorder(
      //       borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(12.0),
      //         topRight: Radius.circular(12.0),
      //       )), builder: (BuildContext context) {
      //   return Container(
      //       padding: const EdgeInsets.all(16.0),
      //       child: Column(
      //         children: [
      //           const ListTile(title: Text('Upload Avatar'),trailing: Icon(Icons.close,size: 30.0,color: AppColors.colorPrimary,),),
      //           Row(
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children:  [
      //               ///choose from camera
      //               InkWell(
      //                   onTap: () async {
      //
      //                     XFile? imageFile = await getImageFromDevice();
      //
      //                     if(imageFile != null){
      //
      //                     }
      //                   },
      //                   child: Column(
      //                     mainAxisSize: MainAxisSize.min,
      //                     children: const [
      //                       Icon(
      //                         Icons.camera,
      //                       ),
      //                       Text(
      //                         'Camera',
      //                         style: TextStyle(color:Colors.black),
      //                       )
      //                     ],
      //                   )),
      //               ///choose from gallery
      //               InkWell(
      //                   onTap: () async {
      //                     XFile? imageFile = await getImageFromDevice();
      //
      //                     if(imageFile != null){
      //
      //                     }
      //
      //                   },
      //                   child: Column(
      //                     mainAxisSize: MainAxisSize.min,
      //                     children: const [
      //                       Icon(Icons.image),
      //                       Text('Gallery', style: TextStyle(color: Colors.black))
      //                     ],
      //                   )),
      //             ],
      //           ),
      //         ],
      //       )
      //   );
      // }, onClosing: () {  },
      // ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: 200.0,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            'Upload Avatar',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                          ),
                          trailing: GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Icon(
                              Icons.close,
                              size: 30.0,
                              color: AppColors.colorPrimary,
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.grey.shade100,
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ///choose from camera
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  margin: const EdgeInsets.all(4.0),
                                  color: Colors.white,
                                  child: InkWell(
                                      onTap: () async {
                                        // XFile imageFile =
                                        //     await getImageFromDevice();

                                        // if (imageFile != null) {}
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          Icon(Icons.camera,
                                              size: 35.0,
                                              color: AppColors.colorPrimary),
                                          Text(
                                            'Camera',
                                            style:
                                                TextStyle(color: Colors.black),
                                          )
                                        ],
                                      )),
                                ),
                              ),

                              ///choose from gallery
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  margin: const EdgeInsets.all(4.0),
                                  color: Colors.white,
                                  child: InkWell(
                                      onTap: () async {
                                        // XFile imageFile =
                                        //     await getImageFromDevice();
                                        // if (imageFile != null) {}
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: const [
                                          Icon(
                                            Icons.image,
                                            size: 35.0,
                                            color: AppColors.colorPrimary,
                                          ),
                                          Text('Gallery',
                                              style: TextStyle(
                                                  color: Colors.black))
                                        ],
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                });
          },
          backgroundColor: AppColors.colorPrimary,
          child: const Icon(
            Icons.add,
            size: 45.0,
          )),
      body: Container(),
    );
  }
}
