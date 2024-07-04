import 'package:flutter/material.dart';
import 'package:flutter_advance/utils/code_display.dart';
import 'package:flutter_advance/utils/codes/my_codes.dart';

class FlutterForms extends StatefulWidget {
  const FlutterForms({super.key});

  @override
  State<FlutterForms> createState() => _FlutterFormsState();
}

class _FlutterFormsState extends State<FlutterForms> {
  //controllers
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  //form key
  final key = GlobalKey<FormState>();
  /*
  Discards any resources used by the object. After this is called, the object is not in a usable state and should be discarded (calls to [addListener] will throw after the object is disposed).
This method should only be called by the object's owner.
   */
  //disposing
  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Forms"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white12,
              margin: const EdgeInsets.all(20),
              child: Form(
                //adding key
                key: key,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: name,
                        decoration: const InputDecoration(
                          hintText: "name",
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        //validator
                        validator: (value) {
                          if (value!.isEmpty || value.toString().isEmpty) {
                            return "enter name";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: email,
                        decoration: const InputDecoration(
                          hintText: "email",
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        //validator
                        validator: (value) {
                          if (value!.isEmpty || value.toString().isEmpty) {
                            return "enter email";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        //secure
                        obscureText: true,
                        controller: password,
                        decoration: const InputDecoration(
                          hintText: "password",
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        //validator
                        validator: (value) {
                          if (value!.isEmpty || value.toString().isEmpty) {
                            return "enter passowrd";
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        //secure
                        obscureText: true,
                        controller: confirmPassword,
                        decoration: const InputDecoration(
                          hintText: "confirm password",
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        //validator
                        validator: (value) {
                          if (value!.isEmpty || value.toString().isEmpty) {
                            return "enter confirm password";
                          } else {
                            return null;
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: TextButton(
                          onPressed: () {
                            if (password.text == confirmPassword.text) {
                              //using key
                              if (key.currentState!.validate()) {
                                //clear controllers
                                name.clear();
                                email.clear();
                                password.clear();
                                confirmPassword.clear();
                                //sanack bar
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Congrats Accout created!",
                                    ),
                                  ),
                                );
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                    "Password Dont Match!",
                                  ),
                                ),
                              );
                            }
                          },
                          child: const Text("Validate"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            CodeDisplay(
              text: MyCodes().form,
            ),
          ],
        ),
      ),
    );
  }
}
