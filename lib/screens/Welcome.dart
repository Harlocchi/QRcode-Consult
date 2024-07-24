import 'package:flutter/material.dart';
import 'package:qrcode/screens/Login.dart';
import 'package:qrcode/transition/aroudRightToLeft.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF031D63), Color(0xff03d4ab1)],
            )
        ),
        child: const Column(
          children: [
            ExpadedCpconLogo(),
            ExpadedButtonEnter(),
          ],
        ),
      ),
    );
  }
}

class ExpadedCpconLogo extends StatelessWidget {
  const ExpadedCpconLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child:Container(
          width: double.infinity,

          child: Padding(
            padding: const EdgeInsets.only(top: 250),
            child: ColorFiltered(
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
                child: Center(
                    child: Image.asset('assets/images/logo.png', width: 300,
                    )
            )
            ),
          ),
        )
    );
  }
}

class ExpadedButtonEnter extends StatelessWidget {
  const ExpadedButtonEnter({Key? key}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
          decoration: const BoxDecoration(

          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonLogin(),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Version: 2.4.1", style: TextStyle(
                        fontFamily: "ProductSansRegular",
                        color: Colors.white
                    ),),
                    SizedBox(width: 10),
                    Text("Homolog", style: TextStyle(
                        fontFamily: "ProductSansRegular",
                        color: Colors.white
                    ),),
                  ]
              ),
            ],
          )
      ),
    );
  }
}



class ButtonLogin extends StatelessWidget {
  const ButtonLogin({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(

            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 125,
                  vertical:20,
                ),
                backgroundColor : Colors.white,
                elevation:10.0
            ),
            onPressed: () => Navigator.push(
              context,
              CustomPageRoute(child: const Login())
              ),
            child: const Text(
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'ProductSansBold',
                  color: Color(0xff03d4ab1),
                ),
                "Login"
            )
        )
    );
  }
}