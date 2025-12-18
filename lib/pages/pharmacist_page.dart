import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../models/medicine.dart';
import '../theme/app_colors.dart';
import '../widgets/border.dart';
import '../widgets/custom_text_filed.dart';
import '../widgets/primary_button.dart';

class PharmacistPage extends StatefulWidget {
  const PharmacistPage({super.key});

  @override
  State<PharmacistPage> createState() => _PharmacistPageState();
}

class _PharmacistPageState extends State<PharmacistPage> {
  final _tradeNameController = TextEditingController();
  final _scientificNameController = TextEditingController();
  final _classificationController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();

  List<Medicine> medicines = [];

  @override
  void dispose() {
    _tradeNameController.dispose();
    _scientificNameController.dispose();
    _classificationController.dispose();
    _priceController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

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
                          _medicineData(
                            title: 'الاسم التجاري',
                            hint: 'باراسيتامول',
                            controller: _tradeNameController,
                          ),
                          _medicineData(
                            title: 'الاسم العلمي',
                            hint: 'أسيتامينوفين',
                            controller: _scientificNameController,
                          ),
                          _medicineData(
                            title: 'الكمية',
                            hint: '200',
                            controller: _quantityController,
                          ),
                          _medicineData(
                            title: 'التصنيف',
                            hint: 'مسكنات',
                            controller: _classificationController,
                          ),
                          _medicineData(
                            title: 'السعر',
                            hint: '10',
                            controller: _priceController,
                          ),

                          PrimaryButton(
                            icon: Icons.add,
                            label: 'إضافة دواء جديد',
                            onPressed: () {
                              setState(() {
                                medicines.add(
                                  Medicine(
                                    tradName: _tradeNameController.text,
                                    price: _priceController.text,
                                    quantity: _quantityController.text,
                                    scientificName:
                                        _scientificNameController.text,
                                    classification:
                                        _classificationController.text,
                                  ),
                                );
                                _tradeNameController.clear();
                                _scientificNameController.clear();
                                _classificationController.clear();
                                _priceController.clear();
                                _quantityController.clear();
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      border: TableBorder.all(
                        color: AppColors.gold,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                      headingRowColor: WidgetStateProperty.all(AppColors.gold),
                      headingTextStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      columns: const [
                        DataColumn(label: Text('الاسم العلمي')),
                        DataColumn(label: Text('الاسم التجاري')),
                        DataColumn(label: Text('التصنيف')),
                        DataColumn(label: Text('الكمية')),
                        DataColumn(label: Text('السعر')),
                      ],
                      rows: medicines.map((medicine) {
                        return DataRow(
                          cells: [
                            DataCell(Text(medicine.scientificName)),
                            DataCell(Text(medicine.tradName)),
                            DataCell(Text(medicine.classification)),
                            DataCell(Text(medicine.quantity)),
                            DataCell(Text(medicine.price)),
                          ],
                        );
                      }).toList(),
                    ),
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
          border: TextFieldBorder.input(),
          controller: null,
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _medicineData({
    required String title,
    required String hint,
    required TextEditingController controller,
  }) {
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
          border: TextFieldBorder.input(),
          controller: controller,
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
