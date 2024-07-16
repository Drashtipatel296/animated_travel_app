import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'components/custom_iconbuttons.dart';
import 'components/location_card.dart';
import 'components/nearby_places.dart';
import 'components/recommended_places.dart';
import 'components/tourist_places.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  bool isDarkMode = false;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 18),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/bg.jpeg'),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning",
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Text(
              "Drashti Patel",
              style: GoogleFonts.poppins(color: Colors.grey, fontSize: 15),
            ),
          ],
        ),
        actions: const [
          CustomIconButton(
            icon: Icon(Ionicons.search_outline),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 14),
            child: CustomIconButton(
              icon: Icon(Ionicons.notifications_outline),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
          child: Column(
            children: [
              const LocationCard(),
              const SizedBox(height: 10),
              FadeTransition(
                opacity: _fadeAnimation,
                child: const TouristPlaces(),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    " Recommendation",
                    style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "View All",
                      style: GoogleFonts.poppins(color: Colors.blue.shade700),
                    ),
                  ),
                ],
              ),
              SlideTransition(
                position: _slideAnimation,
                child: const RecommendedPlaces(),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    " Nearby From You",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "View All",
                      style: GoogleFonts.poppins(color: Colors.blue.shade700),
                    ),
                  ),
                ],
              ),
              ScaleTransition(
                scale: _scaleAnimation,
                child: const NearbyPlaces(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.grey.shade400,
        height: 65,
        items: const [
          Icon(Icons.home, size: 25),
          Icon(Icons.search, size: 25),
          Icon(Icons.favorite, size: 25),
          Icon(Icons.settings, size: 25),
          Icon(Icons.light_mode,size: 25),
        ],
        animationCurve: Curves.fastOutSlowIn,
        maxWidth: double.infinity,
      ),
    );
  }
}
