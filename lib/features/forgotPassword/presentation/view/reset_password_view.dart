import 'package:finalproject/features/forgotPassword/presentation/state/forgot_state.dart';
import 'package:finalproject/features/forgotPassword/presentation/viewmodel/forgot_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'success_view.dart';

class ResetPasswordView extends ConsumerStatefulWidget {
  final String email;

  const ResetPasswordView({Key? key, required this.email}) : super(key: key);

  @override
  ConsumerState<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends ConsumerState<ResetPasswordView> {
  final TextEditingController otpController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final ValueNotifier<bool> obscurePasswordNotifier = ValueNotifier<bool>(true);

  bool _validatePassword(String password) {
    return password.length > 6;
  }

  @override
  Widget build(BuildContext context) {
    final forgotPasswordState = ref.watch(forgotPasswordViewModelProvider);
    final forgotPasswordViewModel =
        ref.watch(forgotPasswordViewModelProvider.notifier);

    ref.listen<ForgotPasswordState>(forgotPasswordViewModelProvider,
        (previous, next) {
      if (next.isPasswordReset && !previous!.isPasswordReset) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Password reset successfully!')),
        );
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const SuccessView()),
        );
      }
    });

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Center(
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.orange[100],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.soup_kitchen_outlined,
                      size: 40,
                      color: Colors.orange[400],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    'COOK',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[400],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Password must be more than 6 characters.',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: otpController,
                  decoration: InputDecoration(
                    labelText: 'OTP',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                const SizedBox(height: 20),
                ValueListenableBuilder<bool>(
                  valueListenable: obscurePasswordNotifier,
                  builder: (context, obscurePassword, child) {
                    return Column(
                      children: [
                        TextField(
                          controller: newPasswordController,
                          decoration: InputDecoration(
                            labelText: 'New Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            suffixIcon: IconButton(
                              icon: Icon(
                                obscurePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                obscurePasswordNotifier.value =
                                    !obscurePasswordNotifier.value;
                              },
                            ),
                          ),
                          obscureText: obscurePassword,
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: confirmPasswordController,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            suffixIcon: IconButton(
                              icon: Icon(
                                obscurePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                obscurePasswordNotifier.value =
                                    !obscurePasswordNotifier.value;
                              },
                            ),
                          ),
                          obscureText: obscurePassword,
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 20),
                if (forgotPasswordState.errorMessage.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  Text(
                    forgotPasswordState.errorMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
                ],
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (otpController.text.isEmpty ||
                          newPasswordController.text.isEmpty ||
                          confirmPasswordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Please fill in all the fields')),
                        );
                      } else if (newPasswordController.text !=
                          confirmPasswordController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Passwords do not match')),
                        );
                      } else if (!_validatePassword(
                          newPasswordController.text)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(
                                  'Password must be more than 6 characters')),
                        );
                      } else {
                        forgotPasswordViewModel.verifyOtpAndResetPassword(
                          widget.email,
                          otpController.text,
                          newPasswordController.text,
                        );
                      }
                    },
                    child: forgotPasswordState.isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text('Continue'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
