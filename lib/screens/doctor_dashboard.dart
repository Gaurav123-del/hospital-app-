// import 'package:flutter/material.dart';
// import 'dart:ui';
// import 'patient_referral_form.dart';

// class DoctorDashboard extends StatelessWidget {
//   const DoctorDashboard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 157, 165, 181),
//       body: SafeArea(
//         child: Column(
//           children: const [
//             ConsultationHeader(),
//             Expanded(child: DashboardBody()),
//           ],
//         ),
//       ),
//     );
//   }
// }

// /// 🔵 HEADER
// class ConsultationHeader extends StatelessWidget {
//   const ConsultationHeader({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             Color.fromARGB(255, 83, 110, 151),
//             Color.fromARGB(255, 136, 143, 153),
//           ],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.vertical(
//           bottom: Radius.circular(35),
//         ),
//       ),

//       /// 🔥 STACK FIX (BIG IMAGE + CLEAN ALIGNMENT)
//       child: Stack(
//         children: [

//           /// 👩‍⚕️ DOCTOR IMAGE LEFT SIDE
//           Positioned(
//             left: 0,
//             top: 0,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: Image.asset(
//                 "assets/images/doctorni.png",
//                 height: 120,   // 👈 balanced size
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),

//           /// RIGHT SIDE CONTENT
//           Padding(
//             padding: const EdgeInsets.only(left: 12), // space for image
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [

//                 /// 🔹 TOP TITLE ROW
//                 Row(
//   mainAxisAlignment: MainAxisAlignment.end,
//   children: const [
//     Text(
//       "Dr.Ryia Sharma",
//       style: TextStyle(
//         color: Colors.white,
//         fontSize: 26,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//   ],
// ),

//                 const SizedBox(height: 18),

//                 /// 🔹 RIGHT ALIGNED TEXT
//                 const Align(
//                   alignment: Alignment.centerRight,
//                   child: Text(
//                     "Find Your Desired\nSpecialist",
//                     textAlign: TextAlign.right,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 18),

//                 /// 🔍 SEARCH BAR
//                 const _SearchBar(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// class _SearchBar extends StatelessWidget {
//   const _SearchBar();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       height: 50,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(30),
//         boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
//       ),
//       child: const TextField(
//         decoration: InputDecoration(
//           hintText: "Search specialist or hospital",
//           border: InputBorder.none,
//           icon: Icon(Icons.search),
//         ),
//       ),
//     );
//   }
// }

// /// ⚪ BODY
// class DashboardBody extends StatelessWidget {
//   const DashboardBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(18),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: const [
//           EmergencyCard(),
//           SizedBox(height: 26),
//           Text(
//             "AI Risk Overview",
//             style: TextStyle(
//                 fontSize: 20,
//                 color: Colors.blueGrey,
//                 fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 14),
//           StatGrid(),
//           SizedBox(height: 26),
//           Text(
//             "Recent AI Referrals",
//             style: TextStyle(
//                 fontSize: 20,
//                 color: Colors.blueGrey,
//                 fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 14),
//           ActivityTile(
//             title: "Trauma Case Referred",
//             subtitle: "District Hospital A",
//           ),
//           ActivityTile(
//             title: "Cardiac Case Critical",
//             subtitle: "Medical Center B",
//           ),
//         ],
//       ),
//     );
//   }
// }

// /// 🚨 EMERGENCY CARD
// class EmergencyCard extends StatelessWidget {
//   const EmergencyCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GlassCard(
//       child: Row(
//         children: [
//           const Icon(Icons.emergency, color: Color(0xff536E97), size: 36),
//           const SizedBox(width: 14),
//           const Expanded(
//             child: Text(
//               "Start AI Emergency Referral",
//               style: TextStyle(
//                   fontSize: 18,
//                   color: Colors.blueGrey,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//           BlinkingStartButton(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (_) => const PatientReferralForm()),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// /// ⭐ GLASS CARD
// class GlassCard extends StatelessWidget {
//   final Widget child;
//   const GlassCard({required this.child, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(22),
//       child: BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
//         child: Container(
//           padding: const EdgeInsets.all(18),
//           margin: const EdgeInsets.only(bottom: 12),
//           decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.75),
//             borderRadius: BorderRadius.circular(22),
//             border: Border.all(color: Colors.white.withOpacity(0.4)),
//             boxShadow: const [
//               BoxShadow(color: Colors.black12, blurRadius: 10)
//             ],
//           ),
//           child: child,
//         ),
//       ),
//     );
//   }
// }

// /// 📊 STAT GRID
// class StatGrid extends StatelessWidget {
//   const StatGrid({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: const [
//         Row(
//           children: [
//             Expanded(child: StatCard("Today's Cases", "12", Icons.people)),
//             SizedBox(width: 14),
//             Expanded(child: StatCard("Critical", "3", Icons.warning)),
//           ],
//         ),
//         SizedBox(height: 14),
//         Row(
//           children: [
//             Expanded(child: StatCard("Referred", "8", Icons.send)),
//             SizedBox(width: 14),
//             Expanded(child: StatCard("Beds", "5", Icons.bed)),
//           ],
//         ),
//       ],
//     );
//   }
// }

// /// 🧩 STAT CARD WITH BACKGROUND IMAGE
// class StatCard extends StatelessWidget {
//   final String title;
//   final String value;
//   final IconData icon;

//   const StatCard(this.title, this.value, this.icon, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 130,
//       margin: const EdgeInsets.only(bottom: 10),
//       child: Stack(
//         children: [

//           /// 🖼️ FULL IMAGE BACKGROUND (NO EFFECT)
//           ClipRRect(
//             borderRadius: BorderRadius.circular(15), // 👈 radius 15
//             child: Image.asset(
//               "assets/images/bg_shape.png",
//               width: double.infinity,
//               height: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ),

//           /// ⭐ CONTENT ABOVE IMAGE
//           Padding(
//             padding: const EdgeInsets.all(14),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CircleAvatar(
//                   radius: 18,
//                   backgroundColor: const Color(0xffD9DEE6),
//                   child: Icon(icon, color: const Color(0xff536E97)),
//                 ),

//                 const Spacer(),

//                 Text(
//                   value,
//                   style: const TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black87,
//                   ),
//                 ),

//                 Text(
//                   title,
//                   style: const TextStyle(
//                     fontSize: 12,
//                     color: Colors.black54,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// /// 🧾 ACTIVITY TILE
// class ActivityTile extends StatelessWidget {
//   final String title;
//   final String subtitle;

//   const ActivityTile(
//       {required this.title, required this.subtitle, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GlassCard(
//       child: Row(
//         children: [
//           const CircleAvatar(
//             backgroundColor: Color(0xffE3F2FD),
//             child: Icon(Icons.history, color: Color(0xff536E97)),
//           ),
//           const SizedBox(width: 14),
//           Expanded(child: Text("$title\n$subtitle")),
//         ],
//       ),
//     );
//   }
// }

// /// 🔴 BLINKING BUTTON
// class BlinkingStartButton extends StatefulWidget {
//   final VoidCallback onTap;
//   const BlinkingStartButton({super.key, required this.onTap});

//   @override
//   State<BlinkingStartButton> createState() => _BlinkingStartButtonState();
// }

// class _BlinkingStartButtonState extends State<BlinkingStartButton>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _opacity;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     )..repeat(reverse: true);

//     _opacity =
//         Tween<double>(begin: 1.0, end: 0.5).animate(_controller);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FadeTransition(
//       opacity: _opacity,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: const Color.fromARGB(255, 204, 16, 38),
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         ),
//         onPressed: widget.onTap,
//         child: const Text("Start", style: TextStyle(color: Colors.white)),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'dart:ui';
import 'doctor_details_page.dart';
import 'patient_referral_form.dart';

