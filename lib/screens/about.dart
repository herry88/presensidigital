import 'dart:async';
import 'package:flutter/material.dart';
import 'package:presensi/provider/provider_timer.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String scan = "Result Scan";
  String time = "00:00:01";
  String now = '';
  bool? _isMasuk; // true = masuk, false = pulang
  Timer? timer;

  //function ScanQr
  scanQr() async {
    String? scanResult = await FlutterBarcodeScanner.scanBarcode(
      '#ff6666',
      'Cancel',
      true,
      ScanMode.QR,
    );
    setState(() {
      scan = scanResult;
    });
  }

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => getTime());
    super.initState();
  }

  getTime() {
    DateTime now = DateTime.now();
    String formatTime = _formatTime(now);
    setState(() {
      time = formatTime;
    });
  }

  String _formatDate(DateTime dateTime) {
    return DateFormat('dd MM yyyy').format(dateTime);
  }

  String _formatTime(DateTime dateTime) {
    return DateFormat('HH:mm:ss').format(dateTime);
  }

  ProviderTimer _providerTimer = ProviderTimer();
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formatDate = _formatDate(now);

    return ChangeNotifierProvider<ProviderTimer>(
      create: (context) => ProviderTimer(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ProviderTimer>(
            builder: (context, _providerTimer, child) => Text(
              time,
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10),
          Text(
            formatDate,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 20),
          Text('Pilih Jenis Presensi'),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  //scanQr
                  scanQr();
                },
                child: const Text(
                  'In',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent,
                ),
                onPressed: () {
                  scanQr();
                },
                child: const Text(
                  'out',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
