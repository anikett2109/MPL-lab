import 'package:cloud_firestore/cloud_firestore.dart';


Future<List<AddPost>> newfetchPosts() async {
  try {
    QuerySnapshot<Map<String, dynamic>> newpostSnap =
        await FirebaseFirestore.instance.collection('posts').get();

    List<AddPost> newposts = newpostSnap.docs.map((doc) {
      return AddPost(
        title: doc['title'],
        discription: doc['description'],
        usercompany: doc['usercompany'], 
        imageurl: doc['imageUrl'],
      );
    }).toList();

    // Print the fetched posts
    print(newposts);

    return newposts;
  } catch (e) {
    print('Error fetchingg posts: $e');
    return [];
  }
}
class AddPost {
  final String title;
  final String discription;
  final String usercompany;
  final String imageurl;

  

  AddPost({
    required this.title,
    required this.discription,
    required this.usercompany,
    required this.imageurl,
    
  });
}