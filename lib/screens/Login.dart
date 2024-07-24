import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:qrcode/credentials.dart';
import 'package:qrcode/screens/WorkSpace.dart';
import 'package:qrcode/transition/aroudRightToLeft.dart';
import 'package:qrcode/utilsStyled/Inputs.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          MainWidgetLogin(),
          voidExpanded()
        ],
      ),
    );
  }
}


class MainWidgetLogin extends StatefulWidget {
  const MainWidgetLogin({super.key});

  @override
  State<MainWidgetLogin> createState() => _MainWidgetLoginState();
}
class _MainWidgetLoginState extends State<MainWidgetLogin> {
  @override
  Widget build(BuildContext context) {
    return  Expanded(
        flex: 5,
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
          ),
          child: const InputsWidget(),
        )
    );;
  }
}

class InputsWidget extends StatefulWidget {
  const InputsWidget({super.key});

  @override
  State<InputsWidget> createState() => _InputsWidgetState();
}

credential cred = credential();
const isLoadingLogin = false;
final TextEditingController _user = TextEditingController();
final TextEditingController _password = TextEditingController();

class _InputsWidgetState extends State<InputsWidget> {
  credential credentials = credential();

  bool _obscureText = true;
  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 10,
        decoration: const BoxDecoration(
        ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB (0,100,0,0),
            child: Image.asset(
              "assets/images/bgIconCubofix.png",
              width: 100,

            ),
          ),

           const Padding(
             padding: EdgeInsets.fromLTRB (0,30,0,10),
             child: Text("Login",
               style: TextStyle(
                   fontFamily: "ProductSansBold",
                   color:Color(0xff03d4ab1),
                    fontSize: 30,
               ),
             ),
           ),

            Container(
              width: 300,
              child: Column(
                children: [
                  Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,0,0,2),
                          child: CustomTextFieldDecoration(
                              child:  TextField(
                              controller: _user,
                              style:  const TextStyle(
                                  fontFamily: "ProductSansRegular",
                                  color: Color(0xff03d4ab1)
                              ),
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.account_circle,
                                  size: 30.0,
                                  color: Color(0xff03d4ab1),
                                ),
                              ),
                            )
                                              ),
                        ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,0,0,10),
                            child: CustomTextFieldDecoration(child:
                            TextField(
                              controller: _password,
                              style: const TextStyle(
                                  color: Color(0xff03d4ab1),
                                  fontFamily: "ProductSansRegular"
                              ),
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  size: 30.0,
                                  color: Color(0xff03d4ab1),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText ? Icons.visibility : Icons.visibility_off,
                                    color: Color(0xff03d4ab1),
                                  ),
                                  onPressed: _toggleObscureText,
                                ),
                              ),

                            )
                            ),
                          )
                      ],
                )

                   ]
              ),
            ),
          Container(
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(padding: EdgeInsets.fromLTRB(10, 10, 0,0),
                    child: Text(
                        "Forgot my password",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xff03d4ab1),

                        fontFamily: "ProductSansRegular",
                        color: Color(0xff03d4ab1)
                      ),
                    ),

                  ),
                   ElevatedButton(
                     style: ElevatedButton.styleFrom(
                       padding: const EdgeInsets.symmetric(
                         horizontal: 30,
                         vertical:20,
                       ),
                         backgroundColor : const Color(0xff03d4ab1),
                         elevation:10.0,
                     ),
                     onPressed: () async {
                         String jwt = await cred.getTokenJWT(_user.text, _password.text);


                         Navigator.pushAndRemoveUntil(
                           context,
                           MaterialPageRoute(builder: (context) => const Workspace()),
                               (Route<dynamic> route) => false,
                         );
                     }
                     child: isLoadingLogin ? ,
                       style: TextStyle(
                         fontFamily: "ProductSansBold",
                         color: Colors.white
                       ),
                     ),

                  ),
              ]
            ),
          ),

        ],
      )
    );
  }
}



class voidExpanded extends StatelessWidget {
  const voidExpanded({super.key});
  @override
  Widget build(BuildContext context) {
    return const Expanded(flex: 3, child: SizedBox());
  }
}





