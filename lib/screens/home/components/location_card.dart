import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            SizedBox(
              height: 60,
              width: 100,
              child: Image.asset(
                fit: BoxFit.cover,
                'assets/map.png',
                width: 100,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Location",
                  style: GoogleFonts.poppins(
                    color: Colors.blue.shade700,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // const SizedBox(height: 5),
                Text(
                  "United States, New York",
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}