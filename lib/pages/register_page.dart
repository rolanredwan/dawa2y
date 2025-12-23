// RegisterPage Class
import 'package:first_flutter_application/pages/pharmacist_page.dart';
import 'package:first_flutter_application/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import '../widgets/border.dart';
import '../widgets/custom_text_filed.dart';
import '../widgets/primary_button.dart';
import '../utils/validators.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Alert
      QuickAlert.show(
        context: context,
        type: QuickAlertType.info,
        title: '',
        text: 'تم تسجيل الدخول بنجاح!',
        autoCloseDuration: Duration(seconds: 3),
        confirmBtnText: 'حسناً',
        confirmBtnColor: Color(0xECEDCA61),
      );
      // Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text(
                    'أنشئ حسابك وابدأ البحث',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      wordSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => PharmacistPage(),
                              ),
                            );
                          },
                          color: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: AppBorder.rounded(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "images/capsule-pills.svg",
                                width: 32,
                                height: 32,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'صيدلاني',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Align(
                    alignment: Alignment.centerRight,
                    child: const Text(
                      'الاسم الكامل',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  CustomTextField(
                    hint: 'مثال: محمد أحمد',
                    controller: _nameCtrl,
                    validator: Validators.required,
                    border: TextFieldBorder.input(),
                  ),
                  const SizedBox(height: 25),
                  Align(
                    alignment: Alignment.centerRight,
                    child: const Text(
                      'البريد الالكتروني',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  CustomTextField(
                    hint: 'email@gmail.com',
                    controller: _emailCtrl,
                    validator: Validators.email,
                    border: TextFieldBorder.input(),
                  ),
                  const SizedBox(height: 25),
                  Align(
                    alignment: Alignment.centerRight,
                    child: const Text(
                      'كلمة المرور',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  CustomTextField(
                    hint: 'يجب أن تكون 6 خانات على الأقل ',
                    obscure: true,
                    controller: _passCtrl,
                    validator: Validators.password,
                    border: TextFieldBorder.input(),
                  ),
                  const SizedBox(height: 25),
                  Align(
                    alignment: Alignment.centerRight,
                    child: const Text(
                      'تأكيد كلمة المرور',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  CustomTextField(
                    hint: 'أعد إدخال كلمة المرور',
                    obscure: true,
                    controller: _confirmCtrl,
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      if (v.trim() != _passCtrl.text.trim()) {
                        return 'كلمة المرور غير متطابقة';
                      }
                      return null;
                    },
                    border: TextFieldBorder.input(),
                  ),
                  const SizedBox(height: 25),
                  PrimaryButton(
                    label: 'تسجيل جديد',
                    onPressed: () => _submit(),
                  ), //
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'لديك حساب بالفعل؟ ',
                        style: TextStyle(fontSize: 15),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const LoginPage()),
                        ),
                        child: const Text(
                          'تسجيل الدخول',
                          style: TextStyle(
                            color: AppColors.gold,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
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
}
