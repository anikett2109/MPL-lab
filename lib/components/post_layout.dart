import 'package:flutter/material.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 1.5,
        width: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(15),
          
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0 , top: 10),
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
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0 , top: 5),
                    child: Text("Name" , style: TextStyle(fontSize: 22, color: Colors.white),),
                  ),
                  const SizedBox(width: 240,),
                  const Icon(Icons.post_add_outlined, size: 30,color: Colors.white,)
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  image:  DecorationImage(image: AssetImage("assets/vintagewallp1.jpeg"), fit: BoxFit.cover)
                ),
              
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.favorite , size: 35,color: Colors.white,),
                  Icon(Icons.analytics, size: 35, color: Colors.white,),
                  Icon(Icons.money, size: 35, color: Colors.white,),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(15)
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("description"),
              ),
            )
          ],
        ),
      ),
    );
  }
}