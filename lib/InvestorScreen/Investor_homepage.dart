import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portal_app/InvestorScreen/newsfeed/news_page.dart';
import 'package:portal_app/screens/ngos_page.dart';
import 'package:portal_app/services/addPost_services.dart';
// Assuming you have this file with the fetchPosts function

class InvestorHomePage extends StatefulWidget {
  @override
  _InvestorHomePageState createState() => _InvestorHomePageState();
}

class _InvestorHomePageState extends State<InvestorHomePage> {
  late Future<List<AddPost>> newposts;

  @override
  void initState() {
    super.initState();
    newposts = newfetchPosts();
  }

  final List<Tab> InvestorTabs = <Tab>[
    const Tab(text: 'STARTUPS'),
    const Tab(text: 'NEWS'),
    const Tab(text: 'NGOs'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: InvestorTabs.length,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 23, 45),
        appBar: AppBar(
          backgroundColor: const Color(0xFF001F3F),
          centerTitle: true,
          title: Text(
            "PORTAL",
            style: GoogleFonts.judson(fontSize: 31),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.dashboard,
                  size: 25,
                ))
          ],
          bottom: TabBar(
            tabs: InvestorTabs,
            labelColor: Colors.blue, // Set the label/text color
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.red,
          ),
        ),
        body: TabBarView(children: [
          FutureBuilder<List<AddPost>>(
            future: newposts,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No posts available.'));
              } else {
                List<AddPost> newposts = snapshot.data!;
                return ListView.builder(
                  itemCount: newposts.length,
                  itemBuilder: (context, index) {
                    AddPost posts = newposts[index];
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        
                        width: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          color: const Color(0xFF001F3F),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, top: 10),
                              child: Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 10.0, top: 5),
                                    child: Text(
                                      posts.usercompany,
                                      style: const TextStyle(
                                          fontSize: 22, color: Colors.white),
                                    ),
                                  ),
                                  // const SizedBox(width: 200,),
                                  // const Icon(Icons.post_add_outlined, size: 30,color: Colors.white,)
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 3,
                              width: MediaQuery.of(context).size.height,
                              decoration:  BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(posts.imageurl.isNotEmpty ? posts.imageurl : 'https://imgs.search.brave.com/8iQ3VMIABqU9vP7A1CG_EN1MlSX5xzt6PLVIntYI-2k/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/ZnJlZS1waG90by96/ei1wbGFudC1ncmF5/LXBvdF81Mzg3Ni0x/MzQyODUuanBnP3Np/emU9NjI2JmV4dD1q/cGc'),
                                      fit: BoxFit.cover)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                      onTap: () {},
                                      child: const Icon(
                                        Icons.favorite_outline,
                                        size: 35,
                                        color: Colors.white,
                                      )),
                                  GestureDetector(
                                      onTap: () {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             DataAnalysisPage()));
                                      },
                                      child: const Icon(
                                        Icons.analytics_outlined,
                                        size: 35,
                                        color: Colors.white,
                                      )),
                                  GestureDetector(
                                      onTap: () {
                                        print("tapped");
                                      },
                                      child: const Icon(
                                        Icons.attach_money_rounded,
                                        size: 35,
                                        color: Colors.white,
                                      )),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(83, 158, 158, 158),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(children: [
                                  // Text(posts.username , style: TextStyle(color: Colors.white, fontSize: 22),),
                                  Text(
                                    posts.discription,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )
                                ]),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
          NewsPostPage(),
          NgoPostPage(),
        ]),
      ),
    );
  }
}
