import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfr_designed/utls/color.dart';

class RegistreScreen extends StatefulWidget{
  @override
  _RegistreScreenState createState() => _RegistreScreenState();
}

class _RegistreScreenState extends State<RegistreScreen> {
  String nom, prenom, email,adresse, password;
  int num_tel,num_contrat;
  String dropdownValue = 'Orange';
  Widget _buildAppbar(){
  return Container(
      width: MediaQuery.of(context).size.width,
      height: 1000,


      child: Container(

        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color_blueC,color_blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight

            ),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80),bottomRight: Radius.circular(0))
        ),
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: _buildheader(),

          ),
        ),

    );
  }

  Widget _buildheader(){
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height /5,
      //   margin: EdgeInsets.all(20),
      width: double.infinity,
      child: Stack(
        alignment: Alignment.topLeft,
        children: <Widget> [
          Positioned(
            left: 20,
            top: 20,
            child: Text("S'inscrire", style: TextStyle(
              fontSize: 25,
              color: color_white,
              fontWeight: FontWeight.bold,
            ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNomRow() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        keyboardType: TextInputType.text,
        onChanged: (value) {
          setState(() {
            nom = value;
          });
        },
        decoration: InputDecoration(
          alignLabelWithHint: true,
            /*enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(90)
            ),*/
            labelText: "Nom"),
      ),

    );
  }
  Widget _buildPrenomRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.text,
        onChanged: (value) {
          setState(() {
            prenom = value;
          });
        },
        decoration: InputDecoration(
            alignLabelWithHint: true,
            /*enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(90)
            ),*/
            labelText: 'Prénom' ),
      ),

    );
  }

  Widget _buildEmailRow() {
    return Padding(
      padding: EdgeInsets.all(2),
      child: TextFormField(
        keyboardType: TextInputType.text,
        onChanged: (value) {
          setState(() {
            email = value;
          });
        },
        decoration: InputDecoration(
            alignLabelWithHint: true,
            /*enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(90)
            ),*/
            labelText: 'Email' ),
      ),

    );
  }
  Widget _buildNum_telRow() {
    return Padding(
      padding: EdgeInsets.all(2),
      child: TextFormField(
        keyboardType: TextInputType.number,
        onChanged: (value) {
          setState(() {
            num_tel = value as int;
          });
        },
        decoration: InputDecoration(
            alignLabelWithHint: true,
            /*enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(90)
            ),*/
            labelText: 'Numéro de téléphone' ),
      ),

    );
  }

  Widget _buildAdresseRow() {
    return Padding(
      padding: EdgeInsets.all(2),
      child: TextFormField(
        keyboardType: TextInputType.text,
        onChanged: (value) {
          setState(() {
            adresse = value;
          });
        },
        decoration: InputDecoration(
            alignLabelWithHint: true,
            /*enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(90)
            ),*/
            labelText: 'Adresse' ),
      ),

    );
  }
  Widget _buildOperateurRow() {

    return Padding(
      padding: EdgeInsets.only(top: 30),
       child: DropdownButton<String>(
         value: dropdownValue,
         hint: const Text('Opérateur'),
         icon: Icon(Icons.keyboard_arrow_down_rounded , color: color_blueC, size: 40,),
         iconSize: 24,
         elevation: 16,
         style: TextStyle(color: color_blueC),
         underline: Container(
           height: 5,
         ),
         onChanged: (String newValue) {
           setState(() {
             dropdownValue = newValue;
           });
         },
         items: <String>['Orange', 'SFR', 'Free mobile', 'MVNOs']
             .map<DropdownMenuItem<String>>((String value) {
           return DropdownMenuItem<String>(
             value: value,
             child: Text(value),
           );
         }).toList(),
       )
    );
  }
  Widget _buildNum_contratRow() {
    return Padding(
      padding: EdgeInsets.all(2),
      child: TextFormField(
        keyboardType: TextInputType.number,
        onChanged: (value) {
          setState(() {
            num_contrat = value as int;
          });
        },
        decoration: InputDecoration(
            alignLabelWithHint: true,

           /* enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(90),
            ),*/
            labelText: 'N° Contrat' ),
      ),

    );
  }
  Widget _buildPasswordRow() {
    return Padding(
      padding: EdgeInsets.all(2),
      child: TextFormField(

        keyboardType: TextInputType.text,
        obscureText: true,
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        decoration: InputDecoration(
            alignLabelWithHint: true,
           /* enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(90)
            ),*/
            labelText: 'Mot de passe' ),
      ),

    );
  }

  Widget _buildConfirmPasswordRow() {
    return Padding(
      padding: EdgeInsets.all(2),
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: true,
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        decoration: InputDecoration(
            alignLabelWithHint: true,
            /*enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(90)
            ),*/
            labelText: 'Confirmer mot de passe' ),
      ),

    );
  }

  Widget _buildRegistreButton() {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.4 * (MediaQuery.of(context).size.height / 20),
          width: 5 * (MediaQuery.of(context).size.width / 10),
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            elevation: 5.0,
            color: mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            onPressed: () {},
            child: Text(
              "S'inscrire",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: MediaQuery.of(context).size.height / 40,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildContainer() {

    return Container(

      padding: EdgeInsets.only(top: 20),
      child:SingleChildScrollView(
      child: Row(

        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

        ClipRRect(
        borderRadius: BorderRadius.all(
        Radius.circular(20),
    ),
          child: Container(
            //width: 100,
            height: MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: BoxDecoration(
              color: Colors.white,
    ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                children: <Widget>[
                  Expanded(
                    // wrap your Column in Expanded
                    child: Column(
                      children: <Widget>[

                        Container(width: 130,child: _buildNomRow()),
                      ],
                    ),
                  ),
                  Expanded(// wrap your Column in Expanded
                    child: Column(

                      children: <Widget>[
                        Container(
                            width: 130,
                            child: _buildPrenomRow()),
                      ],
                    ),
                  ),
                ]
                ),
                Expanded(
                  // wrap your Column in Expanded
                  child: Column(
                    children: <Widget>[

                      Container(

                         // margin: EdgeInsets.only(left: 20),
                          width: 300,
                          child: _buildEmailRow()),
                      Expanded(
                        // wrap your Column in Expanded
                        child: Column(
                          children: <Widget>[

                            Container(

                              // margin: EdgeInsets.only(left: 20),
                                width: 300,
                                child: _buildNum_telRow(),

                            ),Container(

                              // margin: EdgeInsets.only(left: 20),
                              width: 300,
                              child:  _buildAdresseRow(),),
                            Row(

                              children: [
                                Expanded(

                                  // wrap your Column in Expanded
                                  child: Column(
                                    children: <Widget>[

                                      Container(
                                        // margin: EdgeInsets.only(left: 20),
                                          child: _buildOperateurRow()),

                                    ],
                                  ),
                                ),
                                Expanded(
                                  // wrap your Column in Expanded
                                  child: Column(
                                    children: <Widget>[

                                      Container(
                                        // margin: EdgeInsets.only(left: 20),
                                          width: 100,
                                          child: _buildNum_contratRow()),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(

                              // margin: EdgeInsets.only(left: 20),
                              width: 300,
                              child:  _buildPasswordRow(),),
                            Container(

                              // margin: EdgeInsets.only(left: 20),
                              width: 300,
                              child:  _buildConfirmPasswordRow()),
                          ])),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
        ],
      ),
    ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_gray,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 110),
        child: _buildAppbar()
      ),
      body: SingleChildScrollView(
        child: Stack(
        children: [

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildContainer(),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              _buildRegistreButton(),

            ],
          )
        ],
      ),
      ),
    );
  }
}