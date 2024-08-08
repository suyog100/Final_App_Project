import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  final String? userProfileImagePath = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.menu, color: Colors.black54),
                        Icon(Icons.search, color: Colors.black54),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.red, width: 2),
                      ),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: userProfileImagePath != null
                            ? AssetImage(userProfileImagePath!)
                            : null,
                        child: userProfileImagePath == null
                            ? Icon(Icons.person, size: 40, color: Colors.grey[600])
                            : null,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Sourav Suman',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'App Developer',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _buildInfoTile(Icons.email, 'Email', 'james0122@gmail.com'),
                  _buildDivider(),
                  _buildInfoTile(Icons.phone, 'Mobile', '1234567893'),
                  _buildDivider(),
                  _buildInfoTile(Icons.location_on, 'Address', 'Siliguri'),
                  _buildDivider(),
                  _buildInfoTile(Icons.work, 'Work', 'www.facebook.com/james0122'),
                  _buildDivider(),
                  _buildInfoTile(Icons.facebook, 'Facebook', 'www.facebook.com/james0122'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.grey, size: 24),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  content,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 16),
      child: Divider(
        color: Colors.grey[300],
        thickness: 1,
      ),
    );
  }
}