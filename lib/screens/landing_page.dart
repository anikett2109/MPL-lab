import 'package:flutter/material.dart';
import 'package:portal_app/Auth/auth%20components/investor_signup.dart';
import 'package:portal_app/Auth/signup_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            
          Row(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                    onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SignUpPage()));
              },
                  child: Container(
                    height: 70,
                    width: 170,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Startup Login",style: TextStyle(color: Colors.white, fontSize: 22),),
                    )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InvestorSignUpPage()));
              },
                  child: Container(
                    height: 70,
                    width: 170,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(child: Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Text("Investor Login" , style: TextStyle(color: Colors.white, fontSize: 22),),
                    )),
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}