import 'package:app/place_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _LoginPageState();

  }


 class _LoginPageState extends State<LoginPage>{
  @override

  String _user;
  String _password;
  final formkey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        key: scaffoldkey,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: ListView(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top:60),
                    child: FlutterLogo(size: 100),
                ),
                Padding(
                    padding: EdgeInsets.only(top:16),
                    child: Text(
                        "LizApp",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.pacifico(
                            textStyle: TextStyle(
                                color: Colors.pinkAccent,
                                fontWeight: FontWeight.w700,
                                fontSize: 58
                            )
                        )/*TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Signatra",
                  fontSize: 58
                )*/
                    )
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "¡Bienvenido!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.blue[500],
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                Form (
                  key: formkey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: 8, top:16, right: 8),
                          child:  Column(
                            children: <Widget>[
                              Container(
                                width: 300,
                                child: Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  color: Colors.pinkAccent,
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Icon(Icons.vpn_key,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Container(
                                        width: 252,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                bottomRight: Radius.circular(10),
                                                topRight: Radius.circular(10)
                                            )
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: TextFormField(
                                            validator: (value) => value.isEmpty ? "Contraseña es obligatorio" : null,
                                            onSaved: (value) => _password = value,
                                            style:TextStyle(
                                                color: Colors.black,
                                                fontSize: 18
                                            ),
                                            obscureText: true,
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Contraseña",
                                                fillColor: Colors.white,
                                                filled: true
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 8, top:16),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 300,
                                child: Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  color: Colors.pinkAccent,
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Icon(Icons.vpn_key,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Container(
                                        width: 252,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                bottomRight: Radius.circular(10),
                                                topRight: Radius.circular(10)
                                            )
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(8),
                                          child: TextFormField(
                                            validator: (value) => value.isEmpty ? "Contraseña es obligatorio" : null,
                                            onSaved: (value) => _password = value,
                                            style:TextStyle(
                                                color: Colors.black,
                                                fontSize: 18
                                            ),
                                            obscureText: true,
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Contraseña",
                                                fillColor: Colors.white,
                                                filled: true
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )

                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top:20,left: 8, right: 8),
                    child:Container(
                      width: 300,
                      height: 130,
                      padding: EdgeInsets.all(40),
                      child: RaisedButton(
                        color: Colors.pinkAccent,
                        child: Text(
                          "Iniciar Sesión",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        onPressed: (){
                          //accedemos al formulario
                          final form = formkey.currentState;
                          //llamamos a cada codigo de text.fromfield a ver si esta correcto
                          if(form.validate()){
                            form.save();
                            if(_user=="liz" && _password=="123"){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => PlacePage()
                                  )
                              );
                            }else{
                              scaffoldkey.currentState.showSnackBar(SnackBar(
                                content: Text("Usuario y/o contraseña erroneas"),
                          ));
                            }

                           // print ("Usuario: " +_user + " contraseña: " + _password);
                          }
                          //Para ir a la ultima ruta es .pop
                          //Comentarizado por mientras

                         /* */
                        },
                      ),
                    )
                )
              ],
            )
        )
    );
  }

}