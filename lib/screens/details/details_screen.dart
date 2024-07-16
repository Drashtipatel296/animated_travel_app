import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class TouristDetailsPage extends StatefulWidget {
  const TouristDetailsPage({super.key, required this.image});

  final String image;

  @override
  _TouristDetailsPageState createState() => _TouristDetailsPageState();
}

class _TouristDetailsPageState extends State<TouristDetailsPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _bottomSlideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
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

    _bottomSlideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
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
    final size = MediaQuery.of(context).size;
    return Hero(
      tag: 'next',
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeTransition(
              opacity: _fadeAnimation,
              child: SizedBox(
                height: size.height * 0.48,
                width: double.maxFinite,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(25),
                        ),
                        image: DecorationImage(
                          image: AssetImage(widget.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: const BorderRadius.horizontal(
                            right: Radius.circular(15),
                          ),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          iconSize: 25,
                          icon: const Icon(Ionicons.chevron_back),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sea of Peace",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Portic Team 8km",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: IconButton(
                      onPressed: () {},
                      iconSize: 22,
                      icon: const Icon(Ionicons.chatbubble_ellipses_outline),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "4.6",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      Icon(
                        Ionicons.star,
                        color: Colors.yellow[800],
                        size: 15,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SlideTransition(
              position: _slideAnimation,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on_sharp,
                      color: Colors.blue.shade700,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "French, Polynesia",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: SlideTransition(
                position: _slideAnimation,
                child: Text(
                  textAlign: TextAlign.start,
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Text(
                  'More images',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height: 85,
                      width: 85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/places/img1.jpg'),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      height: 85,
                      width: 85,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/places/img2.jpeg'),
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      height: 85,
                      width: 85,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/places/img3.jpg'),
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      height: 85,
                      width: 85,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/places/img4.png'),
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: SlideTransition(
          position: _bottomSlideAnimation,
          child: Container(
            height: 70,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\$25",
                        style: GoogleFonts.poppins(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "/person",
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade700,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Book now',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
