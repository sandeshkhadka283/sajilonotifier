import 'package:dio/dio.dart';
import 'package:finalyearproject/ApiRequest/SignupRequest.dart';
import 'package:finalyearproject/Screen/HomeScreen.dart';
import 'package:finalyearproject/Services/DioClient.dart';
import 'package:finalyearproject/Utils/Helper.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  var _passwordVisible;

  //---------------Controllers----------------------------------------

  final firstName = TextEditingController();
  final lastName = TextEditingController();

  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  //----------------Sign UP API call  Dio Client  with try Catch -----------------------------------

  _signupApiCall(BuildContext context) async {
    try {
      SignupRequest signupRequest = SignupRequest(firstName.text, lastName.text,
          email.text, password.text, confirmPassword.text);

      final response = await DioClient.instance.signup(signupRequest);
      Helper.showShortToastSuccess("Successfully Signed IN");

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } on DioError catch (e) {
      Helper.showShortToast(e.response!.statusMessage);
      Helper.showSnackBar(context, e.response!.data);

      print(e.response);
    }
  }

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    // var _passwordVisible;

    var Width = MediaQuery.of(context).size.width;
    var Height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Sign Up',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            //------FORM FIELD -------------------------------------------
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      controller: firstName,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Enter Your Name';
                        }
                        if (value.length < 5) {
                          return 'Name too short';
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        prefixIcon: Icon(
                          Icons.people,
                          size: 18,
                          color: Colors.orange,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.black),
                        ),
                        labelText: 'First Name',
                        // floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelStyle: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 10, 9, 9),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      controller: lastName,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Enter Your Name';
                        }
                        if (value.length < 5) {
                          return 'Name too short';
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        prefixIcon: Icon(
                          Icons.people,
                          size: 18,
                          color: Colors.orange,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.black),
                        ),
                        labelText: 'Last Name',
                        // floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelStyle: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 10, 9, 9),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      controller: email,
                      validator: (String? value) {
                        // if (value!.isEmpty) {
                        //   return 'Enter your email';
                        // }
                        // if (value.length < 10) {
                        //   return 'Invalid ';
                        // }
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        prefixIcon: Icon(
                          Icons.phone,
                          size: 18,
                          color: Colors.orange,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.black),
                        ),
                        labelText: 'Email',
                        // floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelStyle: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 10, 9, 9),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      controller: password,
                      autocorrect: false,
                      enableSuggestions: false,
                      obscureText: !_passwordVisible,
                      validator: (password) {
                        if (password!.isEmpty) {
                          return 'Enter your Mobile Number';
                        }
                        bool isPasswordValid(String password) =>
                            password.length > 6;

                        if (isPasswordValid(password))
                          return null;
                        else
                          return 'Enter a valid password';
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(7),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.black),
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          size: 18,
                          color: Colors.orange,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.orange,
                            size: 20,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 10, 9, 9),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //----------------Confirm Password ----------------------

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      controller: confirmPassword,
                      autocorrect: false,
                      enableSuggestions: false,
                      obscureText: !_passwordVisible,
                      validator: (password) {
                        if (password!.isEmpty) {
                          return 'Enter your Mobile Number';
                        }
                        bool isPasswordValid(String password) =>
                            password.length > 6;

                        if (isPasswordValid(password))
                          return null;
                        else
                          return 'Enter a valid password';
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(7),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.black),
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          size: 18,
                          color: Colors.orange,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.orange,
                            size: 20,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        labelText: 'Confirm Password',
                        labelStyle: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 10, 9, 9),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "By signing in you hereby agree to the ",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.grey[700]),
                        ),
                        Expanded(
                          child: Text(
                            "Terms/Conditions ",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  //-------------Signup API call Button--------------------------------------

                  //  GestureDetector(
                  //   onTap: () {
                  //     if (_formKey.currentState!.validate()) {
                  //       print('After Validation before calling API');
                  //       _signupApiCall(context);
                  //     }
                  //   },

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(45),
                          primary: Colors.blue),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print('After Validation before calling API');
                          _signupApiCall(context);
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 18),
                        child: Text("Sign Up",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ),
                  // Container(
                  //   width: Width * 0.8,
                  //   height: Height * 0.05,
                  //   decoration: BoxDecoration(
                  //       color: Color.fromARGB(255, 89, 87, 226),
                  //       borderRadius:
                  //           BorderRadius.all(Radius.circular(20))),
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Center(
                  //         child: Text(
                  //       "Signup",
                  //       style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 15,
                  //           color: Colors.white),
                  //     )),
                  //   ),
                  // ),

                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),

            //---------Already Have an account section--------------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.grey[700]),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    " Login",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: Color.fromARGB(255, 17, 132, 247)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
