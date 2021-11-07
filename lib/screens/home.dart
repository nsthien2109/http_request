import 'package:flutter/material.dart';
import 'package:http_request/model/post_model.dart';
import 'package:http_request/network/network_request.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Post> postData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NetworkRequest.fetchPosts().then((dataFromServer) {
        setState(() {
          postData = dataFromServer;
        });
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HTTP REQUEST"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children : [
          Expanded(
          child: ListView.separated(
              itemBuilder: (context ,index){
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.circular(20)
                  ),
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(postData[index].title.toString()),
                      ],
                    ),
                  );
              },
              itemCount: postData.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10,);
                },
         ),
        ), ]
      ),
    );
  }
}
