import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portal_app/model/post.dart';

Future<List<Post>> fetchPosts() async {
  try {
    QuerySnapshot<Map<String, dynamic>> postSnap =
        await FirebaseFirestore.instance.collection('post').get();

    List<Post> posts = postSnap.docs.map((doc) {
      return Post(
        userid: doc['userid'],
        username: doc['username'],
        title: doc['title'],
        discription: doc['discription'],
        usercompany: doc['usercompany'],
        image: doc['image'],
      );
    }).toList();

    // Print the fetched posts
    print(posts);

    return posts;
  } catch (e) {
    print('Error fetchingg posts: $e');
    return [];
  }
}
