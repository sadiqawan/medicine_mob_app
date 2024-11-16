import 'package:flutter/material.dart';
import 'package:medicine_app/constant/styles_const.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Help & Support',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'How do I use the app?\nSimply follow the on-screen instructions after logging in to explore all features. Each section includes brief instructions to make navigation easier.\nCreating an Account\nYou can create an account by providing basic details in the registration section. Follow the prompts to get started!',
              style: smallPrimaryBoldItalicText,
            )
          ],
        ),
      ),
    );
  }
}
