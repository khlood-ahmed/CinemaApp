import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/movie.dart';

class Store{
final Firestore _firestore = Firestore.instance;

Stream<QuerySnapshot> loadMovies (){
  //List<Movie> movies = [];
// await for( var snapshot in _firestore.collection('Movies').snapshots()){
  return _firestore.collection('Movies').snapshots();
  
  }
 }
 //return movies;
//}
//}