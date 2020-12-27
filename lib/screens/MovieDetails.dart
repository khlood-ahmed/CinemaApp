import 'package:ecommerce/models/movie.dart';
import 'package:ecommerce/screens/by_ticket.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/screens/home_screen.dart';

class MovieDetails extends StatefulWidget {
  static String id ='MovieDetails';

  @override
  _FilmeDetailsState createState() => _FilmeDetailsState();
}

class _FilmeDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context){
    Movie movie = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body : Stack(
        children: <Widget>[
          Container(
           //height : MediaQuery.of(context).size.height,
            width : MediaQuery.of(context).size.width,
          child :Image(
            fit : BoxFit.fitWidth,
            height: 50,
            image: NetworkImage(movie.mImage),
             ),
          ),
           Padding(
             padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
             child: Container(
               height: MediaQuery.of(context).size.height * .1,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   Icon(
                     Icons.arrow_back_ios,
                   ),
                 ],
               ),
             ),
           ),
           Positioned(
             bottom: 0,
             child: Column(
               children: <Widget>[
               Opacity(
                 child: Container(
                   color : Colors.white,
                   width : MediaQuery.of(context).size.width,
                   height: MediaQuery.of(context).size.height*3,
                   child: Padding(
                     padding: const EdgeInsets.all(20),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children : <Widget>[
                         Text(
                           movie.mTitle,
                           style: TextStyle(
                             fontSize: 20, fontWeight: FontWeight.bold),
                         ),
                         SizedBox(height : 10),
                         Text(
                           movie.mDescription,
                           style: TextStyle(
                             fontSize: 16 ,fontWeight: FontWeight.w800,
                             ),
                         ),
                         SizedBox(height : 10),
                         Text(
                           movie.mDescription,
                           style: TextStyle(
                             fontSize: 16 ,fontWeight: FontWeight.w800,
                             ),
                         ),
                         RaisedButton(
                             onPressed:(){
                             Navigator.pushNamed(context, BuyTicket.id , arguments: movie);
                             }
                         )
                       ], 
                     ),
                   ),
                 ),
                 opacity: .5,
               ),
               ],

             ),
             ),
        ],
        ),
    );
  
  }
}
