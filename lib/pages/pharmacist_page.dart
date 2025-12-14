import 'package:first_flutter_application/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/app_colors.dart';
import '../utils/validators.dart';
import '../widgets/border.dart';
import '../widgets/custom_text_filed.dart';
import '../widgets/primary_button.dart';
import 'admin_page.dart';

class PharmacistPage extends StatelessWidget {
  const PharmacistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        title: const Text(
          'إدارة الصيدلية',
          style: TextStyle(
            // color: primaryGoldColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: SingleChildScrollView(
            child: Form(
              // key: _formKey,
              child: Column(
                children: [
                  Align(
                    alignment: AlignmentGeometry.centerRight,
                    child: Row(
                      children: [
                        Icon(Icons.push_pin_outlined, color: AppColors.gold),
                        const Text(
                          ' بيانات الصيدلية',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 24,
                            wordSpacing: 2,
                            color: AppColors.gold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Column(
                    children: [
                      _pharmacistData(
                        title: 'اسم الصيدلية',
                        hint: 'صيدلية الكنز',
                      ),
                      _pharmacistData(
                        title: 'اسم الصيدلاني',
                        hint: 'أحمد محمد',
                      ),
                      _pharmacistData(
                        title: 'رقم الصيدلية',
                        hint: '059 000 0000',
                      ),
                      _pharmacistData(title: 'ساعات العمل', hint: ' 9AM - 9PM'),
                      PrimaryButton(
                        icon: Icons.save,
                        label: 'حفظ البيانات',
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Container(height: 2, color: Colors.grey[400]),
                  SizedBox(height: 40),
                  Column(
                    children: [
                      Align(
                        alignment: AlignmentGeometry.centerRight,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "images/capsule-pills.svg",
                              width: 28,
                              height: 28,
                              colorFilter: const ColorFilter.mode(
                                AppColors.gold,
                                BlendMode.srcIn,
                              ),
                              // color: AppColors.gold,
                            ),
                            SizedBox(width: 4),
                            const Text(
                              'إضافة دواء جديد',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 24,
                                wordSpacing: 2,
                                color: AppColors.gold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Column(
                        children: [
                          _pharmacistData(
                            title: 'الاسم التجاري',
                            hint: 'باراسيتامول',
                          ),
                          _pharmacistData(
                            title: 'الاسم العلمي',
                            hint: 'أسيتامينوفين',
                          ),
                          _pharmacistData(title: 'الكمية', hint: '200'),
                          _pharmacistData(title: 'التصنيف', hint: 'مسكنات'),
                          _pharmacistData(title: 'السعر', hint: '10'),
                          PrimaryButton(
                            icon: Icons.add,
                            label: 'إضافة دواء جديد',
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _pharmacistData({required String title, required String hint}) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const SizedBox(height: 4),
        CustomTextField(
          hint: hint,
          // controller: _emailCtrl,
          validator: Validators.email,
          border: TextFieldBorder.input(),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
