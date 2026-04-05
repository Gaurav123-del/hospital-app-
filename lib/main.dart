import 'package:flutter/material.dart';
import 'package:rural_referral_app/screens/start_page.dart';

void main() {
  runApp(const RuralReferralApp());
}

class RuralReferralApp extends StatelessWidget {
  const RuralReferralApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'BookmanOldStyle',
      ),
      home: const StartPage(),
    );
  }
}