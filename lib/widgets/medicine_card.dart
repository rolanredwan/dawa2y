// import 'package:flutter/material.dart';
// import '../models/medicine.dart';
//
// class MedicineCard extends StatelessWidget {
//   final Medicine medicine;
//   final VoidCallback? onTap;
//
//   const MedicineCard({super.key, required this.medicine, this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     final color = Theme.of(context).primaryColor;
//     return Card(
//       color: Colors.white,
//       margin: EdgeInsets.symmetric(vertical: 12),
//       child: Column(
//         children: [
//           SizedBox(height: 8),
//           ListTile(
//             onTap: onTap,
//             title: Text(
//               medicine.name,
//               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             subtitle: Row(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 12,
//                     vertical: 6,
//                   ),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFEADDC6),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Text(
//                     medicine.category,
//                     style: TextStyle(color: color, fontWeight: FontWeight.w900),
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Text(
//                   'المخزون ${medicine.stock}',
//                   style: TextStyle(fontSize: 14, color: Colors.grey[600]),
//                 ),
//               ],
//             ),
//             trailing: Text(
//               '${medicine.price.toStringAsFixed(0)} ر.س',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: color,
//               ),
//             ),
//           ),
//           SizedBox(height: 8),
//         ],
//       ),
//     );
//   }
// }
