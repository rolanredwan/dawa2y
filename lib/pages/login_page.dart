// LoginPage Class

// import 'package:first_flutter_application/pages/admin_page.dart';
import 'package:first_flutter_application/pages/pharmacist_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:first_flutter_application/widgets/border.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_text_filed.dart';
import '../widgets/primary_button.dart';
import '../utils/validators.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pushReplacementNamed('/pharmacist');
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
                    'ابحث عن دوائك بسهولة',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      wordSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      // Expanded(
                      //   child: TextButton(
                      //     style: TextButton.styleFrom(
                      //       backgroundColor: Color(0xFFFFFFFF),
                      //       padding: EdgeInsets.symmetric(vertical: 16),
                      //       shape: AppBorder.rounded(),
                      //     ),
                      // onPressed: () {
                          //   Navigator.of(context).push(
                          //     MaterialPageRoute(
                          //       // builder: (context) => AdminPage(),
                          //     ),
                          //   );
                          // },
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Image.asset(
                      //           "images/admin.jpg",
                      //           width: 32,
                      //           height: 32,
                      //         ),
                      //         const SizedBox(width: 8),
                      //         const Text(
                      //           'أدمن',
                      //           style: TextStyle(fontSize: 20),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(width: 8),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => PharmacistPage(),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: AppBorder.rounded(),
                          ),
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
                  const SizedBox(height: 40),
                  Column(
                    children: [
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
                      const SizedBox(height: 40),
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
                        hint: 'أدخل كلمة المرور',
                        obscure: true,
                        controller: _passCtrl,
                        validator: Validators.password,
                        border: TextFieldBorder.input(),
                      ),
                      const SizedBox(height: 40),
                      PrimaryButton(label: 'تسجيل الدخول', onPressed: _submit),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'ليس لديك حساب؟ ',
                            style: TextStyle(fontSize: 15),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const RegisterPage(),
                              ),
                            ),
                            child: const Text(
                              'سجل الآن',
                              style: TextStyle(
                                color: Color(0xFFC9A227),
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
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
}


