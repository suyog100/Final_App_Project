import 'package:finalproject/features/forgotPassword/data/model/forgot_model.dart';
import 'package:finalproject/features/forgotPassword/presentation/view/verification_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/common/biometric_auth.dart';
import '../viewmodel/auth_view_model.dart';
import '../../domain/entity/auth_entity.dart';
import '../view/register_view.dart';
import '../../../home/presentation/view/dashborad_test.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  //colors
  Color backgroundColor1 = const Color(0xffE9EAF7);
  Color backgroundColor2 = const Color(0xffF4EEF2);
  Color backgroundColor3 = const Color(0xffEBEBF2);
  Color backgroundColor4 = const Color(0xffE3EDF5);
  Color primaryColor = const Color(0xffD897FD);
  Color textColor1 = const Color(0xff353047);
  Color textColor2 = const Color(0xff6F6B7A);
  Color buttonColor = const Color(0xffFD6B68);

  final ValueNotifier<bool> obscurePasswordNotifier = ValueNotifier<bool>(true);
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authViewModelProvider);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              backgroundColor2,
              backgroundColor2,
              backgroundColor4,
            ],
          ),
        ),
        child: Form(
          key: _formKey,
          child: SafeArea(
              child: ListView(
            children: [
              SizedBox(height: size.height * 0.03),
              // Adding logo
              Image.asset(
                'assets/images/logo.png',
                height: 150,
                width: 150,
              ),

              SizedBox(height: size.height * 0.04),
              Text(
                "Hello Again!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 37,
                  color: textColor1,
                ),
              ),
              const SizedBox(height: 1),
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: "Don't have an Account? ",
                  style: TextStyle(
                    color: textColor2,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  children: [
                    TextSpan(
                      text: "Signup",
                      style: const TextStyle(
                        color: Colors.orangeAccent,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          ref
                              .read(authViewModelProvider.notifier)
                              .openRegisterView();
                        },
                    ),
                  ],
                ),
              ),

              SizedBox(height: size.height * 0.02),
              // for username and password
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 22,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: 'Email',
                    hintStyle: const TextStyle(
                      color: Colors.black45,
                      fontSize: 19,
                    ),
                    suffixIcon: Icon(
                      Icons.email,
                      size: 25,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    }
                    return null;
                  },
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                child: ValueListenableBuilder<bool>(
                  valueListenable: obscurePasswordNotifier,
                  builder: (context, obscurePassword, child) {
                    return TextFormField(
                      controller: _passwordController,
                      obscureText: obscurePassword,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 22,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: "Password",
                        hintStyle: const TextStyle(
                          color: Colors.black45,
                          fontSize: 19,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscurePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            obscurePasswordNotifier.value =
                                !obscurePasswordNotifier.value;
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 1),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: Text(
              //     "Recovery Password               ",
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 16,
              //       color: textColor2,
              //     ),
              //   ),
              // ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VerificationView(),
                    ),
                  );
                },
                child: const Text(
                  "Recovery Password",
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.02),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    // for log in button
                    SizedBox(
                      width: size.width,
                      child: ElevatedButton(
                        onPressed: authState.isLoading
                            ? null
                            : () async {
                                if (_formKey.currentState!.validate()) {
                                  String email = _emailController.text.trim();
                                  String password =
                                      _passwordController.text.trim();
                                  await ref
                                      .read(authViewModelProvider.notifier)
                                      .loginUser(email, password);
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orangeAccent,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 100,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: authState.isLoading
                            ? CircularProgressIndicator(color: Colors.white)
                            : const Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 2,
                          width: size.width * 0.2,
                          color: Colors.black12,
                        ),
                        Text(
                          "  Or continue with   ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: textColor2,
                            fontSize: 16,
                          ),
                        ),
                        Container(
                          height: 2,
                          width: size.width * 0.2,
                          color: Colors.black12,
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.03),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/google.png',
                              height: 30,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Connect with Google",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    //connect with facebook button
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/facebook.png',
                              height: 30,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              "Connect with Facebook",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: size.height * 0.07),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            ref
                                .read(authViewModelProvider.notifier)
                                .openRegisterView();
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.lightBlueAccent,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      ),
                      onPressed: () async {
                        final authenticate =
                            await BiometricAuth.authenticateWithBiometrics();
                        if (authenticate) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DashboardTest(),
                            ),
                          );
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.fingerprint,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text('Authenticate'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }

  Container socialIcon(image) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
      child: Image.asset(
        image,
        height: 35,
      ),
    );
  }
}
