import 'package:flutter/material.dart';

class InvestorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 23, 45),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          InvestorCard(
            companyName: 'KLEINER PERKINS',
            experience: '5 years',
            investedAmount: '\$1,000,000',
            fieldOfInterest: 'Technology',
          ),
          SizedBox(height: 16.0),
          InvestorCard(
            companyName: 'SEQUOIA CAPITAL',
            experience: '20+ years',
            investedAmount: '\$5,500,000',
            fieldOfInterest: 'Business',
          ),
          InvestorCard(
            companyName: 'MATRIX',
            experience: '8+ years',
            investedAmount: '\$2,500,000',
            fieldOfInterest: 'AR/VR Gaming',
          ),
          InvestorCard(
            companyName: 'TIGER VENTURES',
            experience: '15+ years',
            investedAmount: '\$1,500,000',
            fieldOfInterest: 'Business',
          ),
          InvestorCard(
            companyName: 'ACCEL',
            experience: '8 years',
            investedAmount: '\$2,500,000',
            fieldOfInterest: 'Healthcare',
          ),
          InvestorCard(
            companyName: 'SILICON',
            experience: '10+ years',
            investedAmount: '\$2,500,000',
            fieldOfInterest: 'Tech',
          ),
          // Add more InvestorCard widgets as needed
        ],
      ),
    );
  }
}

class InvestorCard extends StatelessWidget {
  final String companyName;
  final String experience;
  final String investedAmount;
  final String fieldOfInterest;

  InvestorCard({
    required this.companyName,
    required this.experience,
    required this.investedAmount,
    required this.fieldOfInterest,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => DetailInvestorPage(),
      //           ),
      //         );
      // },
      child: Card(
        color: Color(0xFF001F3F),
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                companyName,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold , color: Colors.red),
              ),
              SizedBox(height: 8.0),
              Text('Experience: $experience',style: TextStyle(color: Colors.white, fontSize: 20),),
              SizedBox(height: 8.0),
              Text('Invested Amount: $investedAmount',style: TextStyle(color: Colors.green, fontSize: 15),),
              SizedBox(height: 8.0),
              Text('Field of Interest: $fieldOfInterest',style: TextStyle(color: Colors.white, fontSize: 15),),
            ],
          ),
        ),
      ),
    );
  }
}

