import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../model/tourist_places.dart';

class TouristPlaces extends StatelessWidget {
  const TouristPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            height: 60,
            width: 130,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade200, width: 0.4),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Container(
                  height: 22,
                  width: 22,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(touristPlaces[index].image),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(touristPlaces[index].name,style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),),
              ],
            ),
          );
        },
        itemCount: touristPlaces.length,
        separatorBuilder: (BuildContext context, int index) {
          return Padding(padding: EdgeInsets.all(5),);
        },
      ),
    );
  }
}
