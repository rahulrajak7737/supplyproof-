import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:supplyproof/dashboard_producere.dart';
import 'package:supplyproof/model/user_model.dart';
// import 'package:country_code_picker/country_code_picker.dart';
enum Role { user, admin }
class MySignup extends StatefulWidget {
  const MySignup({Key? key}) : super(key: key);

  @override
  State<MySignup> createState() => _MySignupState();
}

class _MySignupState extends State<MySignup> {
  final _auth = FirebaseAuth.instance;
  final TextEditingController phoneController = TextEditingController();


  late DateTime selectedDate;
  final _formKey = GlobalKey<FormState>();
  final firstNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final mobileEditingController = new TextEditingController();
  final locationEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmpasswordEditingController = new TextEditingController();
  TextEditingController _dropdownController = TextEditingController();

  Role _selectedRole = Role.user;
  var options = [
    'Producer',
    'Buyer',
    'Logistics',
    'Warehouse'
  ];
  var _currentItemSelected = "Producer";
  var rool = "Producer";
  var _selectedType;
  bool showProgress = false;
  bool visible = false;

  // Country
  @override
  void initState() {
    super.initState();



  }

  Widget build(BuildContext context) {
    final firstNamefield = TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value){
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty){
          return('First name is Required for Login');
        }
        if(!regex.hasMatch(value)){
          return ("Please Enter Valid  First name (Min. 3 Character");
        }
      },
      onSaved: (value) {
        firstNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: 'User Name',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),

          )
      ),
    );
    final emailfield = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
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
      onSaved: (value) {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: 'Email',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),

          )
      ),
    );
    final mobilefield = TextFormField(
      autofocus: false,
      controller: mobileEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value){
        RegExp regex = new RegExp(r'^.{10,}$');
        if (value!.isEmpty){
          return('phone no is Required for Login');
        }
        if(!regex.hasMatch(value)){
          return ("Please Enter Valid phone no(Min. 10 Character");
        }
      },
      onSaved: (value) {
        mobileEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mobile_friendly),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: 'Mobile',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),

          )
      ),
    );
    final locationfield = TextFormField(
      autofocus: false,
      controller: locationEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value){
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty){
          return('location  is Required for SignUp');
        }
        if(!regex.hasMatch(value)){
          return ("Please Enter Valid Location(Min. 3 Character");
        }
      },
      onSaved: (value) {
        locationEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.location_on),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: 'Location',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),

          )
      ),
    );
    final passwordfield = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordEditingController,

      validator: (value){
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty){
          return('Password is Required for Login');
        }
        if(!regex.hasMatch(value)){
          return ("Please Enter Valid Password(Min. 6 Character");
        }
      },
      onSaved: (value) {
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: 'Password',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),

          )
      ),
    );
    final confirmpasswordfield = TextFormField(
      autofocus: false,
      controller: confirmpasswordEditingController,
      validator: (value) {
        if(confirmpasswordEditingController.text!= passwordEditingController.text){
          return "Password dont match";
        }
        return null;
      } ,


      onSaved: (value) {
        confirmpasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: 'Confirm Password',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),

          )
      ),
    );
    final signUpbutton = Material(

      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: (){
          signUp(emailEditingController.text, mobileEditingController.text, passwordEditingController.text, locationEditingController.text, rool);



        },
        child: Text(
          'Sign Up' ,
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back,color: Colors.red,),
            onPressed: (){
              Navigator.pushNamed(context, 'role');
            },
          ),
        ),
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

                        // ImageProfile(),
                        SizedBox(
                          height: 30,
                        ),
                        firstNamefield,
                        SizedBox(
                          height: 25,
                        ),
                        emailfield,
                        SizedBox(
                          height: 25,
                        ),
                        mobilefield,
                        SizedBox(
                          height: 25,
                        ),
                        locationfield,
                        SizedBox(
                          height: 25,
                        ),
                        passwordfield,
                        SizedBox(
                          height: 25,
                        ),
                        confirmpasswordfield,
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Icon(FontAwesomeIcons.peopleGroup,
                              size: 25.0,
                              color: Colors.blueGrey,),
                            const SizedBox(
                              width:50.0,
                            ),
                            // DropdownButton(
                            //   items: _roleType.map((value)=>DropdownMenuItem(
                            //     value: value,
                            //     child: Text(value,
                            //       style: const TextStyle(color: Colors.blueGrey) ,),
                            //   )).toList(),
                            //   onChanged: (selectedType){
                            //     if (kDebugMode) {
                            //       print('$selectedType');
                            //     }
                            //     setState(() {
                            //       selectedType=selectedType;
                            //     });
                            //   },
                            //   value : _selectedType,
                            //   isExpanded:  false,
                            //   hint:  const Text('Choose your Role',style: TextStyle(
                            //     color: Colors.blueGrey,
                            //   ),),
                            //
                            // )
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Role : ",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            DropdownButton<String>(
                              dropdownColor: Colors.blue[900],
                              isDense: true,
                              isExpanded: false,
                              iconEnabledColor: Colors.white,
                              focusColor: Colors.white,
                              items: options.map((String dropDownStringItem) {
                                return DropdownMenuItem<String>(
                                  value: dropDownStringItem,
                                  child: Text(
                                    dropDownStringItem,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValueSelected) {
                                setState(() {
                                  _currentItemSelected = newValueSelected!;
                                  rool = newValueSelected;
                                });
                              },
                              value: _currentItemSelected,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        signUpbutton,
                      ]


                  ),
                ),
              ),
            ),
          ),
        )


    );
  }


  void signUp(String email, String mobile ,String password, String location,String rool) async{
    if(_formKey.currentState!.validate())
      {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password, )
            .then((value) => {postDetailToFirestore()})
            .catchError((e) {
              Fluttertoast.showToast(msg : e!.message);
        });

      }
  }
  postDetailToFirestore() async{
    FirebaseFirestore firebaseFirestore =FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel userModel = UserModel();
    userModel.email =user!.email;
    userModel.mobile = mobileEditingController.text;
    userModel.uid =user.uid;
    userModel.firstname =firstNameEditingController.text;
    userModel.location = locationEditingController.text;
    
    await firebaseFirestore
    .collection("users")
    .doc(user.uid)
    .set(userModel.toMap());
    
    Fluttertoast.showToast(msg: "Account created successfully:)");
    
    Navigator.pushAndRemoveUntil(context,
       MaterialPageRoute(builder: (context) => MydashboardProducer()), (route) => false);




  }
}
