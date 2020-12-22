import 'package:ecommerce/screens/authentication_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/movie.dart';
import 'package:ecommerce/services/Store.dart';

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
              ));}
            return GridView.builder(
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                childAspectRatio: .8,),
              itemBuilder :(context,index)=> Padding(
                padding:EdgeInsets.symmetric(horizontal : 10, vertical :10) ,
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Image(
                        fit: BoxFit.fill,
                        image: AssetImage(movies[index].mImage),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Opacity(
                        opacity: .6,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(movies[index].mTitle,
                                  style : TextStyle(fontWeight: FontWeight.bold)),
                              Text(movies[index].mDescription,
                                  style : TextStyle(fontWeight: FontWeight.bold)
                              )
                            ],
                          ),
                        ),
                      ),
                    )
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
