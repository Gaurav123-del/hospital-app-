import 'package:flutter/material.dart';
import 'package:rural_referral_app/screens/login_up.dart';

class DoctorDetailsPage extends StatelessWidget {
  const DoctorDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEF2F8),

      /// 🔵 GRADIENT HEADER (APP STYLE)
      body: Column(
        children: [

          Container(
            padding: const EdgeInsets.fromLTRB(16, 55, 16, 25),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 83, 110, 151),
                  Color.fromARGB(255, 136, 143, 153),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(30)),
            ),
            child: Row(
              children: [

                /// BACK
                IconButton(
                  icon:
                      const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),

                const Expanded(
                  child: Text(
                    "Doctor Details",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                /// LOGOUT
                IconButton(
                  icon: const Icon(Icons.logout, color: Colors.white),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LoginPage(),
                      ),
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),

          /// ⚪ MAIN CONTENT
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// 👨‍⚕️ DOCTOR CARD
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 12,
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.asset(
                            "assets/images/doctorni.png",
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 14),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dr. Ankita Gupta",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text("Neurosurgery"),
                              SizedBox(height: 4),
                              Text(
                                "📍 Ludhiana, Punjab",
                                style:
                                    TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.favorite_border,
                            color: Colors.red),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

  
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                    children: const [
                      _StatItem("5000+", Icons.people),
                      _StatItem("4.9", Icons.star),
                      _StatItem("35,778", Icons.chat),
                    ],
                  ),

                  const SizedBox(height: 28),

                  _sectionTitle("Descriptions"),
                  const SizedBox(height: 8),
                  const Text(
                    "Neurosurgery services encompass a wide range of medical treatments and surgical interventions aimed at diagnosing, treating, and managing disorders of the brain, spine, and nervous system.",
                    style: TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 24),

                  _sectionTitle("Consultation Charges"),
                  const SizedBox(height: 6),
                  const Text("\$50/hr",
                      style:
                          TextStyle(fontWeight: FontWeight.bold)),

                  const SizedBox(height: 24),

                  _sectionTitle("Available Hours"),
                  const SizedBox(height: 6),
                  const Text(
                    "Monday to Friday , 02:00 AM to 08:30 PM",
                    style: TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 24),

                  /// ⭐ REVIEWS HEADER
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Reviews",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "See All",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🧾 SECTION TITLE
  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}

/// 📊 STAT ITEM (APP STYLE)
class _StatItem extends StatelessWidget {
  final String text;
  final IconData icon;
  const _StatItem(this.text, this.icon);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xffE3F2FD),
          child: Icon(icon, color: Colors.blue),
        ),
        const SizedBox(height: 6),
        Text(
          text,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }
}