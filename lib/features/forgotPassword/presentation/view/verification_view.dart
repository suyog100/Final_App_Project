import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:finalproject/features/forgotPassword/presentation/viewmodel/forgot_viewmodel.dart';
import 'reset_password_view.dart';

class VerificationView extends ConsumerStatefulWidget {
  const VerificationView({Key? key}) : super(key: key);

  @override
  ConsumerState<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends ConsumerState<VerificationView> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final forgotPasswordViewModel =
        ref.watch(forgotPasswordViewModelProvider.notifier);

    return Scaffold(
      body: SafeArea(
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
                  'Eat tasty food',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange[400],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Password Recovery',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Enter your email to recover your password',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (emailController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Please enter your email')),
                      );
                    } else {
                      forgotPasswordViewModel
                          .sendForgotPasswordEmail(emailController.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ResetPasswordView(email: emailController.text)),
                      );
                    }
                  },
                  child: const Text('Sign In'),
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
    );
  }
}
