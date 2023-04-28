import 'package:flutter/material.dart';

class Myqrgenerator extends StatefulWidget {
  const Myqrgenerator({Key? key}) : super(key: key);

  @override
  State<Myqrgenerator> createState() => _MyqrgeneratorState();
}

class _MyqrgeneratorState extends State<Myqrgenerator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffECF2FF),
      appBar: AppBar(
        title: Text('QR Generator', style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700
        ),),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15, 25, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Enter Crop no ', style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),),
                Container(
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
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){}, child: Text("Generate Qr", style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),))
            ],
          )
        ],
      ),
    );
  }
}