/// =======================================================
/// 🩺 DOCTOR DASHBOARD (FULL REWRITTEN + FIXED VERSION)
/// =======================================================

class DoctorDashboard extends StatelessWidget {
  const DoctorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 157, 165, 181),
      body: SafeArea(
        child: Column(
          children: [
            ConsultationHeader(),
            Expanded(child: DashboardBody()),
          ],
        ),
      ),
    );
  }
}

/// =======================================================
/// 🔵 HEADER (NOW STATEFUL WITH PROFILE PANEL)
/// =======================================================

class ConsultationHeader extends StatefulWidget {
  const ConsultationHeader({super.key});

  @override
  State<ConsultationHeader> createState() => _ConsultationHeaderState();
}

class _ConsultationHeaderState extends State<ConsultationHeader> {
  bool showProfile = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 83, 110, 151),
            Color.fromARGB(255, 136, 143, 153),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(35)),
      ),
      child: Stack(
        children: [
          /// 👩‍⚕️ DOCTOR IMAGE (CLICK TO OPEN PROFILE)
          Positioned(
            left: 0,
            top: 0,
            child: GestureDetector(
              onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const DoctorDetailsPage(),
    ),
  );
},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/doctorni.png",
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          /// 🔹 RIGHT SIDE CONTENT
          const Padding(
            padding: EdgeInsets.only(left: 130),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Dr.Ryia Sharma",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 18),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Find Your Desired\nSpecialist",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 18),
                _SearchBar(),
              ],
            ),
          ),

          /// 👈 SLIDING PROFILE PANEL
          // AnimatedPositioned(
          //   duration: const Duration(milliseconds: 350),
          //   curve: Curves.easeInOut,

          //   top: 0,
          //   child: Material(
          //     elevation: 20,
          //     color: const Color(0xff536E97),
          //     child: SafeArea(
          //       child: Padding(
          //         padding: const EdgeInsets.all(18),
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: const [
          //             CircleAvatar(
          //               radius: 35,
          //               backgroundImage: AssetImage(
          //                 "assets/images/doctorni.png",
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

/// =======================================================
/// 🔍 SEARCH BAR
/// =======================================================

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: "Search specialist or hospital",
          border: InputBorder.none,
          icon: Icon(Icons.search),
        ),
      ),
    );
  }
}

