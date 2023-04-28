import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:supplyproof/dashboard_producere.dart';
import 'package:supplyproof/dashboardbuyer.dart';
import 'package:supplyproof/dashboardlogistics.dart';
import 'package:supplyproof/dashboardwarehouse.dart';

enum Role {  Buyer, Producer, Logistics, Warehouse }

class Mylogin extends StatefulWidget {
  const Mylogin({Key? key}) : super(key: key);

  @override
  State<Mylogin> createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
  final _formKey =GlobalKey<FormState>();
  final TextEditingController emailcontroller =new TextEditingController();
  final TextEditingController passwordcontroller = new TextEditingController();
  final roleEditingController =new TextEditingController();
  final _auth =FirebaseAuth.instance;
  Role _selectedRole =Role.Buyer;

  @override
  Widget build(BuildContext context) {
    final emailfield =TextFormField(
      autofocus: false,
      controller: emailcontroller,
      keyboardType:  TextInputType.emailAddress,
      validator:(value){
        if(value!.isEmpty){
          return ("Please Enter a valid email");
        }
        if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[a-z]")
            .hasMatch(value)){
          return("please Enter a valid email");
        }
        return null;
      } ,
      onSaved: (value){
        emailcontroller.text =value!;
      },
      textInputAction:  TextInputAction.next,
      decoration:  InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),

        )
      ),
    );
    final passwordfield =TextFormField(
      autofocus: false,
      obscureText: true,

      controller: passwordcontroller,
      keyboardType:  TextInputType.emailAddress,
      validator: (value){
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty){
          return('Password is Required for Login');
        }
        if(!regex.hasMatch(value)){
          return ("Please Enter Valid Password(Min. 6 Character");
        }
      },

      onSaved: (value){
       passwordcontroller.text =value!;
      },
      textInputAction:  TextInputAction.next,
      decoration:  InputDecoration(
          prefixIcon: Icon(Icons.key_outlined),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: 'Password',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),

          )
      ),
    );
    final loginbutton = Material(

      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){
          signIn(emailcontroller.text, passwordcontroller.text);

        },
        child: Text(
          'Sign In' ,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Color(0xffECF2FF),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Color(0xffECF2FF),
            child: Padding(
              padding: const EdgeInsets.all(36),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 200,
                    ),
                    emailfield,
                    SizedBox(
                      height: 25,
                    ),
                    passwordfield,
                    SizedBox(
                      height: 25,
                    ),
                    DropdownButtonFormField<Role>(
                      value: _selectedRole,
                      hint: Text('Choose your Role',style: TextStyle(color: Colors.blueGrey, )),
                      isExpanded: false,



                      items: [
                        DropdownMenuItem(
                          value: Role.Buyer,
                          child: Text('Buyer'),
                        ),
                        DropdownMenuItem(
                          value: Role.Producer,
                          child: Text('Producer'),
                        ),
                        DropdownMenuItem(
                          value: Role.Logistics,
                          child: Text('Logistics'),
                        ),
                        DropdownMenuItem(
                          value: Role.Warehouse,
                          child: Text('Warehouse'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedRole = value!;
                          roleEditingController.text =value as String;
                        });
                      },
                      // validator: ,

                    ),
                    SizedBox(
                      height: 25,
                    ),
                    loginbutton,
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Don\'t have an account?'),
                        GestureDetector(
                          onTap: (){
                            switch(_selectedRole){
                              case Role.Producer:
                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(builder: (context) => MydashboardProducer()), (route) => false);
                                break;

                              case Role.Buyer:

                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(builder: (context) => Mydashboardbuyer()), (route) => false);
                                break;
                              case Role.Logistics:
                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(builder: (context) => Mydashboardlogistics()), (route) => false);
                                break;
                              case Role.Warehouse:
                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(builder: (context) => Mydashboardwarehouse()), (route) => false);


                            }
                          },
                          child: Text('SignUp',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,

                          ),),
                        )

                      ],
                    )


                  ]

              ),
              ),
            ),
          ),
        ),
      )


    );
  }
  // void route() {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   var kk = FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(user!.uid)
  //       .get()
  //       .then((DocumentSnapshot documentSnapshot) {
  //     if (documentSnapshot.exists) {
  //       if (documentSnapshot.get('rool') == "Producer") {
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) =>  MydashboardProducer(),
  //           ),
  //         );
  //       }
  //       if (documentSnapshot.get('rool') == "Buyer") {
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) =>  Mydashboardbuyer(),
  //           ),
  //         );
  //       }
  //       if (documentSnapshot.get('rool') == "Logistics") {
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) =>  Mydashboardlogistics(),
  //           ),
  //         );
  //       }
  //       if (documentSnapshot.get('rool') == "Warehouse") {
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) =>  Mydashboardwarehouse(),
  //           ),
  //         );
  //       }else{
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => Mylogin(),
  //           ),
  //         );
  //       }
  //     } else {
  //       print('Document does not exist on the database');
  //     }
  //   });
  // }
  void signIn(String email, String password) async{
    if (
    _formKey.currentState!.validate()
    ){
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
            Fluttertoast.showToast(msg: "Login Successful"),

      }).catchError(
          (e){
            Fluttertoast.showToast(msg: e!.message);
          }
      );
    }
  }
}
