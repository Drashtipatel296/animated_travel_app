import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../model/nearby_places.dart';
import '../../details/details_screen.dart';
import 'distance.dart';

class NearbyPlaces extends StatelessWidget {
  const NearbyPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(nearbyPlaces.length, (index) {
        return SizedBox(
          height: 135,
          width: double.maxFinite,
          child: Card(
            elevation: 0.4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TouristDetailsPage(
                        image: nearbyPlaces[index].image,
                      ),
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Hero(
                  tag: 'next',
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          nearbyPlaces[index].image,
                          height: double.maxFinite,
                          width: 130,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sea of Peace",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text("Portic Team",style: GoogleFonts.poppins(color: Colors.grey.shade700),),
                            const SizedBox(height: 10),
                            const Distance(),
                            const Spacer(),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow.shade700,
                                  size: 14,
                                ),
                                const Text(
                                  "4.5",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                const Spacer(),
                                RichText(
                                  text: TextSpan(
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      text: "\$22",
                                      children: [
                                        TextSpan(
                                            style: GoogleFonts.poppins(fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black54,),
                                            text: " / Person")
                                      ],),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}