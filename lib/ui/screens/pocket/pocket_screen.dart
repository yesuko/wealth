import 'package:flutter/material.dart';
import 'package:wealth/ui/screens/pocket/components/pocketbody.dart';

class PocketScreen extends StatelessWidget {
  const PocketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PocketBody(),
    );
  }
}