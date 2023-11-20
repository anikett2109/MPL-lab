
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portal_app/model/post.dart';
import 'package:portal_app/screens/Startup_data_page.dart';
import 'package:portal_app/screens/invested_money_page.dart';
import 'package:portal_app/screens/investor_page.dart';
import 'package:portal_app/screens/landing_page.dart';
import 'package:portal_app/screens/ngos_page.dart';
import 'package:portal_app/services/post_services.dart'; // Assuming you have this file with the fetchPosts function

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Post>> posts;

  @override
  void initState() {
    super.initState();
    posts = fetchPosts();
  }

  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'STARTUPS'),
    const Tab(text: 'INVESTORS'),
    const Tab(text: 'NGOs'),
  ];
  

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LandingPage()));
                },
                icon: const Icon(
                  Icons.dashboard,
                  size: 25,
                ))
          ],
          bottom: TabBar(
            tabs: myTabs,
            labelColor: Colors.blue, // Set the label/text color
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.red,
          ),
        ),
        body: TabBarView(
          children: [
            FutureBuilder<List<Post>>(
              future: posts,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No posts available.'));
                } else {
                  List<Post> posts = snapshot.data!;
                  return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      Post post = posts[index];
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          // height: MediaQuery.of(context).size.height / 1.5,
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
                                        post.usercompany,
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
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            post.image),
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
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DataAnalysisPage()));
                                        },
                                        child: const Icon(
                                          Icons.analytics_outlined,
                                          size: 35,
                                          color: Colors.white,
                                        )),
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      InvestmentInsightsPage()));
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
                                    // Text(post.username , style: TextStyle(color: Colors.white, fontSize: 22),),
                                    Text(
                                      post.discription,
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
            InvestorPage(),
           NgoPostPage(),
          ]
        ),
      ),
    );
  }
}
