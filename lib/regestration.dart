import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:getwidget/getwidget.dart';
import 'package:http/http.dart' as http;

import 'Login.dart';

class regestration extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    A a = Get.put(A());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Regestration",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),
          ),
          backgroundColor: Color(0xff040065),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          title: Text("Select Image "),
                          children: [
                            ListTile(
                              title: Text("Camera"),
                              onTap: () {
                                Navigator.pop(context);

                                a.Camera();
                              },
                            ),
                            ListTile(
                              title: Text("Gallary"),
                              onTap: () {
                                Navigator.pop(context);

                                a.Gallary();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Obx(() => Container(
                        margin: EdgeInsets.only(
                            left: 145, right: 145, top: 10, bottom: 10),
                        height: 100,
                        width: 100,
                        decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: Colors.transparent,
                            image: DecorationImage(
                                image: a.imagePath.isNotEmpty
                                    ? FileImage(
                                        File(a.imagePath.value),
                                      ) as ImageProvider
                                    : AssetImage(
                                        'image/person-man.webp',
                                      ),
                                fit: BoxFit.fill)),
                      ))),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Obx(
                    () => TextField(
                      onChanged: (value) {
                        print(value);
                        a.nameError(value);
                      },
                      controller: a.name,
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: Color(0xff040065)),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff040065), width: 3)),
                          border: OutlineInputBorder(),
                          hintText: "Enter Name",
                          labelText: "Name",
                          labelStyle: TextStyle(color: Color(0xff040065)),
                          errorText: a.nameerror.value
                              ? "Please Enter Valid Name"
                              : null,
                          prefixIcon: Icon(
                            Icons.person,
                            color: Color(0xff040065),
                          )),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Obx(
                    () => TextField(
                      onChanged: (value) {
                        print(value);
                        a.emailError(value);
                      },
                      controller: a.email,
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: Color(0xff040065)),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff040065), width: 3)),
                          border: OutlineInputBorder(),
                          hintText: "Enter Email Address",
                          labelText: "Email",
                          labelStyle: TextStyle(color: Color(0xff040065)),
                          errorText:
                              a.emailerror.value ? a.emailmsg.value : null,
                          prefixIcon: Icon(
                            Icons.email_rounded,
                            color: Color(0xff040065),
                          )),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Obx(
                    () => TextField(
                      onChanged: (value) {
                        a.contactError(value);
                      },
                      controller: a.contact,
                      keyboardType: TextInputType.phone,
                      style: TextStyle(color: Color(0xff040065)),
                      maxLength: 10,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff040065))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff040065), width: 3)),
                          counter: Offstage(),
                          suffixText:
                              '${a.textLength.toString()}/${a.maxLength.toString()}',
                          hintText: "Enter Your Contact",
                          labelText: "Contact",
                          labelStyle: TextStyle(color: Color(0xff040065)),
                          errorText:
                              a.contacterror.value ? a.contactmsg.value : null,
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Color(0xff040065),
                          )),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, bottom: 10, top: 3),
                  child: Obx(
                    () => TextField(
                      onChanged: (value) {
                        print(value);
                        a.passError(value);
                      },
                      controller: a.Password,
                      obscureText: a.hidepass.value,
                      style: TextStyle(color: Color(0xff040065)),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff040065), width: 3)),
                          border: OutlineInputBorder(),
                          hintText: "Enter Your Password",
                          labelText: "Password",
                          labelStyle: TextStyle(color: Color(0xff040065)),
                          suffixIcon: IconButton(
                              onPressed: () {
                                a.hidePass();
                              },
                              icon: a.hidepass.value
                                  ? Icon(
                                      Icons.visibility,
                                      color: Color(0xff040065),
                                    )
                                  : Icon(
                                      Icons.visibility_off,
                                      color: Color(0xff676767),
                                    )),
                          errorText: a.passerror.value ? a.passmsg.value : null,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color(0xff040065),
                          )),
                    ),
                  )),
              InkWell(
                onTap: () {

                      a.logics(context);
                },
                child: Container(
                  height: 50,
                  width: 120,
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                      color: Color(0xff040065),
                      shadows: [
                        BoxShadow(
                            blurRadius: 7,
                            spreadRadius: 1,
                            offset: Offset(0, 3),
                            color: Colors.black.withOpacity(0.4))
                      ],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    "SignUp",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              Center(
                  child: TextButton(
                      onPressed: () {
                        Get.to(Login());
                      },
                      child: Text(
                        "Already Login ?",
                        style: TextStyle(fontSize: 20),
                      ))),
              Container(
                height: 17,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 15, top: 10),
                alignment: Alignment.center,
                child: Text(
                  "--------------- Or Signup with ---------------",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.only(top: 20),
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                          color: Color(0xffffffff),
                          shadows: [
                            BoxShadow(
                                blurRadius: 7,
                                spreadRadius: 1,
                                offset: Offset(0, 3),
                                color: Colors.black.withOpacity(0.4))
                          ],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Image.asset('image/google.png'),
                      padding: EdgeInsets.all(10),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.only(top: 20),
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                          color: Color(0xffffffff),
                          shadows: [
                            BoxShadow(
                                blurRadius: 7,
                                spreadRadius: 1,
                                offset: Offset(0, 3),
                                color: Colors.black.withOpacity(0.4))
                          ],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Image.asset('image/facebook.png'),
                      padding: EdgeInsets.all(10),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.only(top: 20),
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                          color: Color(0xffffffff),
                          shadows: [
                            BoxShadow(
                                blurRadius: 7,
                                spreadRadius: 1,
                                offset: Offset(0, 3),
                                color: Colors.black.withOpacity(0.4))
                          ],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Image.asset('image/twitter.png'),
                      padding: EdgeInsets.all(10),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class A extends GetxController {
  ImagePicker _picker = ImagePicker();
  RxString imagePath = "".obs;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController contact = TextEditingController();

  RxBool nameerror = false.obs;
  RxBool namevalid = false.obs;
  RxBool emailerror = false.obs;
  RxBool passerror = false.obs;
  RxBool contacterror = false.obs;
  RxBool hidepass = true.obs;

  RxInt textLength = 0.obs;
  RxInt maxLength = 10.obs;

  RxString contactmsg = "".obs;
  RxString emailmsg = "".obs;
  RxString passmsg = "".obs;

  void nameError(String value) {
    if (nameerror.value) {
      if (value.isNotEmpty) {
        nameerror.value = false;
      }
    }
  }

  void emailError(String value) {
    if (emailerror.value) {
      if (value.isNotEmpty) {
        emailerror.value = false;
      }
    }
  }

  void contactError(String value) {
    textLength.value = value.length;
    if (contacterror.value) {
      if (value.isNotEmpty) {
        contacterror.value = false;
      }
    }
  }

  void passError(String value) {
    if (passerror.value) {
      if (value.isNotEmpty) {
        passerror.value = false;
      }
    }
  }

  void hidePass() {
    hidepass.value = !hidepass.value;
  }

  Future<void> logics(BuildContext context) async {
    String Name = name.text;
    String Phone = contact.text;
    String Email = email.text;
    String pass = Password.text;
    // Map m = {'name': Name, 'phone': Phone, 'email': Email, 'pass': pass};

    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(Email);
    bool passValid =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
            .hasMatch(pass);

    String link = "https://flutteranadh.000webhostapp.com/register.php";

    if (Name.isEmpty) {
      nameerror.value = true;
    } else if (Email.isEmpty) {
      emailerror.value = true;
      emailmsg.value = "Enter Email Address";
    } else if (!emailValid) {
      emailerror.value = true;
      emailmsg.value = "Please Enter Valid Email Address";
    } else if (Phone.isEmpty) {
      contacterror.value = true;
      contactmsg.value = "Enter your Contact";
    } else if (Phone.length < 10) {
      contacterror.value = true;
      contactmsg.value = "Please Enter 10 digit Contact";
    } else if (pass.isEmpty) {
      passerror.value = true;
      passmsg.value = "Enter your password";
    } else if (!passValid) {
      passerror.value = true;
      passmsg.value = "Please Enter Valid Formatted password";
    } else {

      showDialog(context: context, builder: (context) {
        return SimpleDialog(
          children: [
            Container(
              height: 60,
              child: ListTile(
                leading: Container(
                  height: 45,
                  width: 45,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                ),
                title: Text(
                  "Please Wait ...",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        );
      },);


      var formData = FormData.fromMap({
        'name': Name, 'phone': Phone, 'email': Email, 'pass': pass,
        'file': await MultipartFile.fromFile('./text.txt', filename: 'upload.txt'),
      });
      var response = await Dio().post('/info', data: formData);
      //http for small data send to php file
      // var url = Uri.parse(link);
      // var response = await http.post(url, body: m);
      //
      // Navigator.pop(context);
      //
      // print('Response status: ${response.statusCode}');
      //
      // if (response.statusCode == 200) {
      //   print('Response body: ${response.body}');
      // }
    }
  }

  Future<void> Camera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      imagePath.value = photo.path;
    }
    print(imagePath);
  }

  Future<void> Gallary() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);

    if (photo != null) {
      imagePath.value = photo.path;
    }
    print(photo!.path);
  }
}