/// =======================================================
/// ⚪ BODY
/// =======================================================

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          EmergencyCard(),
          SizedBox(height: 26),
          Text(
            "AI Risk Overview",
            style: TextStyle(
              fontSize: 20,
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 14),
          StatGrid(),
          SizedBox(height: 26),
          Text(
            "Recent AI Referrals",
            style: TextStyle(
              fontSize: 20,
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 14),
          ActivityTile(
            title: "Trauma Case Referred",
            subtitle: "District Hospital A",
          ),
          ActivityTile(
            title: "Cardiac Case Critical",
            subtitle: "Medical Center B",
          ),
        ],
      ),
    );
  }
}

/// =======================================================
/// 🚨 EMERGENCY CARD
/// =======================================================

class EmergencyCard extends StatelessWidget {
  const EmergencyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Row(
        children: [
          const Icon(Icons.emergency, color: Color(0xff536E97), size: 36),
          const SizedBox(width: 14),
          const Expanded(
            child: Text(
              "Start AI Emergency Referral",
              style: TextStyle(
                fontSize: 18,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          BlinkingStartButton(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PatientReferralForm()),
              );
            },
          ),
        ],
      ),
    );
  }
}

/// =======================================================
/// ⭐ GLASS CARD
/// =======================================================

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
          padding: const EdgeInsets.all(18),
          margin: const EdgeInsets.only(bottom: 12),
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

/// =======================================================
/// 📊 STAT GRID
/// =======================================================

class StatGrid extends StatelessWidget {
  const StatGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Row(
          children: [
            Expanded(child: StatCard("Today's Cases", "12", Icons.people)),
            SizedBox(width: 14),
            Expanded(child: StatCard("Critical", "3", Icons.warning)),
          ],
        ),
        SizedBox(height: 14),
        Row(
          children: [
            Expanded(child: StatCard("Referred", "8", Icons.send)),
            SizedBox(width: 14),
            Expanded(child: StatCard("Beds", "5", Icons.bed)),
          ],
        ),
      ],
    );
  }
}

/// =======================================================
/// 🧩 STAT CARD
/// =======================================================

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const StatCard(this.title, this.value, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: const EdgeInsets.only(bottom: 10),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              "assets/images/bg_shape.png",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: const Color(0xffD9DEE6),
                  child: Icon(icon, color: const Color(0xff536E97)),
                ),
                const Spacer(),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// =======================================================
/// 🧾 ACTIVITY TILE
/// =======================================================

class ActivityTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const ActivityTile({required this.title, required this.subtitle, super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Color(0xffE3F2FD),
            child: Icon(Icons.history, color: Color(0xff536E97)),
          ),
          const SizedBox(width: 14),
          Expanded(child: Text("$title\n$subtitle")),
        ],
      ),
    );
  }
}

/// =======================================================
/// 🔴 BLINKING BUTTON
/// =======================================================

class BlinkingStartButton extends StatefulWidget {
  final VoidCallback onTap;
  const BlinkingStartButton({super.key, required this.onTap});

  @override
  State<BlinkingStartButton> createState() => _BlinkingStartButtonState();
}

class _BlinkingStartButtonState extends State<BlinkingStartButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _opacity = Tween<double>(begin: 1.0, end: 0.5).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 204, 16, 38),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: widget.onTap,
        child: const Text("Start", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
