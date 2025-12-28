// LandingPage Class
import 'package:first_flutter_application/models/pharmacy.dart';
import 'package:first_flutter_application/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../models/pharmacy_screen.dart';
import '../widgets/border.dart';
import '../widgets/custom_text_filed.dart';
import '../widgets/pharmacyDetailsScreen.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final List<PharmacyCard> pharmacies = [
    PharmacyCard(
      name: "صيدلية الكنز",
      address: "غزة - حي الرمال",
      workHours: "8:00 ص - 22 ساعة",
      phoneNO: "+970 282 4321",
    ),
    PharmacyCard(
      name: "صيدلية القصواء",
      address: "غزة - الرمال",
      workHours: "9:00 ص - 20 ساعة",
      phoneNO: "+970 282 1234",
    ),
    PharmacyCard(
      name: "صيدلية مسلم",
      address: "غزة - السرايا",
      workHours: "9:00 ص - 12 ساعة",
      phoneNO: "+970 282 5678",
    ),
    PharmacyCard(
      name: "صيدلية أبو الريش",
      address: "النصيرات",
      workHours: "8:00 ص - 24 ساعة",
      phoneNO: "+970 282 2345",
    ),
  ];

  List<PharmacyScreen> pharmaciesDetails = [
    PharmacyScreen(
      address: 'غزة – حي الرمال – شارع الوحدة – بجوار بنك فلسطين',
      phoneNO: '+970 599 123 456',
      services: 'خدمات دوائية - استشارات - عناية بالبشرة - وصفات طبية',
      whatsAppNo: '+970 599 123 456',
      aboutPharmacy:
          'صيدلية الكنز تقدم خدمات دوائية متكاملة وصرف وصفات طبية، بالإضافة إلى قسم مُخصص لمنتجات العناية بالبشرة والأطفال. نحرص على توفير أدوية مضمونة وأسعار مناسبة مع إمكانية التواصل للاستفسار طوال ساعات العمل',
      name: 'صيدلية الكنز',
      workHours: '8:00 ص – 10:00 م',
    ),
    PharmacyScreen(
      address: 'غزة - الرمال - شارع الوحدة - مقابل مخبز الشنطي',
      phoneNO: '+970 8 282 0881',
      services: 'خدمات دوائية - استشارات - وصفات طبية',
      whatsAppNo: '+970 599 123 456',
      aboutPharmacy:
          'صيدلية القصواء تقدم خدمات دوائية متكاملة وصرف وصفات طبية، بالإضافة إلى قسم مُخصص لمنتجات العناية بالبشرة والأطفال. نحرص على توفير أدوية مضمونة وأسعار مناسبة مع إمكانية التواصل للاستفسار طوال ساعات العمل.',
      name: 'صيدلية القصواء',
      workHours: '8:00 ص – 10:00 م',
    ),
    PharmacyScreen(
      address: 'غزة - مفترق السرايا - شارع عمر المختار',
      phoneNO: '+970 566 660 005',
      services: 'خدمات دوائية - استشارات - عناية بالبشرة - وصفات طبية',
      whatsAppNo: '+970 566 660 005',
      aboutPharmacy:
          'صيدلية مسلم تقدم خدمات دوائية متكاملة وصرف وصفات طبية، بالإضافة إلى قسم مُخصص لمنتجات العناية بالبشرة والأطفال. نحرص على توفير أدوية مضمونة وأسعار مناسبة مع إمكانية التواصل للاستفسار طوال ساعات العمل.',
      name: 'صيدلية مسلم',
      workHours: '9:00 ص – 9:00 م',
    ),
    PharmacyScreen(
      address: 'قطاع غزة -النصيرات -دوار ابو الريش',
      phoneNO: '+970 598 981 071',
      services: 'خدمات دوائية - استشارات - عناية بالبشرة - وصفات طبية',
      whatsAppNo: '+970 598 981 071',
      aboutPharmacy:
          'صيدلية ابو الريش تقدم خدمات دوائية متكاملة وصرف وصفات طبية، بالإضافة إلى قسم مُخصص لمنتجات العناية بالبشرة والأطفال. نحرص على توفير أدوية مضمونة وأسعار مناسبة مع إمكانية التواصل للاستفسار طوال ساعات العمل.',
      name: 'صيدلية ابو الريش',
      workHours: 'مفتوح 24 ساعة',
    ),
  ];

  final List<Map<String, dynamic>> medicines = [
    {
      'name': 'بنادول اكسترا',
      'strength': '500mg',
      'pharmacies': ['صيدلية الكنز', 'صيدلية القصواء'],
    },
    {
      'name': 'فولتارين',
      'strength': '50mg',
      'pharmacies': ['صيدلية مسلم'],
    },
  ];

  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const primaryGoldColor = AppColors.gold;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Dawa2y',
              style: TextStyle(
                color: primaryGoldColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed('/login'),
              style: TextButton.styleFrom(
                backgroundColor: primaryGoldColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'تسجيل الدخول',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Column(
              children: [
                const Text(
                  'ابحث عن دوائك في أقرب صيدلية',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(height: 8),
                Text(
                  'نساعدك في إيجاد الدواء الذي تحتاجه بسرعة وسهولة',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              shadowColor: Color.fromARGB(215, 163, 160, 160),
              elevation: 3,
              child: Stack(
                children: [
                  CustomTextField(
                    hint: 'أدخل اسم الدواء ...',
                    border: TextFieldBorder.input(),
                    controller: _searchController,
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      child: TextButton(
                        onPressed: _onSearch,
                        style: TextButton.styleFrom(
                          backgroundColor: primaryGoldColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 0,
                          ),
                        ),
                        child: const Text(
                          'ابحث',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Card(
                    shape: TextFieldBorder.input(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 24,
                      ),
                      child: const Text(
                        ' +5000 دواء متوفر',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Card(
                    shape: TextFieldBorder.input(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 24,
                      ),
                      child: const Text(
                        ' +50 صيدلية متاحة',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Card(
                    shape: TextFieldBorder.input(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 24,
                      ),
                      child: const Text(
                        ' +200 طلب يومي',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Column(
              children: [
                const Text(
                  ' الصيدليات المتاحة',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    wordSpacing: 2,
                    letterSpacing: .5,
                  ),
                ),

                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: pharmacies.length,
                  itemBuilder: (context, index) {
                    final pharmacyCard = pharmacies[index];
                    final pharmacyDetails = pharmaciesDetails[index];

                    return PharmacyCard(
                      name: pharmacyCard.name,
                      address: pharmacyCard.address,
                      workHours: pharmacyCard.workHours,
                      phoneNO: pharmacyCard.phoneNO,
                      available: true,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                PharmacyDetails(pharmacy: pharmacyDetails),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  void _onSearch() {
    final text = _searchController.text.trim();
    bool found = medicines.any((medicine) => medicine['name'] == text);
    if (text.isEmpty) return;

    if (found) {
      _showAvailable();
    } else {
      _showNotAvailable();
    }
    _searchController.clear();
  }

  void _showAvailable() {
    String searchName = _searchController.text.trim();
    final medicine = medicines.firstWhere(
      (m) => m['name'] == searchName,
      orElse: () => {'name': 'غير موجود', 'strength': ''},
    );

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 60),
            const SizedBox(height: 16),
            const Text(
              'متوفر',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '${medicine['name']} - ${medicine['strength']}',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _showNotAvailable() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            Icon(Icons.cancel, color: Colors.red, size: 60),
            SizedBox(height: 16),
            Text(
              'غير متوفر',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('لم يتم العثور على هذا الدواء', textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
