import 'package:flutter/material.dart';

class CycleStationDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.account_balance_wallet),
          onPressed: () {
            // Handle wallet button press
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            // Add option to add an image
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
            // Add "Click to Scan QR" button
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
    );
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
