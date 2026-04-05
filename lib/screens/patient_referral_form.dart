import 'package:flutter/material.dart';
import 'dart:ui';
import 'ai_referral_result_screen.dart';

class PatientReferralForm extends StatelessWidget {
  const PatientReferralForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff9DA5B5),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 157, 165, 181),
                  Color.fromARGB(255, 215, 220, 230),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          Column(
            children: [
              /// 🔵 HEADER WITH BACK BUTTON
              Container(
                height: 180,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 60, left: 10, right: 20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 83, 110, 151),
                      Color.fromARGB(255, 136, 143, 153),
                    ],
                  ),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(40),
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(width: 6),

                    const Expanded(
                      child: Text(
                        "Patient Referral Form",
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(18),
                  child: GlassFormCard(
                    child: Column(
                      children: [
                        GlassInput("Disease / Injury", Icons.medical_services),
                        const SizedBox(height: 18),

                        GlassInput("Blood Pressure", Icons.favorite),
                        const SizedBox(height: 18),

                        GlassInput("Oxygen Level", Icons.air),
                        const SizedBox(height: 18),

                        GlassInput("Heart Rate", Icons.monitor_heart),
                        const SizedBox(height: 18),

                        GlassInput(
                          "Required Treatment (ICU / Surgery)",
                          Icons.local_hospital,
                        ),

                        const SizedBox(height: 35),

                        GlassButton(
                          text: "Check AI Hospitals",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const AIReferralResultScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
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

class GlassFormCard extends StatelessWidget {
  final Widget child;
  const GlassFormCard({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.65),
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: Colors.white.withOpacity(0.3)),
          ),
          child: child,
        ),
      ),
    );
  }
}

class GlassInput extends StatelessWidget {
  final String hint;
  final IconData icon;

  const GlassInput(this.hint, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: TextField(
          style: const TextStyle(fontSize: 15),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 22),
            hintText: hint,
            prefixIcon: Icon(icon, color: const Color(0xff536E97)),
            filled: true,
            fillColor: Colors.white.withOpacity(0.75),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}

class GlassButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const GlassButton({required this.text, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 58,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 83, 110, 151),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          elevation: 4,
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 17,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
