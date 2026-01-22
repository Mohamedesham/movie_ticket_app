import 'package:flutter/material.dart';
import 'package:movie_ticket/core/constants/colors.dart';
import 'package:movie_ticket/core/constants/fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'Profile',
          style: AppTextStyle.semibold20.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        backgroundColor: AppColors.surface,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar + Name + Subtitle
              CircleAvatar(
                radius: 50,
                backgroundColor: AppColors.primary,
                child: const Icon(Icons.person, size: 50, color: Colors.white),
              ),
              SizedBox(height: 16),
              Text(
                'Miles Morales',
                style: AppTextStyle.bold18.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Film Hunter',
                style: AppTextStyle.regular12.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 32),

              // Account section
              _buildOption(
                icon: Icons.person,
                iconColor: Colors.purple,
                title: 'Personal Data',
                onTap: () {},
              ),
              _buildOption(
                icon: Icons.email,
                iconColor: Colors.lightBlue,
                title: 'Email & Payment',
                onTap: () {},
              ),
              _buildOption(
                icon: Icons.delete,
                iconColor: Colors.red,
                title: 'Deactivate Account',
                onTap: () {},
              ),

              const SizedBox(height: 24),

              // Privacy & Policy section
              _buildOption(
                icon: Icons.notifications,
                iconColor: Colors.orange,
                title: 'Notification',
                onTap: () {},
              ),
              _buildOption(
                icon: Icons.confirmation_num,
                iconColor: Colors.green,
                title: 'Your Ticket',
                onTap: () {},
              ),

              _buildOption(
                icon: Icons.logout,
                iconColor: Colors.red,
                title: 'Logout',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption({
    required IconData icon,
    required Color iconColor,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(title, style: AppTextStyle.regular12),
        trailing: const Icon(
          Icons.chevron_right,
          color: AppColors.textSecondary,
        ),
        onTap: onTap,
      ),
    );
  }
}
