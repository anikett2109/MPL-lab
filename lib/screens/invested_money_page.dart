import 'package:flutter/material.dart';

class InvestmentInsightsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 23, 45),
      appBar: AppBar(
        title: Text('Investment Insights'),
        backgroundColor: Color.fromARGB(255, 0, 23, 45),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            InvestmentCard(
              companyName: 'Company A',
              investedAmount: '\$1,000,000',
              investmentDate: '2023-01-15',
            ),
            InvestmentCard(
              companyName: 'Company B',
              investedAmount: '\$2,500,000',
              investmentDate: '2023-02-22',
            ),
            InvestmentCard(
              companyName: 'Company C',
              investedAmount: '\$1,200,000',
              investmentDate: '2023-03-10',
            ),
            // Add more InvestmentCard widgets as needed
          ],
        ),
      ),
    );
  }
}

class InvestmentCard extends StatelessWidget {
  final String companyName;
  final String investedAmount;
  final String investmentDate;

  InvestmentCard({
    required this.companyName,
    required this.investedAmount,
    required this.investmentDate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            SizedBox(height: 8.0),
            Text('Invested Amount: $investedAmount', style: TextStyle(color: Colors.green, fontSize: 15)),
            SizedBox(height: 8.0),
            Text('Investment Date: $investmentDate', style: TextStyle(color: Colors.white, fontSize: 15)),
          ],
        ),
      ),
    );
  }
}

