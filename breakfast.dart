import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main()=>runApp(Breakfast());


class Breakfast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.bars),
            onPressed: () {}),
        title: Container(
          alignment: Alignment.center,
          child: Text("BreakFast", style: TextStyle(),),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.newspaper,
              size: 20.0,
              color: Colors.white,
            ),
            onPressed: null,
          ),
        ],
      ),
      body:StreamBuilder(
        stream:Firestore.instance.collection('breakfast').snapshots(),
        builder:(context,snapshot){
          if(!snapshot.hasData){
            return Center(
              child:Text('loading'),
            );

          }
          else{
            return  ListView.builder(itemCount: snapshot.data.documents.length,
            itemBuilder:(context,index){
              DocumentSnapshot mypost=snapshot.data.documents[index];
              return Stack(children: <Widget>[
                Column(children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 350.0,
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.0,bottom: 8.0),
                    child: Material(
                      color: Colors.white,
                      elevation: 14.0,
                      shadowColor: Color(0x802196f3),
                      child: Center(child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(children: <Widget>[
                          Container(width: MediaQuery.of(context).size.width,
                          height: 200.0,
                          child: Image.network('${mypost['image']}',
                          fit:BoxFit.fill,),
                          ),
                          SizedBox(height: 10.0),
                          Text('${mypost['subtitle']}',
                          style: TextStyle(fontSize: 7.0,fontWeight:FontWeight.bold),
                          ),
                          SizedBox(height: 10.0,),
                          Text('${mypost['title']}',
                            style: TextStyle(fontSize: 5.0,fontWeight:FontWeight.bold,color: Colors.blueGrey),


                          ),
                        ],),
                      ),),
                    ),
                  ),
                ),
              ]),
              ],

              );}
            );
          }
        }
    )


    );
  }
}

















