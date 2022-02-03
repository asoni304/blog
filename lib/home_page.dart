import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:async/async.dart';
import 'package:mans_voice/add_post.dart';
import 'dart:async';

import 'package:mans_voice/post_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late double deviceHeight;
  late double deviceWidth;



  late StreamSubscription<QuerySnapshot> subscription;

  late List<DocumentSnapshot> snapshot;

  CollectionReference collectionReference=FirebaseFirestore.instance.collection("Post");

  @override
  void initState() {
    super.initState();

    subscription=collectionReference.snapshots().listen((datasnapshot) {
      setState(() {
        snapshot=datasnapshot.docs;
      });
    });
}


  passData(DocumentSnapshot snapshot){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PostDetails(snapshot: snapshot)));
  }

  @override
  Widget build(BuildContext context) {
    deviceHeight=MediaQuery.of(context).size.height;
    deviceWidth=MediaQuery.of(context).size.width;

    return  Scaffold(
      appBar: AppBar(
        title: const Text('Man\'s Voice',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w500),),
        backgroundColor: Colors.black45,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search,color: Colors.white54,)),
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AddPost()));
          }, icon: const Icon(Icons.post_add_outlined,color: Colors.white54,))
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.black45,
        child: ListView(
          children:  [
            const UserAccountsDrawerHeader(
               accountName: Text('The Man',style: TextStyle(
                 color:Colors.white,
                 fontSize: 22,
                 fontWeight: FontWeight.w300
               ),),
                accountEmail:Text ('themanchronicles@themandaily.com',style: TextStyle(
                    color:Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                ),),
              decoration: BoxDecoration(
                color: Colors.white24
              ),
            ),
            const ListTile(
              leading: Icon(Icons.drive_file_rename_outline,color: Colors.red,),
              title: Text('The beginning',style: TextStyle(
                  color:Colors.black,
                  fontSize: 16,
              ),),
            ),
            const ListTile(
              leading: Icon(Icons.supervised_user_circle,color: Colors.red,),
              title: Text('What drives us?',style: TextStyle(
                color:Colors.black,
                fontSize: 16,
              ),),
            ),
            const ListTile(
              leading: Icon(Icons.query_builder_sharp,color: Colors.red,),
              title: Text('Choices',style: TextStyle(
                color:Colors.black,
                fontSize: 16,
              ),),
            ),
            const Divider(
              height: 10,
              color: Colors.white24,
            ),
            ListTile(
              trailing: const Icon(Icons.close,color: Colors.red,),
              title: const Text('Close',style: TextStyle(
                color:Colors.black,
                fontSize: 16,
              ),
              ),
              onTap: (){
                Navigator.pop(context);
              },

            ),


          ],
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Post').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {

        return ListView.builder(

          itemCount:  streamSnapshot.data?.docs.length,
            itemBuilder: (context,index) {
              return Card(
                elevation: 10.0,
                margin: const EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        backgroundColor:Colors.black ,
                        foregroundColor:Colors.white ,
                        radius: 25,
                        child: Text(streamSnapshot.data?.docs[index]['title'][0]),),
                      SizedBox(width: deviceWidth *0.02,),
                      InkWell(
                        onTap: (){
                          passData(snapshot[index]);
                        },
                        child: Container(
                          width: deviceWidth*0.70,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,

                            children: [
                              Text(streamSnapshot.data?.docs[index]['title'],style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 20),maxLines: 1,overflow: TextOverflow.ellipsis,),
                              SizedBox(height: deviceHeight*0.01,),
                              Text(streamSnapshot.data?.docs[index]['content'],style: const TextStyle(fontWeight: FontWeight.w400,color: Colors.black,fontSize: 16),maxLines: 2,overflow: TextOverflow.ellipsis,),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

          );
    }

      ),

    );
  }
}
