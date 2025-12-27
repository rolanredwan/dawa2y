import 'package:first_flutter_application/models/pharmacy_screen.dart';
import 'package:first_flutter_application/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PharmacyDetails extends StatelessWidget {
  final PharmacyScreen pharmacy;

  // final VoidCallback onPressed;

  const PharmacyDetails({
    super.key,
    required this.pharmacy,
    // required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Dawa2y",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 40,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.bottomRight,
                      colors: [AppColors.gold, Color(0xECF3CE71)],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        pharmacy.name,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        pharmacy.services,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                _buildInfoCardNoButton(
                  title: "ساعات العمل",
                  value: pharmacy.workHours,
                ),
                const SizedBox(height: 24),
                _buildInfoCard(
                  value: pharmacy.phoneNO,
                  title: "الهاتف",
                  buttonText: "اتصل الآن",
                  icon: Icons.phone,
                  onPressed: () {
                    //async
                    String phoneNumber = pharmacy.phoneNO.replaceAll(
                      RegExp(r'[^0-9]'),
                      '',
                    );
                    String url = "tel:$phoneNumber";
                    launchUrlString(
                      url,
                      mode: LaunchMode.externalApplication,
                    );
                    //
                    // try {
                    //   await launchUrlString(
                    //     url,
                    //     mode: LaunchMode.externalApplication,
                    //   );
                    // } catch (e) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(content: Text('لا يمكن فتح تطبيق الاتصال')),
                    //   );
                    // }
                  },
                ),
                const SizedBox(height: 24),
                _buildInfoCard(
                  value: pharmacy.whatsAppNo,
                  title: "واتساب",
                  buttonText: "تواصل واتساب",
                  icon: Icons.chat_bubble,
                  onPressed: () {
                    //async
                    String phoneNumber = pharmacy.whatsAppNo.replaceAll(
                      RegExp(r'[^0-9]'),
                      '',
                    );
                    String url = "https://wa.me/$phoneNumber";
                    launchUrlString(
                      url,
                      mode: LaunchMode.externalApplication,
                    );
                    // try {
                    //   await launchUrlString(
                    //     url,
                    //     mode: LaunchMode.externalApplication,
                    //   );
                    // } catch (e) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(content: Text('لا يمكن فتح واتساب')),
                    //   );
                    // }
                  },
                ),
                const SizedBox(height: 30),
                _buildAboutAndTitle(
                  title: Text(
                    'عن الصيدلية',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: AppColors.gold,
                    ),
                  ),
                  value: pharmacy.aboutPharmacy,
                ),
                const SizedBox(height: 30),
                _buildAboutAndTitle(
                  title: Text(
                    "العنوان",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: AppColors.gold,
                    ),
                  ),
                  value: pharmacy.address,
                  icon: Icons.location_on,
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String value,
    required String buttonText,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.gold,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(width: 8),
              Icon(icon, color: AppColors.gold),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              color: Colors.grey[700],
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: onPressed,
              label: Text(
                buttonText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                backgroundColor: const Color(0xFFC9A227),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCardNoButton({
    required String title,
    required String value,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.gold,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.access_time_filled, color: AppColors.gold),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              color: Colors.grey[700],
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutAndTitle({
    required Text title,
    required String value,
    IconData? icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              title,
              if (icon != null) ...[
                Icon(icon, color: AppColors.gold),
                const SizedBox(width: 8),
              ],
            ],
          ),
          Container(height: 2, width: double.infinity, color: AppColors.gold),
          SizedBox(height: 16),
          Text(
            value,
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
