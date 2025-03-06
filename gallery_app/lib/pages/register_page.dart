import 'package:gallery_app/components/my_button.dart';
import 'package:gallery_app/components/my_textfield.dart';
import 'package:gallery_app/components/square_tile.dart';
import 'package:gallery_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  //signUserIn method
  void signUserUp() async {
    // Show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
//try creating the user
    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        //show error message password don't match
        showErrorMessage("Passwords do not match");
      }
      // Pop the loading circle
      Navigator.pop(context);
      // Navigate to another page if login is successful
    } on FirebaseAuthException catch (e) {
      // Pop the loading circle
      Navigator.pop(context);

      // show error message
      showErrorMessage(e.code);
    }
  }

  //error message to user
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: const Color.fromARGB(255, 218, 253, 226),
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.8, 1),
          colors: <Color>[
            Color(0xff1f005c),
            Color(0xff5b0060),
            Color(0xff870160),
            Color(0xffac255e),
            Color(0xffca485c),
            Color(0xffe16b5c),
            Color(0xfff39060),
            Color(0xffffb56b),
          ], // Gradient from https://learnui.design/tools/gradient-generator.html
          tileMode: TileMode.mirror,
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 0),
              //logo
              /* const Icon(
                Icons.person,
                size: 200,
                color: Color.fromARGB(255, 4, 104, 255),
              ),*/
              Container(
                height: 250,
                padding: EdgeInsets.all(20),
                child: Image.asset('lib/images/face-scan.png'),
              ),
              const SizedBox(height: 2),

              //LET US CREATE AN ACCOUNT FOR YOU !
              Text(
                'CREATE AN ACCOUNT !',
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              //username textfield
              MyTextField(
                controller: emailController,
                hintText: 'Username',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              //password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 10),
              //confirm password
              MyTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm Password',
                obscureText: true,
              ),
              const SizedBox(height: 20),

              //sign up button
              MyButton(
                text: "Sign Up",
                onTap: signUserUp,
              ),

              const SizedBox(height: 20),

              //or continue with
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        color: const Color.fromARGB(255, 95, 93, 93),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        color: const Color.fromARGB(255, 95, 93, 93),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              //google+apple sign in button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(
                      onTap: () => AuthService().signInWithGoogle(),
                      imagePath: 'lib/images/googleLogo2.webp'),
                ],
              ),

              //not a member? register now
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account ? ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 25),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Login now',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 22, 63, 246),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
