import 'package:flutter/material.dart';
import 'package:veddle/pages/timer.dart';

class CycleStationDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    // Extracting the number of available cycles from arguments
    final int? cyclenumber = args?['cyclenumber'];

    if (args == null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.account_balance_wallet),
            onPressed: () {
              Navigator.pushNamed(context, '/wallet');
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.map),
              onPressed: () {
                Navigator.pushNamed(context, '/map');
              },
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                // Image placed above cycle station details
                Image.asset("lib/images/image.png"),
                SizedBox(height: 20),
                Text(
                  'Cycle Station Details:',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  'Number of available cycles: 60',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/qrcode');
                  },
                  child: Text('Click to Scan QR'),
                ),
                SizedBox(height: 20),
                SizedBox(height: 20),
                UsageHistory(),
              ],
            ),
          ),
        ),
      );
    } else {
      TimerCounter timerCounter = TimerCounter();
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.account_balance_wallet),
            onPressed: () {
              Navigator.pushNamed(context, '/wallet');
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.map),
              onPressed: () {
                Navigator.pushNamed(context, '/map');
              },
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Your Cycle Number is ${cyclenumber}'),
                SizedBox(height: 20),
                // Image placed above cycle station details
                timerCounter,
                SizedBox(height: 20),
                Text(
                  'Cycle Station Details:',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  'Number of available cycles: 60',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                SizedBox(height: 20),
                UsageHistory(),
              ],
            ),
          ),
        ),
      );
    }
  }
}

class UsageHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildHistoryItem('10 hours used on 27/3/2024'),
        buildHistoryItem('19 hours used on 21/3/2024'),
        buildHistoryItem('14 hours used on 3/3/2024'),
      ],
    );
  }

  Widget buildHistoryItem(String historyItem) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        historyItem,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
