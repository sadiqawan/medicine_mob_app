import 'package:flutter/material.dart';

import '../../../constant/styles_const.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Privacy Policy',style: TextStyle(fontWeight: FontWeight.bold),),centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Flexible(
                child: Text(
                    'Privacy Policy Your privacy is very important to us. Our app is committed to protecting your data and ensuring a secure experience ,for all users. We only collect information necessary to improve and personalize your experience with the app, such as usage data, device information, and any input you voluntarily provide.\n Data Collection and Usage\n We collect minimal data, including information about your interactions with the app, to offer a better user experience and support. This data helps us to analyze and improve app features and performance. \n Data Sharing and Security\n We do not share your personal data with third parties without your consent, except as required by law. All collected data is stored securely to prevent unauthorized access.\n Changes to Privacy Policy\n We may update this Privacy Policy periodically to reflect improvements and legal requirements. Any changes will be notified to users within the app. \n Contact Us\n If you have questions or concerns about this Privacy Policy, please feel free to contact our support team through the app.',style: smallPrimaryBoldItalicText,))
          ],
        ),
      ),
    );
  }
}
