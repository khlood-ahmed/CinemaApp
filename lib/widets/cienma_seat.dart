
import 'package:flutter/material.dart';
import 'package:ecommerce/constance.dart';

import 'Function.dart';

class CienmaSeat extends StatefulWidget {
  bool isReserved;
  bool isSelected;
  String val ;

  CienmaSeat({this.isSelected, this.isReserved ,  this.val});

  @override
  _CienmaSeatState createState() => _CienmaSeatState();
}

class _CienmaSeatState extends State<CienmaSeat> {

CienmaSeat s = CienmaSeat();
  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          setState(() {
            !widget.isReserved ? widget.isSelected = !widget.isSelected : null;
            widget.isSelected == true ? addseatnumber(widget.val) : null;
          });
        },
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 7.0, vertical: 5.0),
            width: MediaQuery.of(context).size.width / 15,
            height: MediaQuery.of(context).size.width / 15,
            decoration: BoxDecoration(
                color: widget.isReserved? Colors.white : widget.isSelected ? Colors.pink : null,
                border: !widget.isSelected && !widget.isReserved ? Border.all(color: Colors.white, width: 1.0) : null, borderRadius: BorderRadius.circular(5.0)),



    ),
    );
  }

}






