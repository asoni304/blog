import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class PostDetails extends StatefulWidget {
  late DocumentSnapshot snapshot;



PostDetails({Key? key, required this.snapshot}) : super(key: key);



  @override
  _PostDetailsState createState() => _PostDetailsState();
}
late double deviceHeight;
late double deviceWidth;

class _PostDetailsState extends State<PostDetails> {

  @override
  Widget build(BuildContext context) {
    deviceHeight=MediaQuery.of(context).size.height;
    deviceWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_ios)),
        title:  Text(widget.snapshot['title']),
        backgroundColor: Colors.blueGrey,

      ),

      body:SingleChildScrollView(
        child: Column(
          children: [
            Card(

                elevation: 10,
                margin: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        child: Text(widget.snapshot['title'][0]),
                      ),
                      SizedBox(width: deviceWidth *0.07,),
                      Text(widget.snapshot['title'],
                        style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),

              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Text(widget.snapshot['content'],style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,

                ),),
              ),
            )
          ],
        ),
      )





    );
  }
}
