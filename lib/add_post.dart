import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  _AddPostState createState() => _AddPostState();
}
late double deviceHeight;
late double deviceWidth;
late TextEditingController controller;


class _AddPostState extends State<AddPost> {
  @override
  Widget build(BuildContext context) {
    deviceHeight=MediaQuery.of(context).size.height;
    deviceWidth=MediaQuery.of(context).size.width;
    controller=TextEditingController();
    return  Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        title: const Text('Create New Post'),
        backgroundColor: Colors.black38,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_ios)),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.edit)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.save_alt)),

        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Container(
                  height: deviceHeight*0.37,
                  width: deviceWidth,
                  color:Colors.blue ,
                  child:  Image(image: NetworkImage('https://wallpapercave.com/dwp1x/wp10434813.jpg'),),
                ),
                SizedBox(height: deviceHeight *0.02,),
                Container(
                  height: deviceHeight*0.1,
                  width: deviceWidth,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children:  [
                        const Text('Blog Title:',style: TextStyle(color: Colors.red),),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                            width: deviceWidth*0.7,

                            child: TextField(
                              keyboardType: TextInputType.text,
                              controller: controller,
                              maxLines: 2,
                              // validator:(value){
                              //   if(_emailController.text.isEmpty){
                              //     return 'This Field Can\'t be empty';
                              //   }
                              // } ,
                              style: const TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),
                              decoration: const InputDecoration(
                                hintText: 'MyBlog',
                                hintStyle: TextStyle(fontSize: 13,color: Colors.white,),

                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                  ),
                ),
                storyCard(),
                submitButton(),




              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget submitButton(){
    return   InkWell(
      onTap: (){},
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Center(
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width-150,
            color: Colors.transparent,
            child:   Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),

              elevation: 5,
              color: Colors.indigo,
              child: const Center(child: Text('Confirm',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 23),)),
            ),
          ),
        ),
      ),
    );
  }
  Widget storyCard(){
    return Align(
      alignment: Alignment.center,
      child: ConstrainedBox(constraints: BoxConstraints(
          maxWidth: deviceWidth
      ),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          // margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          color: Colors.red,
          child: Stack(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom:20 ),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 9,
                )
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Row(
                  children: const [
                    Text('Posted by',style: TextStyle(fontSize: 9,color: Colors.amberAccent),),
                    // SizedBox(width: 5,),
                    // Icon(Icons.emoji_emotions,color: Colors.red,size: 13,),

                  ],
                ),
              )
            ],
          ),),

      ),
    );
  }
}
