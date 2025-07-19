import 'package:flutter/material.dart';
import 'package:turistik/core/constants/colors.dart';
import 'package:turistik/data/dummy_data.dart';
import '../../data/models/profile_model.dart';

class ProfileScreen extends StatefulWidget {
  final ProfileModel userProfile;

  const ProfileScreen({super.key, required this.userProfile});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Perfil",
          style: TextStyle(
            color: AppColors.accent,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,
        backgroundColor: AppColors.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                userProfile.profilePictureUrl,
              ), // Placeholder image
            ),
            const SizedBox(height: 16),
            Text(
              widget.userProfile.name,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              widget.userProfile.email,
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Configuración"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navegar a Configuración
              },
            ),
            ListTile(
              leading: const Icon(Icons.help_outline),
              title: const Text("Centro de ayuda"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navegar a Ayuda
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Cerrar sesión"),
              onTap: () {
                // Lógica para cerrar sesión
              },
            ),
          ],
        ),
      ),
    );
  }
}
