import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/auth_controller.dart';

class ConfirmCodeScreen extends StatefulWidget {
  final String email;

  const ConfirmCodeScreen({super.key, required this.email});

  @override
  State<ConfirmCodeScreen> createState() => _ConfirmCodeScreenState();
}

class _ConfirmCodeScreenState extends State<ConfirmCodeScreen> {
  final codeController = TextEditingController();
  final authController = AuthController();

  bool isLoading = false;

  Future<void> confirm() async {
    if (codeController.text.isEmpty) return;

    setState(() => isLoading = true);

    try {
      final result = await authController.confirmSignUp(
        email: widget.email,
        code: codeController.text.trim(),
      );

      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(result['message'] ?? "Confirmed")));

      /// 🔥 NEXT → LOGIN
      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Confirm Code")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Enter code sent to ${widget.email}",
              style: GoogleFonts.montserrat(fontSize: 16),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: codeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter code",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: isLoading ? null : confirm,
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("CONFIRM"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
