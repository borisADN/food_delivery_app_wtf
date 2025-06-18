import 'package:application/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Baloo'),
      home: OnboardingScreen(),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(title: const Text('Repère Flutter avec Positioned')),
//         body: const PositionedDemo(),
//       ),
//     );
//   }
// }

// class PositionedDemo extends StatelessWidget {
//   const PositionedDemo({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(color: Colors.grey[200]),

//         // Origine
//         Positioned(
//           top: 0,
//           left: 0,
//           child: Container(
//             color: Colors.red,
//             width: 60,
//             height: 60,
//             child: const Center(
//               child: Text("(0,0)", style: TextStyle(fontSize: 12)),
//             ),
//           ),
//         ),

//         // En haut à droite
//         Positioned(
//           top: 0,
//           right: 0,
//           child: Container(
//             color: Colors.blue,
//             width: 60,
//             height: 60,
//             child: const Center(
//               child: Text(
//                 "top:0\nright:0",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 12),
//               ),
//             ),
//           ),
//         ),

//         // En bas à gauche
//         Positioned(
//           bottom: 0,
//           left: 0,
//           child: Container(
//             color: Colors.green,
//             width: 60,
//             height: 60,
//             child: const Center(
//               child: Text(
//                 "bottom:0\nleft:0",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 12),
//               ),
//             ),
//           ),
//         ),

//         // En bas à droite
//         Positioned(
//           bottom: 0,
//           right: 0,
//           child: Container(
//             color: Colors.orange,
//             width: 60,
//             height: 60,
//             child: const Center(
//               child: Text(
//                 "bottom:0\nright:0",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 12),
//               ),
//             ),
//           ),
//         ),

//         // Position personnalisée
//         Positioned(
//           top: 230,
//           right: -20,
//           left: 0,
//           child: Container(
//             color: Colors.purple,
//             width: 100,
//             height: 100,
//             child: const Center(
//               child: Text(
//                 "top:230\nleft:100",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 14, color: Colors.white),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
