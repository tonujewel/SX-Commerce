import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sx_commerece/Dimension/Dimension.dart';
import 'package:sx_commerece/Utils/AppConstant.dart';
import 'package:sx_commerece/Utils/mColor.dart';
import 'package:sx_commerece/components/CustomBackground2.dart';
import 'package:sx_commerece/components/Loading_Button.dart';
import 'package:sx_commerece/components/TextFieldWithShadow.dart';
import 'package:sx_commerece/main.dart';
import 'package:sx_commerece/screens/ProfileAllscreens/UpdateProfile/UpdateProfileProvider.dart';

class UpdateProfile extends StatefulWidget {
  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  UpdateProfileProvider updateProfileProvider;
  double containerWidth;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  File _image;

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50
    );

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    File image = await  ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      _image = image;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<UpdateProfileProvider>(
      create: (_) => UpdateProfileProvider()..setView(context),
      child: Consumer<UpdateProfileProvider>(builder: (context, model, child) {
        updateProfileProvider = model;
        return Scaffold(
          appBar: AppBar(
            title: Text('Update Profile'),
            centerTitle: true,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                updateProfileProvider.backPress();
              },
            ),
          ),
          body: CustomBackground2(
            mHeight: size.height * .1,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: size.height * .15),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        width: size.width * .9,
                        margin: EdgeInsets.only(top: size.height * 0.1),
                        decoration: BoxDecoration(
                            color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: primaryShadow),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15,top: 55
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              TextFieldWithShadow(
                                hintText: language.name,
                                 controller: nameController,
                              ),
                              SizedBox(height: 10),
                              TextFieldWithShadow(
                                hintText: language.email,
                                controller: emailController,
                              ),
                              SizedBox(height: 10),
                              LoadingButton(
                              //  isLoading: loginProvider.loading,
                                defaultStyle: true,
                                onPressed: () {
                                 // loginProvider.goToMainPage();
                                },
                                backgroundColor: primaryColor,
                                child: Container(
                                    height: 30,
                                    width: mainWidth - 20 - (Dimension.padding * 2),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Update',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: Dimension.textSizeBig,
                                          fontWeight: Dimension.boldText),
                                    )),
                              ),
                              SizedBox(height: 20),


                            ],
                          ),
                        ),
                      ),

                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: greyShadow
                            ),
                            child: CircleAvatar(
                              radius: 55,
                              backgroundColor: Color(0xffFDCF09),
                              child: _image != null
                                  ? ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.file(
                                  _image,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.fitHeight,
                                ),
                              )
                                  : Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(50)),
                                width: 100,
                                height: 100,
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.grey[800],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: GestureDetector(
                              onTap: (){
                                _showPicker(context);
                                showToast('clicked');
                              },
                              child: Container(
                                  height: size.height * 0.05,
                                  width: size.height * 0.05,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: editButtonBg,
                                  ),
                                  child: Center(
                                    child:
                                    Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                          size: size.height * 0.02,
                                        ),
                                  )),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }


}
