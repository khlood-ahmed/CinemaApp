import 'package:flutter/material.dart';
import 'package:ecommerce/widets/Cienma_Seat.dart';
import '../constance.dart';

class BuyTicket extends StatelessWidget {
 // var title;

 // BuyTicket(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:15.0 , left:15.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * .12,
                    height: MediaQuery.of(context).size.width * .12,
                    decoration: kRoundedFadedBorder,
                    child: IconButton(
                        icon: Icon(
                          Icons.keyboard_arrow_left,
                          size: 28.0,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                 /* SizedBox(
                    width: MediaQuery.of(context).size.width * .75,
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),*/
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              width: MediaQuery.of(context).size.width * .9,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  topLeft: Radius.circular(25.0),
                ),
              ),
              /*child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      CalendarDay(
                        dayNumber: '9',
                        dayAbbreviation: 'TH',
                      ),
                      CalendarDay(
                        dayNumber: '10',
                        dayAbbreviation: 'FR',
                      ),
                      CalendarDay(
                        dayNumber: '11',
                        dayAbbreviation: 'SA',
                      ),
                      CalendarDay(
                        dayNumber: '12',
                        dayAbbreviation: 'SU',
                        isActive: true,
                      ),
                      CalendarDay(
                        dayNumber: '13',
                        dayAbbreviation: 'MO',
                      ),
                    ],
                  ),
                ),
              ),*/
            ),
           /* SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  ShowTime(
                    time: '11:00',
                    price: 5,
                    isActive: false,
                  ),
                  ShowTime(
                    time: '12:30',
                    price: 10,
                    isActive: true,
                  ),
                  ShowTime(
                    time: '12:30',
                    price: 10,
                    isActive: false,
                  ),
                  ShowTime(
                    time: '12:30',
                    price: 10,
                    isActive: false,
                  ),
                  ShowTime(
                    time: '12:30',
                    price: 10,
                    isActive: false,
                  ),
                ],
              ),
            ),*/
            Padding( 
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.tv,
                    color: kPimaryColor,
                    size: 25.0,
                  ),
                  SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Star Cineplex Bangladesh', style: kMainTextStyle),
                      Text('panthapath , 1205 Dhaka, Bangladesh',
                          style:
                              TextStyle(color: Colors.white30, fontSize: 18.0)),
                      SizedBox(height: 10.0),
                      Row(
                        children: <Widget>[
                          Text('2D', style: kMainTextStyle),
                          SizedBox(width: 10.0),
                          Text('3D',
                              style: TextStyle(
                                  color: Colors.white30,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold)),
                        ],
                      )
                    ],
                  ),
                  SizedBox(width: 20.0),
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: 30.0,
                    color: Colors.white38,
                  )
                ],
              ),
            ),
            Center(child: Image.asset('assets/images/screen.png')),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  // First Seat Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20),
                      ),
                      CienmaSeat(val :'1'),
                      CienmaSeat(val:'2'),
                      CienmaSeat(val:'3'),
                      CienmaSeat(val:'4'),

                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(val:'5'),
                      CienmaSeat(val:'6'),
                      CienmaSeat(val:'7'),
                      CienmaSeat(val:'8'),
                      CienmaSeat(val:'9'),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20),
                      ),
                    ],
                  ),
                  // Second Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CienmaSeat(val:'10'),
                      CienmaSeat(val:'11'),
                      CienmaSeat(val:'12'),
                      CienmaSeat(val:'13'),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(val:'14'),
                      CienmaSeat(val:'15'),
                      CienmaSeat(val:'16'),
                      CienmaSeat(val:'17'),
                      CienmaSeat(val:'18'),
                    ],
                  ),
                  // Third  Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CienmaSeat(val:'19'),
                      CienmaSeat(val:'20'),
                      CienmaSeat(val:'21'),
                      CienmaSeat(val:'22'),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(val:'23'),
                      CienmaSeat( val:'24'  ),
                      CienmaSeat(val:'25'),
                      CienmaSeat(val:'26'),
                      CienmaSeat(val:'27'),

                    ],
                  ),
                  // 4TH Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CienmaSeat(val:'28'),
                      CienmaSeat(val:'29'),
                      CienmaSeat(val:'30'),
                      CienmaSeat(val:'31'),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(val:'32'),
                      CienmaSeat(val:'33'),
                      CienmaSeat(val:'34'),
                      CienmaSeat(val:'35'),
                      CienmaSeat(val:'36'),

                    ],
                  ),
                  // 5TH Row
                 
                  // 6TH Row
                  // final Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20),
                      ),
                      CienmaSeat(val:'37'),
                      CienmaSeat(val:'38'),
                      CienmaSeat(val:'39'),
                      CienmaSeat(val:'40'),
                      CienmaSeat(val:'41'),

                      SizedBox(
                      ),
                      CienmaSeat(val:'42'),
                      CienmaSeat(val:'43'),
                      CienmaSeat(val:'44'),
                      CienmaSeat(val:'45'),
                      CienmaSeat(val:'46'),
                      CienmaSeat(val:'47'),

                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                          child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text(
                      '30\$',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Container(
          padding: EdgeInsets.symmetric(horizontal:40.0 , vertical:10.0),
          decoration: BoxDecoration(color:  kActionColor , borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0))),
          child: InkWell(child: Text('Pay' , style: TextStyle(color: Colors.white ,fontSize: 25.0 , fontWeight:FontWeight.bold))),
        )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

