import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entity/profile_entity.dart';
import '../viewmodel/profile_view_model.dart';

class Profile extends ConsumerStatefulWidget {
  const Profile({super.key});

  @override
  ConsumerState<Profile> createState() => _ProfileState();
}

class _ProfileState extends ConsumerState<Profile> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(profileViewModelProvider.notifier).fetchProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileViewModelProvider);

    return Scaffold(
      body: SafeArea(
        child: profileState.isLoading
            ? const Center(child: CircularProgressIndicator())
            : profileState.error != null
                ? Center(child: Text('Error: ${profileState.error}'))
                : profileState.profile == null
                    ? const Center(child: Text('No profile data available'))
                    : _buildProfileContent(profileState.profile!),
      ),
    );
  }

  Widget _buildProfileContent(ProfileEntity profile) {
    return Column(
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
                    backgroundImage: profile.profileImage != null
                        ? NetworkImage(profile.profileImage!)
                        : null,
                    child: profile.profileImage == null
                        ? Icon(Icons.person, size: 40, color: Colors.grey[600])
                        : null,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  profile.username,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
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
              _buildInfoTile(Icons.email, 'Email', profile.email),
              _buildDivider(),
              _buildInfoTile(Icons.phone, 'Mobile', profile.phone),
              _buildDivider(),
              _buildInfoTile(
                  Icons.location_on, 'Address', profile.location ?? ""),
              _buildDivider(),
            ],
          ),
        ),
      ],
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
