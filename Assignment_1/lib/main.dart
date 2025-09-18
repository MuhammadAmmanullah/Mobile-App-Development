import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bidding Page Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      // ❌ FIX: remove const before Scaffold
      home: Scaffold(
        appBar: AppBar(title: const Text('Bidding Page')),
        body: const Center(child: MaximumBid()),
      ),
    );
  }
}

// Task requirement: MaximumBid extends StatefulWidget
class MaximumBid extends StatefulWidget {
  const MaximumBid({super.key});

  @override
  _MaximumBidState createState() => _MaximumBidState();
}

class _MaximumBidState extends State<MaximumBid> {
  int _currentMaxBid = 100; // starting bid

  void _increaseBid() {
    setState(() {
      _currentMaxBid += 50;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Product: Awesome Gadget',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            const Text(
              'Your current maximum bid:',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              '\$$_currentMaxBid',
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 18),
            ElevatedButton.icon(
              onPressed: _increaseBid,
              icon: const Icon(Icons.add),
              label: const Text('Increase Bid (+ \$50)'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
