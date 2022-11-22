import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    logic l = Get.put(logic());

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Login Panel",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19),
        ),
        backgroundColor: Color(0xff040065),
      ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Image.network(
                      'https://t3.ftcdn.net/jpg/03/39/70/90/360_F_339709048_ZITR4wrVsOXCKdjHncdtabSNWpIhiaR7.jpg'),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Obx(() => TextField(
                    onChanged: (value) {
                      print(value);
                      l.EmailError(value);
                    },
                    controller: l.email,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Color(0xff040065), width: 3)),
                        border: OutlineInputBorder(),
                        hintText: "Enter Email Address",
                        labelText: "Email",
                        labelStyle: TextStyle(color: Color(0xff040065)),
                        errorText: l.emailerror.value ? l.emailmsg.value : null,
                        prefixIcon: Icon(
                          Icons.email_rounded,
                          color: Color(0xff040065),
                        )),
                  ),)
                ),

                Padding(
                  padding:
                  const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 3),
                  child: Obx(() => TextField(
                    onChanged: (value) {
                      print(value);
                      l.PassError(value);
                    },
                    controller: l.Password,
                    obscureText: l.hidepass.value,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Color(0xff040065), width: 3)),
                        border: OutlineInputBorder(),
                        hintText: "Enter Your Password",
                        labelText: "Password",
                        labelStyle: TextStyle(color: Color(0xff040065)),
                        suffixIcon: IconButton(
                            onPressed: () {
                              l.HidePass();
                            },
                            icon: l.hidepass.value
                                ? Icon(
                              Icons.visibility,
                              color: Color(0xff040065),
                            )
                                : Icon(
                              Icons.visibility_off,
                              color: Color(0xff676767),
                            )),
                        errorText: l.passerror.value ? l.passmsg.value : null,
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Color(0xff040065),
                        )),
                  ),)
                ),

                InkWell(
                  onTap: () {
                    l.btnerrors();
                  },
                  child: Container(
                    height: 50,
                    width: 120,
                    margin: EdgeInsets.only(left: 120, right: 120, top: 10),
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
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),

                Container(
                  height: 17,
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  child: Text("--------------- Or Signin with ---------------",style: TextStyle(color: Colors.grey),),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {

                      },
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
                        child: Image.asset('image/google.png'),padding: EdgeInsets.all(10),
                      ),
                    ),
                    InkWell(
                      onTap: () {

                      },
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
                        child: Image.asset('image/facebook.png'),padding: EdgeInsets.all(10),
                      ),
                    ),
                    InkWell(
                      onTap: () {

                      },
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
                        child: Image.asset('image/twitter.png'),padding: EdgeInsets.all(10),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
    ));
  }
}


class logic extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController Password = TextEditingController();

  RxBool emailerror = false.obs;
  RxBool passerror = false.obs;
  RxBool hidepass = true.obs;

  RxString emailmsg = "".obs;
  RxString passmsg = "".obs;

  void EmailError(String value) {
    if (emailerror.value) {
      if (value.isNotEmpty) {
        emailerror.value = false;
      }
    }
  }

  void PassError(String value) {
    if (passerror.value) {
      if (value.isNotEmpty) {
          passerror.value = false;
      }
    }
  }

  void btnerrors() {
    String Email = email.text;
    String pass = Password.text;

    bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(Email);
    bool passValid = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(pass);

    if (Email.isEmpty) {
      emailerror.value = true;
      emailmsg.value = "Enter Email Address";
    } else if (!emailValid) {
      emailerror.value = true;
      emailmsg.value = "Please Enter Valid Email Address";
    }else if (pass.isEmpty) {
      passerror.value = true;
      passmsg.value = "Enter your password";
    } else if (!passValid) {
      passerror.value = true;
      passmsg.value = "Please Enter Valid Formatted password";
    }
  }

  void HidePass() {
    hidepass.value = !hidepass.value;
  }

}
