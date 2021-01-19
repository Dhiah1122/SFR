
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sfr_designed/utls/color.dart';



class LoginScreen extends StatefulWidget {
    @override
    _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    String identifiant, password;

    Widget _buildLogo(){
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
                top: 0,
                child: Text("Connexion", style: TextStyle(
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
    Widget _buildEmailRow() {
        return Padding(
            padding: EdgeInsets.all(8),
            child: TextFormField(
                keyboardType: TextInputType.text,
                onChanged: (value) {
                    setState(() {
                        identifiant = value;
                    });
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(
                        Icons.account_circle_outlined,
                        color: mainColor,
                    ),
                    enabledBorder: UnderlineInputBorder(

                        borderRadius: BorderRadius.circular(90)
                    ),
                    labelText: 'Identifiant'),
            ),

        );
    }

    Widget _buildPasswordRow() {
        return Padding(
            padding: EdgeInsets.all(8),
            child: TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                onChanged: (value) {
                    setState(() {
                        password = value;
                    });
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(
                        Icons.lock,
                        color: mainColor,
                    ),
                    enabledBorder: UnderlineInputBorder(

                        borderRadius: BorderRadius.circular(90)
                    ),
                    labelText: 'Mot de passe',

                ),
            ),
        );
    }


    Widget _buildLoginButton() {

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
                            "Se Connecter",
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
        return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.all(
                        Radius.circular(50),
                    ),
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.35,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                            color: Colors.white,
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[

                                _buildEmailRow(),
                                _buildPasswordRow(),
                                //_buildForgetPasswordButton(),

                             //   _buildOrRow(),
                             //   _buildSocialBtnRow(),
                            ],
                        ),
                    ),
                ),
            ],
        );
    }

    Widget _buildSignUpBtn() {
        return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: FlatButton(
                        onPressed: () {},
                        child: RichText(
                            text: TextSpan(children: [
                                TextSpan(
                                    text: "Vous n'avez pas de compte ? ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: MediaQuery.of(context).size.height / 40,
                                        fontWeight: FontWeight.w400,
                                    ),
                                ),
                                TextSpan(
                                    text: "S'inscrire",
                                    style: TextStyle(
                                        color: mainColor,
                                        fontSize: MediaQuery.of(context).size.height / 40,
                                        fontWeight: FontWeight.bold,
                                    ),
                                )
                            ]),
                        ),
                    ),
                ),
            ],
        );
    }

    @override
    Widget build(BuildContext context) {
        return SafeArea(
            child: Scaffold(
                resizeToAvoidBottomPadding: false,
                backgroundColor: color_gray,
                body: Stack(
                    
                    children: <Widget>[
                        Container(
                            height: MediaQuery.of(context).size.height * 0.46,
                            width: MediaQuery.of(context).size.width,
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: const Radius.circular(90),
                                        bottomRight: const Radius.circular(0),
                                    ),
                                    gradient: LinearGradient(
                                        colors: [color_blueC,color_blue],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight

                                    )
                                ),
                            ),
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                                //_buildLogo(),
                                _buildLogo(),
                                _buildContainer(),
                                Padding(
                                    padding: EdgeInsets.only(top: 10),
                                ),
                                _buildLoginButton(),
                                _buildSignUpBtn(),
                            ],
                        )
                    ],
                ),
            ),
        );
    }
}