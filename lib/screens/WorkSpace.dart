import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';


class Workspace extends StatelessWidget {
  const Workspace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              width: double.infinity,
              color: Colors.white, // Fundo branco
              child: const qrCodeButton(),
            ),
          ),
        ],
      ),
    );
  }
}

class qrCodeButton extends StatefulWidget {
  const qrCodeButton({super.key});

  @override
  State<qrCodeButton> createState() => _qrCodeButtonState();
}

class _qrCodeButtonState extends State<qrCodeButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 5,
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
          ),
          child: Column(
            children: [

              Container(
                width: 100, // Largura do quadrado
                height: 100, // Altura do quadrado
                color: Colors.indigo, // Cor de fundo
              ),
            ],
          ),
        )
    );
  }
  Future<String> getCode() async{
    String read = "";
    try {
      ScanResult qr = await BarcodeScanner.scan();
      read = qr.rawContent;
    } catch (e) {
      read = "";
    }
    return read;
  }
}
