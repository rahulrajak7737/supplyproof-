import 'package:flutter/material.dart';
import 'package:supplyproof/fleet_details.dart';
import 'package:supplyproof/logistics_qr_generator.dart';

class Mydashboardlogistics extends StatefulWidget {
  const Mydashboardlogistics({Key? key}) : super(key: key);

  @override
  State<Mydashboardlogistics> createState() => _MydashboardlogisticsState();
}

class _MydashboardlogisticsState extends State<Mydashboardlogistics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffECF2FF),
      appBar: AppBar(
        title: Text('Dashboard', style:
        TextStyle(fontSize: 24, fontWeight: FontWeight.w700),


        ),
        backgroundColor: Colors.green.shade800,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10,0,10,10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(10,0,10,10),
                            child: Text('Shipment Sent :', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(children: [
                        Text('Shipment Recieved:', style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),)
                      ],),SizedBox(
                        height: 45,
                      ),
                      Row(children: [
                        Text('Payment Released :', style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),)
                      ],),
                      SizedBox(
                        height: 45,
                      ),
                      Row(children: [
                        Text('Payment Recieved :', style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),)
                      ],),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          // Generated code for this Container Widget...
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: BoxDecoration(
                                // color: FlutterFlowTheme.of(context).primaryBtnText,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Color(0xFF448C83),
                                  width: 2,
                                ),
                              ),
                              child: TextFormField(
                                // controller: _model.textController1,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  // hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                ),
                                // style: FlutterFlowTheme.of(context).bodyMedium,
                                // validator: _model.textController1Validator.asValidator(context),
                              ),
                            ),
                          )

                        ],
                      ),
                      Row(
                        children: [
                          // Generated code for this Container Widget...
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: BoxDecoration(
                                // color: FlutterFlowTheme.of(context).primaryBtnText,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Color(0xFF448C83),
                                  width: 2,
                                ),
                              ),
                              child: TextFormField(
                                // controller: _model.textController1,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  // hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                ),
                                // style: FlutterFlowTheme.of(context).bodyMedium,
                                // validator: _model.textController1Validator.asValidator(context),
                              ),
                            ),
                          )

                        ],
                      ),
                      Row(
                        children: [
                          // Generated code for this Container Widget...
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: BoxDecoration(
                                // color: FlutterFlowTheme.of(context).primaryBtnText,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Color(0xFF448C83),
                                  width: 2,
                                ),
                              ),
                              child: TextFormField(
                                // controller: _model.textController1,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  // hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                ),
                                // style: FlutterFlowTheme.of(context).bodyMedium,
                                // validator: _model.textController1Validator.asValidator(context),
                              ),
                            ),
                          )

                        ],
                      ),
                      Row(
                        children: [
                          // Generated code for this Container Widget...
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: BoxDecoration(
                                // color: FlutterFlowTheme.of(context).primaryBtnText,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Color(0xFF448C83),
                                  width: 2,
                                ),
                              ),
                              child: TextFormField(
                                // controller: _model.textController1,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  // hintStyle: FlutterFlowTheme.of(context).bodySmall,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                ),
                                // style: FlutterFlowTheme.of(context).bodyMedium,
                                // validator: _model.textController1Validator.asValidator(context),
                              ),
                            ),
                          )

                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Transaction History",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.indigo,
                  ),
                )
              ],
            ),
            Padding(
              padding:  EdgeInsets.all(15.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.3,
                ),
                decoration: BoxDecoration(
                  //or: FlutterFlowThemcole.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    width: 3,
                  ),
                ),
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: [
                    TextField(),
                  ],
                ),
              ),


            ),
          ],
        ),
      ),
      bottomNavigationBar:  BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>Mydashboardlogistics()),
                  );

                }, icon: Icon(Icons.home)),
            label: 'Search',

          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Myfleetdetails()),
                  );

                }, icon: Icon(Icons.add_circle_outline)),
            label: 'Fleet Details',

          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Myqrgenerator(),),
                  );

                }, icon: Icon(Icons.qr_code_2_outlined)),
            label: 'Qr generator',

          ),
          // BottomNavigationBarItem(
          //   icon: IconButton(
          //       onPressed: (){
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (context) => Myfleetdetails(),),
          //         );
          //
          //       }, icon: Icon(Icons.qr_code_2_outlined)),
          //   label: 'Qr generator',
          //
          // ),


        ],

      ),
    );
  }
}
