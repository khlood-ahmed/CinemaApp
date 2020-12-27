import 'dart:ffi';
import 'dart:typed_data';

import 'package:ecommerce/screens/MovieDetails.dart';
import 'package:ecommerce/screens/authentication_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/movie.dart';
import 'package:ecommerce/services/Store.dart';
import 'package:flutter/rendering.dart';
import 'package:ecommerce/screens/MovieDetails.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../constance.dart';

class Homescreen extends StatefulWidget {
  static const routeName = "/Home";
  @override
  _Homescreen createState() => _Homescreen();
}

class _Homescreen extends State<Homescreen> {
  final _store = Store();
  int money = 180;
  final int totalmoney = 220;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          child: RaisedButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.of(context)
                  .pushReplacementNamed(AuthenticationScreen.routeName);
            },
            child: Text(
              "logout",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Movie App',
          style: TextStyle(
              fontFamily: 'Reem Kufi',
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.w700),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.black, Colors.amber])),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _store.loadMovies(),
        builder:(context , snapshot)
        {
          if(snapshot.hasData){
            List <Movie> movies =[];
            for (var doc in snapshot.data.documents) {
              var data = doc.data();
              movies.add(Movie(
                mTitle: data['MovieTitle'],
                mDescription: data['MovieDescription'],
                mImage: data['MovieImage'],
                mTime: data['MovieTime'],
                mNumberofseats: data['MovieNumberofseats'],
                c1: data[c1],
                c2: data['c2'],
                c3: data['c3'],
                c4: data['c4'],
                c5: data['c5'],
                c6: data['c6'],
                c7: data['c7'],
                c8: data['c8'],
                c9: data['c9'],
                c10: data['c10'],
                c11: data['c11'],
                c12: data['c12'],
                c13: data['c13'],
                c14: data['c14'],
                c15: data['c15'],
                c16: data['c16'],
                c17: data['c17'],
                c18: data['c18'],
                c19: data['c19'],
                c20: data['c20'],
                c21: data['c21'],
                c22: data['c22'],
                c23: data['c23'],
                c24: data['c24'],
                c25: data['c25'],
                c26: data['c26'],
                c27: data['c27'],
                c28: data['c28'],
                c29: data['c29'],
                c30: data['c30'],
                c31: data['c31'],
                c32: data['c32'],
                c33: data['c33'],
                c34: data['c34'],
                c35: data['c35'],
                c36: data['c36'],
                c37: data['c37'],
                c38: data['c38'],
                c39: data['c39'],
                c40: data['c40'],
                c41: data['c41'],
                c42: data['c42'],
                c43: data['c43'],
                c44: data['c44'],
                c45: data['c45'],
                c46: data['c46'],
                c47: data['c47'],
              ));}

            return GridView.builder(
           //   itemCount : 12,
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                //childAspectRatio: .8),
              itemBuilder :(context,index)=> Padding(
                padding:EdgeInsets.symmetric(horizontal : 30, vertical :30) ,
                child: Stack(
                  children: <Widget>[
                   Positioned.fill(
                     child:RaisedButton(
                       onPressed:(){Navigator.pushNamed(context, MovieDetails.id , arguments: movies[index]);} ,
                    child:Image(
                        fit: BoxFit.fitWidth,
                        image: NetworkImage(movies[index].mImage),
                      )
                     ),
                   ),
                    Positioned(
                      bottom: 0,
                      child: Opacity(
                        opacity: .6,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(movies[index].mTitle,
                                  style : TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                              //Text(movies[index].mDescription,
                               //   style : TextStyle(fontWeight: FontWeight.bold)
                             // )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              itemCount: movies.length,);
          }else{
            return Center(child: Text('Loading....'));
          }
        },
      )

    );
  }
}
/*class ImageGridItem extends StatefulWidget{
  int _index;
  ImageGridItem(int index){
    this._index = index;
  }
@override
_ImageGridItemState createState() => _ImageGridItemState();

}
class _ImageGridItemState extends State<ImageGridItem>{
  Uint8List imageFile;
  Reference photosReference  = FirebaseStorage.instance.ref().child("Uploads/");
  getImage(){
    int Max_Size = 7*1024*1024;
    photosReference.child("image_${widget._index}.jpg").getData(Max_Size).then((data){
      imageFile =data;
    }).catchError((error){

    });
  }
  Widget deciderGridTileWidget(){
    if(imageFile == null){
      Center (child: Text("No Data"));
    }else{
      return Image.memory(imageFile, fit: BoxFit.fill);
    }
    }
  

  @override
  Widget build(BuildContext context) {
    return GridTile(child: deciderGridTileWidget());
    throw UnimplementedError();
  }

}*/
