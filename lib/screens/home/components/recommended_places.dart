import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

import '../../../model/recommended_places.dart';

class RecommendedPlaces extends StatelessWidget {
  const RecommendedPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return SizedBox(
              width: 220,
              child: Card(
                elevation: 0.4,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          recommendedPlaces[index].image,
                          width: double.maxFinite,
                          fit: BoxFit.cover,
                          height: 150,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "St Regis Bora Bora",
                            style: GoogleFonts.poppins(fontSize: 14,
                              fontWeight: FontWeight.w500,),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.star,
                            color: Colors.yellow.shade700,
                            size: 14,
                          ),
                          Text(
                            "4.4",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Ionicons.location,
                            color: Colors.blue.shade700,
                            size: 14,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "French Polynesia",
                            style: GoogleFonts.poppins(
                              fontSize: 11,
                              color: Colors.blue.shade700
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const Padding(
            padding: EdgeInsets.only(right: 10),
          ),
          itemCount: recommendedPlaces.length),
    );
  }
}