import 'package:flutter/material.dart';
import 'pediatrician_detail_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class PediatricianListScreen extends StatefulWidget {
  const PediatricianListScreen({super.key});

  @override
  _PediatricianListScreenState createState() => _PediatricianListScreenState();
}

class _PediatricianListScreenState extends State<PediatricianListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEFEFE),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50), // Custom height for logo
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
            ],
          ),
        ),
      ),

      // Main Body with Tabs
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Pediatricians',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Color(0xFFF5F5F5),
              ),
            ),
          ),

          // Tab Bar for Suggested and Favorites
          TabBar(
            controller: _tabController,
            labelColor: Color(0xFF5A87FE),
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color(0xFF5A87FE),
            tabs: [Tab(text: 'Suggested'), Tab(text: 'Favorites')],
          ),

          // Tab Views
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Suggested Tab
                ListView.builder(
                  itemCount: 3, // Number of pediatricians to display
                  itemBuilder: (context, index) {
                    return _buildPediatricianCard(
                      context,
                      'Prof. Ruwan Danishka',
                      'Consultant Pediatrician',
                      'assets/images/doctor.jpg',
                    );
                  },
                ),

                // Favorites Tab (Placeholder for now)
                Center(child: Text('No Favorites Yet')),
              ],
            ),
          ),
        ],
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

  // Pediatrician Card Widget
  Widget _buildPediatricianCard(
    BuildContext context,
    String name,
    String title,
    String imagePath,
  ) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Image
            CircleAvatar(backgroundImage: AssetImage(imagePath), radius: 35),
            SizedBox(width: 15),

            // Name, Title, and Rating
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Text(
                    title,
                    style: TextStyle(color: Colors.grey, fontFamily: 'Poppins'),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: List.generate(
                      5,
                      (index) =>
                          Icon(Icons.star, color: Colors.amber, size: 16),
                    ),
                  ),
                ],
              ),
            ),

            // Action Buttons
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PediatricianDetailScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Reserve'),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.chat_bubble_outline),
                      onPressed: () async {
                        final Uri smsUri = Uri(
                          scheme: 'sms',
                          path: '1234567890',
                        );
                        if (await canLaunchUrl(smsUri)) {
                          await launchUrl(
                            smsUri,
                            mode:
                                LaunchMode
                                    .externalApplication, // Use external application
                          );
                        } else {
                          print('Could not launch SMS app');
                        }
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.phone),
                      onPressed: () async {
                        final Uri telUri = Uri(
                          scheme: 'tel',
                          path: '1234567890',
                        );
                        if (await canLaunchUrl(telUri)) {
                          await launchUrl(
                            telUri,
                            mode:
                                LaunchMode
                                    .externalApplication, // Use external application
                          );
                        } else {
                          print('Could not launch Phone app');
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
