import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrcode/utilsStyled/Inputs.dart';

import '../credentials.dart';


class Workspace extends StatefulWidget {
  const Workspace({super.key});

  @override
  State<Workspace> createState() => _WorkspaceState();
}

class _WorkspaceState extends State<Workspace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: Colors.white, // Fundo branco
          child: const QrCodeButton(),
        ),
      ),
    );
  }
}

class QrCodeButton extends StatefulWidget {
  const QrCodeButton({super.key});

  @override
  State<QrCodeButton> createState() => _QrCodeButtonState();
}

class _QrCodeButtonState extends State<QrCodeButton> {

  credential cred = credential();
  String _code = "";
  Map<String, dynamic>? _data = {};
  Future<List<Map<String, dynamic>?>> futureData = Future.value([]);

  late TextEditingController _controller;
   void _editVarQrCode() async{
      String read = "";
      try {
        ScanResult qr = await BarcodeScanner.scan();
        read = qr.rawContent;
        print(read);
      } catch (e) {
        read = "";
      }
       setState(() {
         _code = read;
         _controller.text = _code;
       });
  }


  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _code);
  }

  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
      ),
      child: Column(
        children: [
          Padding(padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 10,
                padding: EdgeInsets.zero, // Remove o padding padrão do botão
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Define o raio das bordas
                ),
              ),
              child:  Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.indigo,
                ),
                width: 100,
                height: 100,
                child: const Center(
                  child: Icon(
                    Icons.qr_code_scanner_sharp,
                    color: Colors.white,
                    size: 80,
                  ),
                ),
              ),
              onPressed: (){
                 _editVarQrCode();
              },
            ),
          ),

          Padding(padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
            child: CustomTextFieldDecoration(
              child:TextField(
                controller: _controller,
                onChanged: (value){
                  setState(() {
                    _code = value;
                  });
                },
                style: const TextStyle(
                    color: Color(0xff03d4ab1),
                    fontFamily: "ProductSansRegular"
                ),
                decoration: InputDecoration(
                  labelText: "Codigo da Pulseira",
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: Color(0xff03d4ab1),
                    ),
                    onPressed: () async {
                      setState(() {
                        futureData = cred.getPeople(_code);
                      });
                      /*setState(() async {
                        _data = await cred.getPeople(_code);
                      });*/
                    },
                  ),
                ),
              ),
            ),
          ),
          FutureBuilder(future: futureData, builder: (context, snap){

            if(snap.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator(
                color: Colors.amber,
              );
            }

            List<Map<String, dynamic>?> results = snap.data??[];
            if(snap.hasError){
              return Text("Não deu não vei");
            }

            if(results.isEmpty){
              return Text("ta vazio vein");
            }

            return Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: const Padding(padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                    child: Text(
                      "nome:",
                      style: TextStyle(
                          color: Color(0xff03d4ab1),
                          fontFamily: "ProductSansBold"
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child:  const Padding(padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                    child: Text(
                      'oi',
                      style: const TextStyle(
                          color: Color(0xff03d4ab1),
                          fontFamily: "ProductSansBold"
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: const Padding(padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                    child: Text(
                      "nome:",
                      style: TextStyle(
                          color: Color(0xff03d4ab1),
                          fontFamily: "ProductSansBold"
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: const Padding(padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                    child: Text(
                      "",
                      style: TextStyle(
                          color: Color(0xff03d4ab1),
                          fontFamily: "ProductSansBold"
                      ),
                    ),
                  ),
                ),    Container(
                  alignment: Alignment.topLeft,
                  child: Padding(padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                    child: Text(
                      "${snap.data?[0]?['username']}",
                      style: TextStyle(
                          color: Color(0xff03d4ab1),
                          fontFamily: "ProductSansBold"
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: const Padding(padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                    child: Text(
                      "ANNE MARTINS FERREIRA",
                      style: TextStyle(
                          color: Color(0xff03d4ab1),
                          fontFamily: "ProductSansBold"
                      ),
                    ),
                  ),
                ),    Container(
                  alignment: Alignment.topLeft,
                  child: const Padding(padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                    child: Text(
                      "nome:",
                      style: TextStyle(
                          color: Color(0xff03d4ab1),
                          fontFamily: "ProductSansBold"
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: const Padding(padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                    child: Text(
                      "ANNE MARTINS FERREIRA",
                      style: TextStyle(
                          color: Color(0xff03d4ab1),
                          fontFamily: "ProductSansBold"
                      ),
                    ),
                  ),
                ),    Container(
                  alignment: Alignment.topLeft,
                  child: const Padding(padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                    child: Text(
                      "nome:",
                      style: TextStyle(
                          color: Color(0xff03d4ab1),
                          fontFamily: "ProductSansBold"
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: const Padding(padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                    child: Text(
                      "ANNE MARTINS FERREIRA",
                      style: TextStyle(
                          color: Color(0xff03d4ab1),
                          fontFamily: "ProductSansBold"
                      ),
                    ),
                  ),
                ),    Container(
                  alignment: Alignment.topLeft,
                  child: const Padding(padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                    child: Text(
                      "nome:",
                      style: TextStyle(
                          color: Color(0xff03d4ab1),
                          fontFamily: "ProductSansBold"
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: const Padding(padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                    child: Text(
                      "ANNE MARTINS FERREIRA",
                      style: TextStyle(
                          color: Color(0xff03d4ab1),
                          fontFamily: "ProductSansBold"
                      ),
                    ),
                  ),
                )
              ],
            );
          })

        ],
      ),
    );
  }
}
