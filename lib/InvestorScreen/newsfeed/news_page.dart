import 'package:flutter/material.dart';

class NewsPost {
  final String investorName;
  final String companyName;
  final String fundsInvested;
  final String description;

  NewsPost({
    required this.investorName,
    required this.companyName,
    required this.fundsInvested,
    required this.description,
  });
}

class NewsPostPage extends StatelessWidget {
  final List<NewsPost> newsPosts = [
    NewsPost(
      investorName: 'TIGER GLOBAL',
      companyName: 'Tech Innovations',
      fundsInvested: '\$1,000,000', 
      description: 'Starting a new journey with ECX technology, Now Expanding in Europe ',
    
    ),
    NewsPost(
      investorName: 'MATRIX',
      companyName: 'Health Solutions',
      fundsInvested: '\$500,000', 
      description: 'MATRIX Ventures recently made a strategic investment in MedHealth Innovations, a pioneering healthcare company focused on leveraging advanced technologies to improve patient outcomes. This partnership signifies ABC Ventures commitment to fostering innovation in the healthcare sector. With a keen interest in MedHealths cutting-edge solutions, ABC Ventures aims to contribute to the growth of transformative healthcare technologies that enhance accessibility, efficiency, and overall well-being. This investment reflects ABC Ventures strategic vision to support companies at the forefront of shaping the future of healthcare through technological advancements and groundbreaking solutions',
    ),
    NewsPost(
      investorName: 'TIGER GLOBAL',
      companyName: 'Tech Innovations',
      fundsInvested: '\$1,000,000', 
      description: 'Starting a new journey with ECX technology, Now Expanding in Europe ',
    
    ),
    // Add more NewsPost objects as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 23, 45),
      body: ListView.builder(
        itemCount: newsPosts.length,
        itemBuilder: (context, index) {
          return NewsPostCard(newsPost: newsPosts[index]);
        },
      ),
    );
  }
}

class NewsPostCard extends StatelessWidget {
  final NewsPost newsPost;

  NewsPostCard({required this.newsPost});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF001F3F),
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Investor: ${newsPost.investorName}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            SizedBox(height: 8.0),
            Text(
              'Company: ${newsPost.companyName}',
              style: TextStyle(fontSize: 16.0,color: Colors.white),
            ),
            SizedBox(height: 8.0),
            Text(
              'Funds Invested: ${newsPost.fundsInvested}',
              style: TextStyle(fontSize: 16.0, color: Colors.red),
            ),
            SizedBox(height: 8.0),
            Text(
              'Description: \n\n${newsPost.description}',
              style: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

