import 'package:flutter/material.dart';
import 'dart:ui';
import 'hospital_detail_page.dart';

class AIReferralResultScreen extends StatelessWidget {
  const AIReferralResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff9DA5B5),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("assets/images/bg.png", fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.15)),
          ),
          Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 83, 110, 151),
                      Color.fromARGB(255, 136, 143, 153),
                    ],
                  ),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(45),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
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
                        const Text(
                          "AI Referral Results",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          height: 95,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(
                              255,
                              198,
                              235,
                              209,
                            ).withOpacity(0.9),
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 58,
                                width: 58,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(
                                    255,
                                    168,
                                    222,
                                    188,
                                  ),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: const Icon(
                                  Icons.health_and_safety,
                                  color: Color(0xff2E7D32),
                                  size: 32,
                                ),
                              ),
                              const SizedBox(width: 14),
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Find Best Doctors Near You",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff1B5E20),
                                        fontSize: 17,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "AI recommends safest hospitals based on vitals",
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(18),
                  children: const [
                    _HospitalCard(
                      hospitalName: "District Hospital A",
                      distance: "18 km • 22 min",
                      doctor: "Trauma Specialist Available",
                      risk: "LOW",
                    ),
                    _HospitalCard(
                      hospitalName: "Medical Center B",
                      distance: "12 km • 15 min",
                      doctor: "Cardiac Doctor Available",
                      risk: "MEDIUM",
                    ),
                    _HospitalCard(
                      hospitalName: "City Care Hospital",
                      distance: "25 km • 30 min",
                      doctor: "ICU Specialist Available",
                      risk: "LOW",
                    ),
                    _HospitalCard(
                      hospitalName: "Regional Health Hub",
                      distance: "32 km • 40 min",
                      doctor: "General Surgeon Available",
                      risk: "CRITICAL",
                    ),
                    _HospitalCard(
                      hospitalName: "Emergency Medical Unit",
                      distance: "10 km • 12 min",
                      doctor: "Emergency Physician Available",
                      risk: "MEDIUM",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HospitalCard extends StatelessWidget {
  final String hospitalName;
  final String distance;
  final String doctor;
  final String risk;

  const _HospitalCard({
    required this.hospitalName,
    required this.distance,
    required this.doctor,
    required this.risk,
  });

  Color getRiskColor() {
    switch (risk) {
      case "LOW":
        return Colors.green;
      case "MEDIUM":
        return Colors.orange;
      case "CRITICAL":
        return Colors.red;
      default:
        return Colors.blueGrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => HospitalDetailPage(
              hospitalName: hospitalName,
              distance: distance,
              doctor: doctor,
              risk: risk,
            ),
          ),
        );
      },
      child: GlassCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Color(0xffE3F2FD),
                  child: Icon(Icons.local_hospital, color: Color(0xff536E97)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    hospitalName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: getRiskColor().withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    risk,
                    style: TextStyle(
                      color: getRiskColor(),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.location_on, size: 18, color: Colors.grey),
                const SizedBox(width: 6),
                Text(distance, style: const TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.person, size: 18, color: Colors.grey),
                const SizedBox(width: 6),
                Text(doctor),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: const [
                _FacilityChip("ICU"),
                _FacilityChip("Oxygen"),
                _FacilityChip("OT"),
                _FacilityChip("Blood"),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              "AI Reasoning: Based on patient vitals and facility readiness, this hospital offers the safest referral path.",
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class GlassCard extends StatelessWidget {
  final Widget child;
  const GlassCard({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(
          margin: const EdgeInsets.only(bottom: 14),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.75),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: Colors.white.withOpacity(0.4)),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
          ),
          child: child,
        ),
      ),
    );
  }
}

class _FacilityChip extends StatelessWidget {
  final String text;
  const _FacilityChip(this.text);

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: const Color(0xffE3F2FD),
      label: Text(
        text,
        style: const TextStyle(
          color: Color(0xff536E97),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
