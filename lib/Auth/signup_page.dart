
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portal_app/Auth/auth%20components/auth_textfield.dart';
import 'package:portal_app/components/BottomNavigation/bottomNavigation.dart';
import 'package:portal_app/screens/landing_page.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final TextEditingController _phoneOrEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signIn(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _phoneOrEmailController.text,
        password: _passwordController.text,
      );

      // If sign-in is successful, you can navigate to another screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Navigation()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('user not found'),
        ),
      );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Wrong email or password'),
        ),
      );
      }
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF001F3F),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
             onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LandingPage()));
              },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
                child: Text(
              "PORTAL",
              style: GoogleFonts.playfairDisplay(fontSize: 20),
            )),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFF001F3F),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(color: Color(0xFF001F3F)),
                child: Text(
                  "Let's Sign You in.\nWelcome Back",
                  style: GoogleFonts.inter(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
            SizedBox(height: 20),
            PhoneEmailContainer(
              controller: _phoneOrEmailController,
              hintText: 'Phone,Email or Username',
            ),
            SizedBox(height: 20),
            PhoneEmailContainer(
              controller: _passwordController,
              hintText: 'Password',
              
            ),
            SizedBox(height: 25),
            GestureDetector(
              onTap: () {
          _signIn(context);
          print("tapped"); // Call signup function on button tap
        },
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Text(
                      "Login",
                      style: GoogleFonts.inter(color: Colors.white),
                    ),
                  ),
                ),
              
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(color: Color(0xFF001F3F)),
              child: Column(
                children: [
                  Text(
                    "Don't have an account? Register.",
                    style: GoogleFonts.inter(color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(child: Text("Register")),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
