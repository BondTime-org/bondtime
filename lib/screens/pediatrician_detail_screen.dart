import 'package:flutter/material.dart'; // Removed the duplicate import

// Changed from StatelessWidget to StatefulWidget
class PediatricianDetailScreen extends StatefulWidget {
  const PediatricianDetailScreen({super.key});

  // Added StatefulWidget State
  @override
  State<PediatricianDetailScreen> createState() =>
      _PediatricianDetailScreenState();
}

// Created State Class
class _PediatricianDetailScreenState extends State<PediatricianDetailScreen> {
  // Added State Variable to Track Favorite Status
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEFEFE), // Off-White Background
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100), // Custom AppBar Height
        child: Container(
          color: Colors.white,
          child: Stack(
            children: [
              // BondTime Logo at Top-Left
              Positioned(
                top: 10,
                left: 20,
                child: Image.asset(
                  'assets/icons/bondtime-logo.png',
                  width: 100,
                  height: 30,
                ),
              ),

              // Arrow-Back Button Below the Logo
              Positioned(
                top: 50,
                left: 10,
                child: IconButton(
                  icon: Image.asset(
                    'assets/icons/arrow-back.png',
                    width: 24,
                    height: 24,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
      ),

      // Main Body
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Profile Picture Section
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/doctor.jpg'),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              child: Stack(
                children: [
                  // Online Status Badge
                  Positioned(
                    left: 20,
                    bottom: 40,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(25),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.circle, color: Colors.green, size: 10),
                          SizedBox(width: 5),
                          Text(
                            'Online',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Rating Badge
                  Positioned(
                    left: 100,
                    bottom: 40,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(25),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 14),
                          SizedBox(width: 5),
                          Text(
                            '5.0',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Updated Heart (Favorite) Button
                  Positioned(
                    right: 20,
                    bottom: 40,
                    child: IconButton(
                      icon: Icon(
                        isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border, // Toggle Icon
                        color:
                            isFavorite
                                ? Colors.red
                                : Colors.grey, // Toggle Color
                      ),
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite; // Toggle State
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Overlapping Container
            Transform.translate(
              offset: Offset(0, -38), // Cleaner Overlap
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Color(0xFFFEFEFE), // Consistent Background Color
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x14000000),
                      spreadRadius: 0,
                      blurRadius: 20,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Name and Title
                    Text(
                      'Prof. Ruwan Danishka',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF212529),
                        fontFamily: 'Poppins',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Consultant Pediatrician - General Hospital',
                        style: TextStyle(
                          color: Color(0xFF5A87FE),
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Info Cards
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          infoCard(
                            '200+',
                            'Online Patients',
                            'assets/icons/online-patients.png',
                          ),
                          infoCard(
                            '30+',
                            'Home Visits',
                            'assets/icons/home-visits.png',
                          ),
                          infoCard(
                            '2+',
                            'Years Experience',
                            'assets/icons/years-experience.png',
                          ),
                          infoCard(
                            '12+',
                            'Locations to meet',
                            'assets/icons/locations-to-meat.png',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar (Fixed at the Bottom)
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3, // Highlight the current tab
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF5A87FE),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.child_friendly),
            label: 'Bondy',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility_new),
            label: 'Activities',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: 'Pediatricians',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  // Info Card Widget (Responsive)
  Widget infoCard(String title, String subtitle, String iconPath) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPath, width: 30, height: 30),
            SizedBox(height: 10),
            Text(title),
            Text(subtitle),
          ],
        ),
      ),
    );
  }
}
