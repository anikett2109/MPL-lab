import 'package:flutter/material.dart';

class NgoPost {
  final String name;
  final String agenda;
  final String fundsRaised;
  final int likesCount;
  final int commentsCount;

  NgoPost({
    required this.name,
    required this.agenda,
    required this.fundsRaised,
    required this.likesCount,
    required this.commentsCount,
  });
}

class NgoPostPage extends StatelessWidget {
  final List<NgoPost> posts = [
    NgoPost(
      name: 'Charity Foundation',
      agenda: 'Providing education for underprivileged children',
      fundsRaised: '\$50,000',
      likesCount: 120,
      commentsCount: 25,
    ),
    NgoPost(
      name: 'Health Care Initiative',
      agenda: 'Improving healthcare accessibility in rural areas',
      fundsRaised: '\$75,000',
      likesCount: 2200,
      commentsCount: 600,
    ),
    NgoPost(
      name: 'Swatch Bharat',
      agenda: 'Building an application which inform about dirty location',
      fundsRaised: '\$15,000',
      likesCount: 1000,
      commentsCount: 300,
    ),
    NgoPost(
      name: 'Health Care Initiative',
      agenda: 'Improving healthcare accessibility in rural areas',
      fundsRaised: '\$75,000',
      likesCount: 100,
      commentsCount: 10,
    ),
    // Add more NgoPost objects as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 23, 45),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return NgoPostCard(post: posts[index]);
        },
      ),
    );
  }
}

class NgoPostCard extends StatelessWidget {
  final NgoPost post;

  NgoPostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF001F3F),
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
   
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.name,
                  style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
               const  SizedBox(height: 8.0),
                Text(
                  'Agenda: ${post.agenda}',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
               const  SizedBox(height: 8.0),
                Text('Funds Raised: ${post.fundsRaised}',
                    style: TextStyle(color: Colors.white, fontSize: 15)),
               const  SizedBox(
                  height: 8.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.favorite_border,
                            size: 30,
                            color: Colors.red,
                          ),
                          onPressed: () {},
                        ),
                        Text('${post.likesCount}',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.comment,
                            size: 30,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                        Text('${post.commentsCount}',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          
        ],
        
      ),
    );
  }
}
