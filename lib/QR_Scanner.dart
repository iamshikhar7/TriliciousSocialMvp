import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanner extends StatefulWidget {
  const QRScanner({Key? key}) : super(key: key);

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: "QR");
  QRViewController? controller;
  Barcode? barcode;
  static final validCharacters = RegExp(r'^[a-zA-Z0-9]+$');
  late Timer timer;

  @override
  void dispose() {
    // TODO: implement dispose
    controller?.dispose();
    super.dispose();
    timer.cancel();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loogpSetState();
  }

  loogpSetState() {
    timer = Timer.periodic(Duration(seconds: 2), (Timer t) {
      setState(() {});
    });
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    await controller!.resumeCamera();
    loogpSetState();
  }

  bool invalid = false;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            buildQRView(context),
            Positioned(
              child: buildResult(),
              bottom: 32,
            ),
            Positioned(
              child: buildTopControls(),
              top: 0,
            ),
          ],
        ),
      ),
    );
  }

  buildTopControls() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: const BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () async {
                await controller?.toggleFlash();
                setState(() {});
              },
              icon: FutureBuilder<bool?>(
                future: controller?.getFlashStatus(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return Icon(
                      snapshot.data!
                          ? Icons.flash_on_sharp
                          : Icons.flash_off_sharp,
                      color: Colors.white,
                      size: 30,
                    );
                  } else {
                    return Container();
                  }
                },
              )),
          IconButton(
            onPressed: () async {
              await controller?.flipCamera();
              setState(() {});
            },
            icon: FutureBuilder(
              future: controller?.getCameraInfo(),
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return const Icon(
                    Icons.switch_camera,
                    color: Colors.white,
                    size: 30,
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  buildResult() {
    return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          barcode != null ? 'Result: \n${barcode!.code}' : 'Scan a code!',
          maxLines: 3,
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 18,
          ),
        ));
  }

  buildQRView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.yellowAccent,
          borderRadius: 12,
          borderLength: 20,
          borderWidth: 10,
          cutOutSize: MediaQuery.of(context).size.width * 0.65),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((barcode) async {
      setState(() {
        this.barcode = barcode;
      });
      var txt = barcode.code.toString();
      if (true) {
          
        if (!invalid) {
          log("validated");
          setState(() {
            invalid = true;
          });
        }
      } else {
        if (!invalid) {
          setState(() {
            invalid = true;
          });
        }
      }
    });
  }
}
