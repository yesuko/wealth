import 'package:flutter/material.dart';
import 'package:wealth/ui/widgets/messenger.dart';

class UpdateAppScreen extends StatefulWidget {
  const UpdateAppScreen({super.key});

  @override
  State<UpdateAppScreen> createState() => _UpdateAppScreenState();
}

class _UpdateAppScreenState extends State<UpdateAppScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _showAlert());
  }

  _showAlert() {
    Messenger.showAlertDialog(
        message: "New version of App is available",
        context: context,
        actionsAlignment: MainAxisAlignment.center,
        actions: [TextButton(onPressed: () {}, child: const Text("Update"))]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}
