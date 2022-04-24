import 'package:flutter/material.dart';
import 'package:presensi/provider/provider_timer.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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
  // Timer timer;

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
        ],
      ),
    );
  }
}
