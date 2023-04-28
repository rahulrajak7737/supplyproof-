import 'package:flutter/material.dart';

class Myrole extends StatefulWidget {
  const Myrole({Key? key}) : super(key: key);

  @override
  State<Myrole> createState() => _MyroleState();
}

class _MyroleState extends State<Myrole> {
  @override
  Widget build(BuildContext context) {
    final producerbutton = Material(

      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){
          Navigator.pushNamed(context, 'signup_producer');


        },
        child: Text(
          'Producer' ,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
    final Buyerbutton = Material(

      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){
          Navigator.pushNamed(context, 'signup_buyer');

        },
        child: Text(
          'Buyer' ,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
    final logisticsbutton= Material(

      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){
          Navigator.pushNamed(context, 'signup_logistics');



        },
        child: Text(
          'Logistics' ,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
    final Warehousebutton = Material(

      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){


        },
        child: Text(
          'Warehouse' ,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
    return    Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back,color: Colors.red,),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          Text(" Choose your Role", style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,

          ),),
          SizedBox(
            height: 20,
          ),


          producerbutton,
          SizedBox(
            height: 15,
          ),
          Buyerbutton,
          SizedBox(
            height: 15,
          ),
          logisticsbutton,
          SizedBox(
            height: 15,
          ),
          Warehousebutton

        ],
      ),
    );
  }
}
