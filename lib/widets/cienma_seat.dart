
import 'package:flutter/material.dart';
import 'package:ecommerce/constance.dart';


class CienmaSeat extends StatefulWidget {
  bool isReserved;
  bool isSelected;
  final String val ;
  CienmaSeat({this.isSelected = false, this.isReserved = false ,@required this.val});

  @override
  _CienmaSeatState createState() => _CienmaSeatState();
}

class _CienmaSeatState extends State<CienmaSeat> {
   List <String> selected_seats = [];
CienmaSeat s = CienmaSeat();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        setState(() {
          !widget.isReserved ? widget.isSelected = !widget.isSelected : null;
        });
      },
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 7.0, vertical: 5.0),
          width: MediaQuery.of(context).size.width / 15,
          height: MediaQuery.of(context).size.width / 15,
          decoration: BoxDecoration(
              color: widget.isSelected
                  ? kPimaryColor
                  : widget.isReserved ? Colors.white : null,
              border: !widget.isSelected && !widget.isReserved
                  ? Border.all(color: Colors.white, width: 1.0)
                  : null,
              borderRadius: BorderRadius.circular(5.0)),
             
          void addseatnumber (String val){
             if(selected_seats.isEmpty){
             selected_seats.add(val);
              }else {
             for(int i = 0 ; i<selected_seats.length ; i++){
          if(selected_seats[i] == val) {
           print('selected seats = $selected_seats');
           print('length = ${selected_seats.length}');
          break;
       } else{
        selected_seats.add(val);
        print('selected seats = $selected_seats');
        print('length = ${selected_seats.length}');
        break;
         }
        }
       }



      }

       String get selectedSeatsAsString => selected_seats.join(', ');
    ),
    );

  }
}