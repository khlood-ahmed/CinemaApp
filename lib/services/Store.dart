import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/movie.dart';

class Store{
//final FiresbaseFirestore _firestore = Firestore.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
Stream<QuerySnapshot> loadMovies (){
  //List<Movie> movies = [];
// await for( var snapshot in _firestore.collection('Movies').snapshots()){
  return _firestore.collection('Movies').snapshots();
  
  }
  updatemovies(data, documentID) {
    _firestore.collection('Movies').document(documentID).updateData(
        data);
  }
 }
 //return movies;
//}
//}