import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:ui';

class HospitalDetailPage extends StatelessWidget {
  final String hospitalName;
  final String distance;
  final String doctor;
  final String risk;

  const HospitalDetailPage({
    super.key,
    required this.hospitalName,
    required this.distance,
    required this.doctor,
    required this.risk,
  });

  Future<void> openMap() async {
    final Uri url = Uri.parse(
      "https://www.google.com/maps/search/?api=1&query=31.5143,75.9115",
    );
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

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
    final riskColor = getRiskColor();

    return Scaffold(
      backgroundColor: const Color(0xffEEF2F8),
      body: Column(
        children: [

          /// 🔵 TOP GRADIENT HEADER (LIKE YOUR UI)
          Container(
            height: 280,
            width: double.infinity,
            padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 83, 110, 151),
                  Color.fromARGB(255, 136, 143, 153),
                ],
              ),
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(45)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios,
                          color: Colors.white),
                    ),
                    const Text(
                      "Hospital Details",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 14),

                /// 🟢 AI INFO CARD (MATCH SCREENSHOT)
                ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: BackdropFilter(
                    filter:
                        ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xffC6EBD1)
                            .withOpacity(0.9),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              color: const Color(0xffA8DEBC),
                              borderRadius:
                                  BorderRadius.circular(16),
                            ),
                            child: const Icon(
                              Icons.health_and_safety,
                              color: Color(0xff2E7D32),
                              size: 28,
                            ),
                          ),
                          const SizedBox(width: 14),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
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

          /// ⚪ DETAILS CARD SECTION
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(18),
              children: [

                /// 🏥 MAIN HOSPITAL CARD
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Color(0xffE3F2FD),
                            child: Icon(Icons.local_hospital,
                                color: Color(0xff536E97)),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              hospitalName,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: riskColor.withOpacity(0.15),
                              borderRadius:
                                  BorderRadius.circular(20),
                            ),
                            child: Text(
                              risk,
                              style: TextStyle(
                                color: riskColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),

                      const SizedBox(height: 14),

                      Row(
                        children: [
                          const Icon(Icons.location_on,
                              size: 18, color: Colors.grey),
                          const SizedBox(width: 6),
                          Text(distance),
                        ],
                      ),

                      const SizedBox(height: 6),

                      Row(
                        children: [
                          const Icon(Icons.person,
                              size: 18, color: Colors.grey),
                          const SizedBox(width: 6),
                          Text(doctor),
                        ],
                      ),

                      const SizedBox(height: 18),

                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 115, 149, 201),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(16),
                            ),
                          ),
                          onPressed: openMap,
                          icon: const Icon(Icons.map),
                          label:
                              const Text("Open in Google Maps"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'dart:ui';

// class HospitalDetailPage extends StatelessWidget {
//   final String hospitalName;
//   final String distance;
//   final String doctor;
//   final String risk;

//   const HospitalDetailPage({
//     super.key,
//     required this.hospitalName,
//     required this.distance,
//     required this.doctor,
//     required this.risk,
//   });

//   Color getRiskColor() {
//     switch (risk) {
//       case "LOW":
//         return Colors.green;
//       case "MEDIUM":
//         return Colors.orange;
//       case "CRITICAL":
//         return Colors.red;
//       default:
//         return Colors.blueGrey;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final riskColor = getRiskColor();

//     /// 👇 YOUR HOSPITAL LOCATION
//     const LatLng hospitalLocation = LatLng(31.5143, 75.9115);

//     return Scaffold(
//       backgroundColor: const Color(0xffEEF2F8),
//       body: Column(
//         children: [

//           /// 🔵 HEADER (UNCHANGED STYLE)
//           Container(
//             height: 180,
//             width: double.infinity,
//             padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Color.fromARGB(255, 83, 110, 151),
//                   Color.fromARGB(255, 136, 143, 153),
//                 ],
//               ),
//               borderRadius:
//                   BorderRadius.vertical(bottom: Radius.circular(45)),
//             ),
//             child: Row(
//               children: [
//                 IconButton(
//                   onPressed: () => Navigator.pop(context),
//                   icon: const Icon(Icons.arrow_back_ios,
//                       color: Colors.white),
//                 ),
//                 const Text(
//                   "Hospital Details",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           /// ⭐ DETAILS CARD
//           Padding(
//             padding: const EdgeInsets.all(18),
//             child: Container(
//               padding: const EdgeInsets.all(18),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(22),
//                 boxShadow: const [
//                   BoxShadow(color: Colors.black12, blurRadius: 10),
//                 ],
//               ),
//               child: Column(
//                 children: [

//                   Row(
//                     children: [
//                       const CircleAvatar(
//                         backgroundColor: Color(0xffE3F2FD),
//                         child: Icon(Icons.local_hospital,
//                             color: Color(0xff536E97)),
//                       ),
//                       const SizedBox(width: 12),
//                       Expanded(
//                         child: Text(
//                           hospitalName,
//                           style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 12, vertical: 6),
//                         decoration: BoxDecoration(
//                           color: riskColor.withOpacity(0.15),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Text(
//                           risk,
//                           style: TextStyle(
//                             color: riskColor,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),

//                   const SizedBox(height: 10),

//                   Row(
//                     children: [
//                       const Icon(Icons.location_on,
//                           size: 18, color: Colors.grey),
//                       const SizedBox(width: 6),
//                       Text(distance),
//                     ],
//                   ),

//                   const SizedBox(height: 6),

//                   Row(
//                     children: [
//                       const Icon(Icons.person,
//                           size: 18, color: Colors.grey),
//                       const SizedBox(width: 6),
//                       Text(doctor),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           /// 🗺️ HALF SCREEN LIVE GOOGLE MAP
//           Expanded(
//             child: ClipRRect(
//               borderRadius:
//                   const BorderRadius.vertical(top: Radius.circular(30)),
//               child: GoogleMap(
//                 initialCameraPosition: const CameraPosition(
//                   target: hospitalLocation,
//                   zoom: 14,
//                 ),
//                 markers: {
//                   const Marker(
//                     markerId: MarkerId("hospital"),
//                     position: hospitalLocation,
//                   ),
//                 },
//                 zoomControlsEnabled: false,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }