import 'package:alluredesigns_adminapp/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String loginEmail;
  String loginPassword;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp();
  }

  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: ListView(
        children: [
          SizedBox(
            height: 300.0,
          ),
          ProfileLabel(
            label: 'E-Mail : ',
          ),
          ProfileTextField(
            onChanged: (value) {
              loginEmail = value;
            },
            labelHint: 'Enter e-mail ID...',
            controller: emailController,
            textInputType: TextInputType.emailAddress,
          ),
          ProfileLabel(
            label: 'Password : ',
          ),
          Container(
            margin: EdgeInsets.only(
              right: 20.0,
              left: 20.0,
            ),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              key: widget.key,
              controller: passwordController,
              style: TextStyle(
                height: 1.0,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Enter the password...',
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 10.0,
                ),
                contentPadding: EdgeInsets.only(
                  top: 20.0,
                  left: 10.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
              ),
              onChanged: (value) {
                loginPassword = value;
              },
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 150.0,
            ),
            child: MaterialButton(
              color: kOurThemeColor,
              onPressed: () async {
                try {
                  final user = await _auth.signInWithEmailAndPassword(
                    email: loginEmail,
                    password: loginPassword,
                  );
                  if (user != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminAppHomePage(),
                      ),
                    );
                  }
                } catch (e) {
                  if (loginEmail == null || loginEmail == "") {
                    Fluttertoast.showToast(
                        msg: 'E-Mail field cannot be left blank.');
                  } else if (loginPassword == null || loginPassword == "") {
                    Fluttertoast.showToast(
                        msg: 'Password field should not be left blank.');
                  } else {
                    Fluttertoast.showToast(
                        msg: 'The password or email you typed is wrong.');
                  }
                }
              },
              child: Text(
                "Log In",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class Register extends StatefulWidget {
//   @override
//   _RegisterState createState() => _RegisterState();
// }
//
// class _RegisterState extends State<Register> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Firebase.initializeApp().whenComplete(() {
//       print("completed");
//       setState(() {});
//     });
//   }
//
//   TextEditingController registerEmailController = TextEditingController();
//   TextEditingController registerPasswordController = TextEditingController();
//   String registerEmail;
//   String registerPassword;
//   final _auth = FirebaseAuth.instance;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           SizedBox(
//             height: 30.0,
//           ),
//           ProfileLabel(
//             label: 'E-Mail : ',
//           ),
//           ProfileTextField(
//             onChanged: (value) {
//               registerEmail = value;
//             },
//             labelHint: 'Enter e-mail ID...',
//             controller: registerEmailController,
//             textInputType: TextInputType.emailAddress,
//           ),
//           ProfileLabel(
//             label: 'password : ',
//           ),
//           Container(
//             margin: EdgeInsets.only(
//               right: 20.0,
//               left: 20.0,
//             ),
//             child: TextFormField(
//               keyboardType: TextInputType.emailAddress,
//               obscureText: true,
//               key: widget.key,
//               controller: registerPasswordController,
//               style: TextStyle(
//                 height: 1.0,
//                 color: Colors.black,
//               ),
//               decoration: InputDecoration(
//                 isDense: true,
//                 hintText: 'Enter the password...',
//                 hintStyle: TextStyle(
//                   color: Colors.black,
//                   fontSize: 10.0,
//                 ),
//                 contentPadding: EdgeInsets.only(
//                   top: 20.0,
//                   left: 10.0,
//                 ),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(5.0),
//                   ),
//                 ),
//               ),
//               onChanged: (value) {
//                 registerPassword = value;
//               },
//             ),
//           ),
//           SizedBox(
//             height: 50.0,
//           ),
//           MaterialButton(
//             onPressed: () async {
//               try {
//                 final newUser = await _auth.createUserWithEmailAndPassword(
//                     email: registerEmail, password: registerPassword);
//                 if (newUser != null) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => SignIn(),
//                     ),
//                   );
//                 }
//               } catch (e) {
//                 print(e);
//               }
//             },
//             child: Text("Register"),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
class ProfileTextField extends StatefulWidget {
  final labelHint;
  final controller;
  final textInputType;
  final Function onChanged;

  ProfileTextField({
    @required this.labelHint,
    @required this.controller,
    @required this.textInputType,
    @required this.onChanged,
  });

  @override
  _ProfileTextFieldState createState() => _ProfileTextFieldState();
}

class _ProfileTextFieldState extends State<ProfileTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            right: 20.0,
            left: 20.0,
          ),
          child: TextFormField(
            keyboardType: widget.textInputType,
            key: widget.key,
            controller: widget.controller,
            style: TextStyle(
              height: 1.0,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              isDense: true,
              hintText: widget.labelHint,
              hintStyle: TextStyle(
                color: Colors.black,
                fontSize: 10.0,
              ),
              contentPadding: EdgeInsets.only(
                top: 20.0,
                left: 10.0,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
            ),
            onChanged: widget.onChanged,
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
      ],
    );
  }
}

class ProfileLabel extends StatelessWidget {
  final String label;

  ProfileLabel({
    @required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        bottom: 10.0,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14.0,
        ),
      ),
    );
  }
}
